#!/usr/bin/env python3
"""
修复损坏的EPUB文件。

问题诊断：
  1. ZIP中央目录(Central Directory)完全缺失 — 任何ZIP/EPUB阅读器都无法读取
  2. EPUB结构文件缺失 — 没有 META-INF/container.xml、content.opf、toc.ncx
  3. 所有文件重复多次 — 同一文件被写入多次
  4. 尾部图片数据截断 — cover.jpg 数据超出文件末尾 ~370KB
  5. 6个图片的deflate数据损坏

修复策略：
  - 去重：每个文件名只保留第一个可成功解压的副本
  - 补全EPUB结构：生成 container.xml、content.opf、toc.ncx
  - 跳过损坏图片：替换为1x1像素占位图
  - 重建ZIP中央目录和EOCD
"""

import struct
import zlib
import os
import sys
import glob
import html as html_module


# ── EPUB 模板文件 ──────────────────────────────────────────────

CONTAINER_XML = b"""\
<?xml version="1.0" encoding="UTF-8"?>
<container version="1.0" xmlns="urn:oasis:names:tc:opendocument:xmlns:container">
  <rootfiles>
    <rootfile full-path="content.opf" media-type="application/oebps-package+xml"/>
  </rootfiles>
</container>
"""

PLACEHOLDER_JPG = (
    b'\xff\xd8\xff\xe0'  # SOI + APP0 marker
    + b'\x00\x10JFIF\x00\x01\x01\x00\x00\x01\x00\x01\x00\x00'
    + b'\xff\xdb\x00C\x00\x08\x06\x06\x07\x06\x05\x08\x07\x07'
    + b'\x07\t\t\x08\n\x0c\x14\r\x0c\x0b\x0b\x0c\x19\x12\x13'
    + b'\x0f\x14\x1d\x1a\x1f\x1e\x1d\x1a\x1c\x1c $.\' ",#\x1c'
    + b'\x1c(7),01444\x1f\'9=82<.342\x02 \xff\xc0\x00\x0b\x08'
    + b'\x00\x01\x00\x01\x01\x01\x11\x00\xff\xc4\x00\x1f\x00'
    + b'\x00\x01\x05\x01\x01\x01\x01\x01\x01\x00\x00\x00\x00\x00'
    + b'\x00\x00\x00\x01\x02\x03\x04\x05\x06\x07\x08\t\n\x0b'
    + b'\xff\xc4\x00\xb5\x10\x00\x02\x01\x03\x03\x02\x04\x03'
    + b'\x05\x05\x04\x04\x00\x00\x01}\x01\x02\x03\x00\x04\x11'
    + b'\x05\x12!1A\x06\x13Qa\x07"q\x142\x81\x91\xa1\x08#B'
    + b'\xb1\xc1\x15R\xd1\xf0$3br\x82\t\n\x16\x17\x18\x19'
    + b'\x1a%&\'()*456789:CDEFGHIJSTUVWXYZ'
    + b'cdefghijstuvwxyz'
    + b'\x83\x84\x85\x86\x87\x88\x89\x8a\x92\x93\x94\x95\x96'
    + b'\x97\x98\x99\x9a\xa2\xa3\xa4\xa5\xa6\xa7\xa8\xa9\xaa'
    + b'\xb2\xb3\xb4\xb5\xb6\xb7\xb8\xb9\xba'
    + b'\xc2\xc3\xc4\xc5\xc6\xc7\xc8\xc9\xca'
    + b'\xd2\xd3\xd4\xd5\xd6\xd7\xd8\xd9\xda'
    + b'\xe1\xe2\xe3\xe4\xe5\xe6\xe7\xe8\xe9\xea'
    + b'\xf1\xf2\xf3\xf4\xf5\xf6\xf7\xf8\xf9\xfa'
    + b'\xff\xda\x00\x08\x01\x01\x00\x00?\x00'
    + b'\x7b\x94\x11\x00\x00\x00\x00\xff\xd9'
)


