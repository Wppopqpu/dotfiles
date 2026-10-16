<div class="mw-content-ltr mw-parser-output" lang="zh-Hans-CN" dir="ltr">

<div class="aside archwiki-template-box archwiki-template-box-note noexcerpt">

**翻译状态：**

- 本文（或部分内容）译自 <a href="https://wiki.archlinux.org/title/Ccache" class="extiw" title="arch:Ccache">Ccache</a>，最近一次同步于 2022-10-25，若英文版本有所<a href="https://wiki.archlinux.org/title/Ccache?diff=0&amp;oldid=720873" class="external text" rel="nofollow">更改</a>，则您可以帮助同步与[翻译](../zh-cn/Help:%E7%BF%BB%E8%AF%91.html "Help:翻译")更改的内容。
- 您可以在 <a href="https://wiki.archlinux.org/title/Ccache_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)?action=history" class="external text" rel="nofollow">ArchWiki 的对应页面</a>找到本文翻译的**原始**修订历史。
- 本文可能与英文原文存在出入。

</div>

<a href="https://ccache.dev/" class="external text" rel="nofollow">Ccache</a> 是一个编译器的包装，它将已编译的二进制文件存储在指定位置，并将其提供给用户，以加快同一代码的重新编译。虽然第一次编译程序可能要时间长些，但随后的编译会快得多，因为不需要进行重复编译，只需要对之前存储的二进制文件进行查找。`ccache` 与 <a href="../zh-cn/GNU_Compiler_Collection.html" class="mw-redirect" title="GCC">GCC</a> 和 [Clang](../zh-cn/Clang.html "Clang") 兼容。

<div class="mw-heading mw-heading2">

## <span id=".E5.AE.89.E8.A3.85"></span>安装

</div>

[安装](../zh-cn/Pacman.html "Pacman")位于<a href="../zh-cn/Official_repositories.html" class="mw-redirect" title="Official repositories">官方软件仓库</a>的 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=ccache" class="external text" rel="nofollow">ccache</a></span><sup><span class="small">包</span></sup></span> 软件包。

<div class="mw-heading mw-heading2">

## <span id=".E9.85.8D.E7.BD.AE"></span>配置

</div>

可以用配置文件修改默认行为，优先级由高到低为:

1.  环境变量
2.  单个 Cache 的配置文件 (`$HOME/.config/ccache/ccache.conf`)
3.  系统配置文件 (`/etc/ccache.conf`)

详见 <span class="plainlinks archwiki-template-man" title="$ man 1 ccache"><a href="https://man.archlinux.org/man/ccache.1" class="external text" rel="nofollow">ccache(1)</a></span>。

<div class="mw-heading mw-heading3">

### <span id=".E4.B8.BA_makepkg_.E5.90.AF.E7.94.A8_ccache"></span>为 makepkg 启用 ccache

</div>

要在 makepkg 启用 *ccache*，请编辑 `/etc/makepkg.conf`. 在 `BUILDENV` 中删除 ccache 前的感叹号：

 BUILDENV=(fakeroot !distcc color ccache !xdelta)\

<div class="mw-heading mw-heading3">

### <span id=".E5.9C.A8.E5.91.BD.E4.BB.A4.E8.A1.8C.E4.B8.AD.E5.90.AF.E7.94.A8"></span>在命令行中启用

</div>

如果要从中命令行编译而不是生成软件包，同样可以使用 *ccache* 提高速度。

为此，你可以在每个编译命令前加上 `ccache`。

\$ ccache cc hello_world.c\

或者修改你的 `$PATH`，在编译器的路径之前加上 *ccache* 的二进制文件目录。

export PATH="/usr/lib/ccache/bin/:\$PATH"\

你他可以把它设置到你的环境变量里，方便多次使用。

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**如果用这个方法，将同时对 *makepkg* 启用 *ccache*。

</div>

\

<div class="mw-heading mw-heading3">

### <span id=".E5.90.AF.E7.94.A8_colorgcc_.E6.94.AF.E6.8C.81"></span>启用 colorgcc 支持

</div>

由于 colorgcc 也是一个编译器的包装，所以需要确保包装的调用顺序是正确的。

export PATH="/usr/lib/colorgcc/bin/:\$PATH"    # 按照正常安装 colorgcc 的情况保持不变（不要添加 *ccache*）\

export CCACHE_PATH="/usr/bin"                 # 告诉 *ccache* 只使用这里的编译器\

*colorgcc* 需要调用 *ccache* 而不是真正的编译器。编辑 `/etc/colorgcc/colorgccrc` 修改所有 `/usr/bin` 路径为 `/usr/lib/ccache/bin`：