# ── 核心修复逻辑 ────────────────────────────────────────────────

def scan_local_headers(data: bytes) -> list:
    """扫描所有ZIP本地文件头。"""
    entries = []
    pos = 0
    while pos < len(data) - 30:
        idx = data.find(b'PK\x03\x04', pos)
        if idx == -1:
            break
        (ver, flags, method, mtime, mdate, crc,
         comp_size, uncomp_size, fname_len, extra_len
         ) = struct.unpack_from('<HHHHHIIIHH', data, idx + 4)
        fname = data[idx + 30 : idx + 30 + fname_len]
        data_start = idx + 30 + fname_len + extra_len
        entries.append({
            'offset': idx, 'fname': fname, 'comp_size': comp_size,
            'uncomp_size': uncomp_size, 'method': method, 'flags': flags,
            'mtime': mtime, 'mdate': mdate, 'crc': crc,
            'data_start': data_start,
        })
        pos = idx + 4
    return entries


def decompress_entry(data: bytes, entry: dict) -> bytes:
    """解压单个条目，失败返回 None。"""
    raw = data[entry['data_start'] : entry['data_start'] + entry['comp_size']]
    try:
        if entry['method'] == 8:
            return zlib.decompress(raw, -15)
        return raw
    except Exception:
        return None


def is_valid_image(content: bytes, fname: str) -> bool:
    """检查解压后的内容是否是有效的图片文件。"""
    if not fname.startswith('image/'):
        return True
    if fname.lower().endswith(('.jpg', '.jpeg')):
        return content[:2] == b'\xff\xd8' and len(content) > 100
    if fname.lower().endswith('.png'):
        return content[:4] == b'\x89PNG'
    if fname.lower().endswith('.gif'):
        return content[:3] == b'GIF'
    if fname.lower().endswith('.webp'):
        return content[:4] == b'RIFF'
    return len(content) > 0


def deduplicate_entries(entries: list, data: bytes) -> list:
    """去重：每个文件名在所有副本中找到第一个解压成功且内容有效的，优先保留完好的。"""
    from collections import OrderedDict
    copies = OrderedDict()
    for e in entries:
        name = e['fname'].decode('utf-8', errors='replace')
        copies.setdefault(name, []).append(e)

    unique = []
    for name, group in copies.items():
        best = None
        for e in group:
            content = decompress_entry(data, e)
            if content is not None and is_valid_image(content, name):
                e['content'] = content
                best = e
                break
        if best is None:
            group[0]['content'] = None
            best = group[0]
        unique.append(best)
    return unique


def parse_page_number(html_bytes: bytes) -> int:
    """从 HTML <title> 中提取页码，用于排序。cover排最前，theend排最后。"""
    try:
        text = html_module.unescape(html_bytes.decode('utf-8', errors='replace'))
        import re
        title_match = re.search(r'<title>(.*?)</title>', text, re.DOTALL)
        if title_match:
            title = title_match.group(1).strip()
            if '封面' in title or 'cover' in title.lower():
                return -1
            if 'end' in title.lower():
                return 99999
        m = re.search(r'第\s*(\d+)\s*頁', text)
        if m:
            return int(m.group(1))
    except Exception:
        pass
    return 0


def build_content_opf(entries: list) -> bytes:
    """根据内容文件生成 content.opf。"""
    html_files = sorted(
        [e for e in entries if e['fname'].decode().endswith('.html')],
        key=lambda e: parse_page_number(e['content'])
    )
    image_files = [e for e in entries if e['fname'].decode().startswith('image/')]
    css_files = [e for e in entries if e['fname'].decode().startswith('css/')]

    lines = [
        '<?xml version="1.0" encoding="UTF-8"?>',
        '<package xmlns="http://www.idpf.org/2007/opf" version="2.0" unique-identifier="id">',
        '  <metadata xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:opf="http://www.idpf.org/2007/opf">',
        '    <dc:title>蘑菇的擬態日常 卷01</dc:title>',
        '    <dc:language>zh</dc:language>',
        '    <dc:identifier id="id" opf:scheme="UUID">urn:uuid:420dea90-dc40-4a51-9c3b-cbd76284e0b0</dc:identifier>',
        '  </metadata>',
        '  <manifest>',
        '    <item id="ncx" href="toc.ncx" media-type="application/x-dtbncx+xml"/>',
    ]

    for i, e in enumerate(html_files):
        name = e['fname'].decode()
        lines.append(f'    <item id="page{i}" href="{name}" media-type="application/xhtml+xml"/>')

    for e in image_files:
        name = e['fname'].decode()
        item_id = os.path.basename(name).replace('.', '-')
        ext = name.rsplit('.', 1)[-1].lower()
        mime = {'jpg': 'image/jpeg', 'jpeg': 'image/jpeg', 'png': 'image/png'}.get(ext, 'image/jpeg')
        lines.append(f'    <item id="{item_id}" href="{name}" media-type="{mime}"/>')

    for e in css_files:
        name = e['fname'].decode()
        lines.append(f'    <item id="style" href="{name}" media-type="text/css"/>')

    lines.append('  </manifest>')
    lines.append('  <spine toc="ncx">')

    for i, e in enumerate(html_files):
        name = e['fname'].decode()
        lines.append(f'    <itemref idref="page{i}"/>')

    lines.append('  </spine>')
    lines.append('</package>')
    return '\n'.join(lines).encode('utf-8')


def build_toc_ncx(entries: list) -> bytes:
    """生成 toc.ncx 目录文件。"""
    html_files = sorted(
        [e for e in entries if e['fname'].decode().endswith('.html')],
        key=lambda e: parse_page_number(e['content'])
    )

    lines = [
        '<?xml version="1.0" encoding="UTF-8"?>',
        '<ncx xmlns="http://www.daisy.org/z3986/2005/ncx/" version="2005-1">',
        '  <head>',
        '    <meta name="dtb:uid" content="urn:uuid:420dea90-dc40-4a51-9c3b-cbd76284e0b0"/>',
        '  </head>',
        '  <docTitle><text>蘑菇的擬態日常 卷01</text></docTitle>',
        '  <navMap>',
    ]

    for i, e in enumerate(html_files):
        name = e['fname'].decode()
        page = parse_page_number(e['content'])
        title = f'第 {page} 頁' if page else f'第 {i + 1} 頁'
        lines.append(f'    <navPoint id="navPoint-{i + 1}" playOrder="{i + 1}">')
        lines.append(f'      <navLabel><text>{title}</text></navLabel>')
        lines.append(f'      <content src="{name}"/>')
        lines.append(f'    </navPoint>')

    lines.append('  </navMap>')
    lines.append('</ncx>')
    return '\n'.join(lines).encode('utf-8')


def raw_deflate_compress(data: bytes) -> bytes:
    """使用raw deflate (RFC 1951) 压缩，ZIP文件要求的格式。"""
    co = zlib.compressobj(zlib.Z_DEFAULT_COMPRESSION, zlib.DEFLATED, -15)
    return co.compress(data) + co.flush()