/etc/colorgcc/colorgccrc

g++: /usr/lib/ccache/bin/g++\
gcc: /usr/lib/ccache/bin/gcc\
c++: /usr/lib/ccache/bin/g++\
cc: /usr/lib/ccache/bin/gcc\
g77:/usr/bin/g77\
f77:/usr/bin/g77\
gcj:/usr/bin/gcj\

新版本的 *ccache* 在设置 `GCC_COLORS` 时，将始终为GCC启用颜色支持，同时 Clang 默认启动多色输出。如果输出对象不是 TTY，*ccache* 会让编译器生成颜色，将它们保存在缓存中，但从输出中剥离。在统一 <a href="https://github.com/ccache/ccache/issues/224" class="external text" rel="nofollow">-fdiagnostics-color</a> 方面仍然存在一些问题。

<div class="mw-heading mw-heading2">

## Misc

</div>

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**此章节未进行翻译。

</div>

<div class="mw-heading mw-heading3">

### <span id=".E4.BF.AE.E6.94.B9.E7.BC.93.E5.AD.98.E7.9B.AE.E5.BD.95"></span>修改缓存目录

</div>

可以将缓存目录 `~/.cache/.ccache` 配置到其它地方，例如 SSD 或 <a href="/wzh/index.php?title=Ramdisk&amp;action=edit&amp;redlink=1" class="new" title="Ramdisk（页面不存在）">ramdisk</a>:

要在修改当前 shell 的缓存目录：

\$ export CCACHE_DIR=/ramdisk/ccache\

要修改默认缓存目录：

~/.config/.ccache/ccache.conf

cache_dir = /ramdisk/ccache

<div class="mw-heading mw-heading3">

### <span id=".E8.AE.BE.E7.BD.AE.E6.9C.80.E5.A4.A7.E7.BC.93.E5.AD.98.E5.A4.A7.E5.B0.8F"></span>设置最大缓存大小

</div>

默认值是 5G，可以通过配置修改：

/home/\<user\>/.ccache/ccache.conf

max_size = 2.0G

<div class="mw-heading mw-heading3">

### <span id=".E9.80.9A.E8.BF.87.E7.8E.AF.E5.A2.83.E5.8F.98.E9.87.8F.E7.A6.81.E7.94.A8.E7.BC.93.E5.AD.98"></span>通过环境变量禁用缓存

</div>

如果你想只在当前的shell中禁用 *ccache*:

 \$ export CCACHE_DISABLE=1\

<div class="mw-heading mw-heading3">

### CLI

</div>

此外可以使用 ‘’ccache‘’ 命令行工具。

显示统计数据:

\$ ccache -s\

清空缓存:

\$ ccache -C\

<div class="mw-heading mw-heading3">

### makechrootpkg

</div>

<span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=devtools" class="external text" rel="nofollow">devtools</a></span><sup><span class="small">包</span></sup></span> 中 makechrootpkg 也可以使用 *ccache*，要在清理 chroot 后保留缓存，可以使用 *makechrootpkg* 的 `-d` 选项将 cache 目录从普通系统绑定到 chroot: \
\$ mkdir /path/of/chroot/ccache\

\$ makechrootpkg -d /path/to/cache/:/ccache -r /path/of/chroot -- CCACHE_DIR=/ccache\

这样 chroot 中就可以和正常系统中一样配置和使用 *ccache*.

<div class="mw-heading mw-heading2">

## <span id=".E6.B3.A8.E6.84.8F.E4.BA.8B.E9.A1.B9"></span>注意事项

</div>

*ccache* 只有在编译*完全相同*的源代码时才有效。(或者说是预处理过的源码）

在 Gentoo Linux 社区，一个基于源代码的发行版，*ccache* 因其安慰剂效应、编译失败（由于不受欢迎的遗留对象）等而臭名昭著。Gentoo要求在报告编译失败之前关闭 *ccache*。参见 <a href="https://wiki.gentoo.org/wiki/Handbook:Parts/Working/Features#Caching_compilation_objects" class="extiw" title="gentoo:Handbook:Parts/Working/Features">Gentoo:Handbook:Parts/Working/Features#Caching compilation objects</a> 和 <a href="https://flameeyes.blog/2008/06/21/debunking-ccache-myths/" class="external text" rel="nofollow">the blog post</a> 题为 "Debunking ccache myths"，作者是 Diego Pettenò，一位前 Gentoo 开发者。

<div class="mw-heading mw-heading2">

## <span id=".E5.8F.82.E9.98.85"></span>参阅

</div>

- <a href="https://ccache.dev/manual/latest.html" class="external text" rel="nofollow">ccache manual</a>

</div>