def rebuild_epub(entries: list, output_path: str):
    """重建完整的EPUB文件。"""
    buf = bytearray()

    # 所有要写入的文件（按EPUB标准顺序：mimetype在前）
    file_list = []

    # 1. mimetype（不压缩）
    mimetype_entry = next((e for e in entries if e['fname'] == b'mimetype'), None)
    if mimetype_entry:
        file_list.append(('mimetype', b'application/epub+zip', 0))

    # 2. META-INF/container.xml
    file_list.append(('META-INF/container.xml', CONTAINER_XML, 8))

    # 3. content.opf
    content_opf = build_content_opf(entries)
    file_list.append(('content.opf', content_opf, 8))

    # 4. toc.ncx
    toc_ncx = build_toc_ncx(entries)
    file_list.append(('toc.ncx', toc_ncx, 8))

    # 5. 所有内容文件
    name_to_entry = {}
    for e in entries:
        name = e['fname'].decode('utf-8', errors='replace')
        if name not in name_to_entry:
            name_to_entry[name] = e

    for name in sorted(name_to_entry.keys()):
        if name in ('mimetype',):
            continue
        e = name_to_entry[name]
        content = e.get('content', b'')
        file_list.append((name, content, 8))

    # 第一遍：压缩所有文件，收集元数据
    prepared = []
    for fname, content, method in file_list:
        fname_bytes = fname.encode('utf-8')
        crc = zlib.crc32(content) & 0xffffffff
        if method == 0:
            compressed = content
        else:
            compressed = raw_deflate_compress(content)
        prepared.append((fname_bytes, content, compressed, crc, method))

    # 第二遍：写入本地文件头 + 数据，记录偏移
    offsets = {}
    for fname_bytes, content, compressed, crc, method in prepared:
        comp_size = len(compressed)
        uncomp_size = len(content)

        local_header = struct.pack(
            '<IHHHHHIIIHH',
            0x04034b50,       # 签名
            20,               # 版本
            0,                # 标志
            method,           # 压缩方法
            0, 0,             # 时间日期
            crc,
            comp_size,
            uncomp_size,
            len(fname_bytes),
            0,                # 额外字段长度
        )

        offsets[fname_bytes] = len(buf)
        buf.extend(local_header)
        buf.extend(fname_bytes)
        buf.extend(compressed)

    # 中央目录
    cd_offset = len(buf)
    for fname_bytes, content, compressed, crc, method in prepared:
        cd_header = struct.pack(
            '<IHHHHHHIIIHHHHHII',
            0x02014b50,
            20, 20,
            0, method, 0, 0,
            crc, len(compressed), len(content),
            len(fname_bytes), 0, 0, 0, 0,
            0, offsets[fname_bytes]
        )
        buf.extend(cd_header)
        buf.extend(fname_bytes)

    cd_size = len(buf) - cd_offset

    # 中央目录结束记录
    eocd = struct.pack(
        '<IHHHHIIH',
        0x06054b50, 0, 0,
        len(prepared), len(prepared),
        cd_size, cd_offset, 0
    )
    buf.extend(eocd)

    with open(output_path, 'wb') as f:
        f.write(buf)

    return len(prepared)


# ── 主入口 ──────────────────────────────────────────────────────

def fix_one(src_path: str):
    with open(src_path, 'rb') as f:
        data = f.read()

    all_entries = scan_local_headers(data)
    if not all_entries:
        print(f'  [失败] 未找到ZIP本地文件头')
        return

    unique = deduplicate_entries(all_entries, data)
    n_replaced = 0
    for e in unique:
        name = e['fname'].decode('utf-8', errors='replace')
        if name.startswith('image/') and e['content'] is None:
            e['content'] = PLACEHOLDER_JPG
            n_replaced += 1

    dst = src_path.replace('.epub', '-fixed.epub')
    count = rebuild_epub(unique, dst)
    print(f'  [完成] {count} 个文件, 已保存到 {os.path.basename(dst)}')
    if n_replaced:
        print(f'  [注意] {n_replaced} 个损坏图片已替换为占位图')


if __name__ == '__main__':
    paths = sys.argv[1:]
    if not paths:
        paths = glob.glob('**/*.epub', recursive=True)
        paths = [p for p in paths if '-fixed.epub' not in p]

    for p in paths:
        print(f'修复: {os.path.basename(p)}')
        try:
            fix_one(p)
        except Exception as ex:
            print(f'  [失败] {ex}')
