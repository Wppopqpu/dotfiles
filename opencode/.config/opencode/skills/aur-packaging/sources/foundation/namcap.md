<div class="mw-content-ltr mw-parser-output" lang="zh-Hans-CN" dir="ltr">

<div class="aside archwiki-template-box archwiki-template-box-note noexcerpt">

**翻译状态：**

- 本文（或部分内容）译自 <a href="https://wiki.archlinux.org/title/namcap" class="extiw" title="arch:namcap">namcap</a>，最近一次同步于 2025-01-25，若英文版本有所<a href="https://wiki.archlinux.org/title/namcap?diff=0&amp;oldid=825893" class="external text" rel="nofollow">更改</a>，则您可以帮助同步与[翻译](../zh-cn/Help:%E7%BF%BB%E8%AF%91.html "Help:翻译")更改的内容。
- 您可以在 <a href="https://wiki.archlinux.org/title/namcap_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)?action=history" class="external text" rel="nofollow">ArchWiki 的对应页面</a>找到本文翻译的**原始**修订历史。
- 本文可能与英文原文存在出入。

</div>

<div class="archwiki-template-meta-related-articles-start">

相关文章

- [创建软件包](../zh-cn/%E5%88%9B%E5%BB%BA%E8%BD%AF%E4%BB%B6%E5%8C%85.html "创建软件包")
- [pacman](../zh-cn/Pacman.html "Pacman")
- [PKGBUILD](../zh-cn/PKGBUILD.html "PKGBUILD")

</div>

<a href="https://gitlab.archlinux.org/pacman/namcap" class="external text" rel="nofollow">namcap</a> 是用于检查二进制软件包和源代码 [PKGBUILD](../zh-cn/PKGBUILD.html "PKGBUILD") 中常见的打包错误的一个 [Arch Linux](../zh-cn/Arch_Linux.html "Arch Linux") [工具](../zh-cn/Category:Arch_%E9%A1%B9%E7%9B%AE.html "Category:Arch 项目")。

<div class="mw-heading mw-heading2">

## <span id=".E5.AE.89.E8.A3.85"></span>安装

</div>

<a href="../zh-cn/Help:%E9%98%85%E8%AF%BB.html#%E5%AE%89%E8%A3%85%E8%BD%AF%E4%BB%B6%E5%8C%85" class="mw-redirect" title="安装">安装</a> <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=namcap" class="external text" rel="nofollow">namcap</a></span><sup><span class="small">包</span></sup></span>。

<div class="mw-heading mw-heading2">

## <span id=".E7.94.A8.E6.B3.95"></span>用法

</div>

对某一文件（可为 `PKGBUILD` 或包二进制文件如 *`包名`*`.tar.zst`）运行 namcap：

\$ namcap *文件路径*\

使用 `--info`（`-i`）标志运行 namcap 以输出额外信息：

\$ namcap --info *文件路径*\

namcap 使用一种“标签”系统来分类输出。标签分为三种类型：“错误”（error，表示为 `E`）、“警告”（warning，表示为 `W`）和“信息”（informational，表示为 `I`）。错误十分重要，必须立即修复，其通常有关安全性不充分、缺少许可证或权限问题。

通常，namcap 会打印出一个人类可读的说明（可能包含修复问题的建议）。要使输出更容易由程序解析，向 namcap 传递 `--machine-readable`（`-m`）标志。

“标签文件” `/usr/share/namcap/namcap-tags`（<a href="https://gitlab.archlinux.org/pacman/namcap/-/blob/master/namcap-tags" class="external text" rel="nofollow">在线源</a>）指定了与代码中使用的带连字符标签相对应的人类可读描述（以 `#` 开头的行被视为注释）：

\# 注释\
machine-parsable-tag %s :: 标签 %s 的人类可读描述\

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**

- `::`（双冒号）用于分隔机器可读的标签和人类可读的描述。
- `%s` 是一个格式说明符（format specifier），详见[\#创建模块](#%E5%88%9B%E5%BB%BA%E6%A8%A1%E5%9D%97)。

</div>

更多信息请参阅 <span class="plainlinks archwiki-template-man" title="$ man 1 namcap"><a href="https://man.archlinux.org/man/namcap.1" class="external text" rel="nofollow">namcap(1)</a></span>、<a href="https://gitlab.archlinux.org/pacman/namcap#namcap" class="external text" rel="nofollow">README</a> 和 <a href="https://gitlab.archlinux.org/pacman/namcap/blob/master/NEWS" class="external text" rel="nofollow">NEWS</a>。

<div class="mw-heading mw-heading2">

## <span id=".E5.88.9B.E5.BB.BA.E6.A8.A1.E5.9D.97"></span>创建模块

</div>

namcap 主程序（`namcap.py`）接受一个包文件或 `PKGBUILD` 作为参数，并创建一个 pkginfo 对象，然后将其传递给在 `__tarball__` 和 `__pkgbuild__` 中定义的一系列规则。自定义的模块需要添加到适当的数组中：

- `__tarball__` 定义处理二进制包的规则，
- `__pkgbuild__` 定义处理 `PKGBUILD` 的规则。

一个示例的 namcap 模块如下所示：

namcap/url.py

import pacman\
\
class package:\
    def short_name(self):\
        return "url"\
\
    def long_name(self):\
        return "Verifies url is included in a PKGBUILD"\
\
    def prereq(self):\
        return ""\
\
    def analyze(self, pkginfo, tar):\
        ret = \[\[\], \[\], \[\]\]\
        if not hasattr(pkginfo, 'url'):\
            ret\[0\].append(("missing-url", ()))\
        return ret\
\
    def type(self):\
        return "pkgbuild"\

每个 namcap 模块必须具有以下方法：

- `short_name(self)`⸺返回一个模块短名称的字符串。通常，这与模块文件的 <span class="plainlinks archwiki-template-man" title="$ man 1 basename"><a href="https://man.archlinux.org/man/basename.1" class="external text" rel="nofollow">basename(1)</a></span>（去除扩展名的文件名）相同。

<!-- -->

- `long_name(self)`⸺返回一个包含模块简明描述的字符串。此描述会在使用 `namcap --rules=`*`规则列表`* 列出所有规则时使用。

<!-- -->

- `prereq(self)`⸺返回一个包含模块正常运行所需先决条件的字符串。对于处理 `PKGBUILD` 的模块，通常是空字符串（`""`）；对于处理包文件的模块，则是`"tar"`。如果在进一步处理之前需要将包内容提取到临时目录，则应指定`"extract"`。

<!-- -->

- `analyze(self, pkginfo, tar)`⸺返回一个包含三个子列表的列表，三个子列表分别对应“错误”、“警告”和“信息”标签。每个标签列表的成员应该是一个元组，包含两个部分：标签的短形式（上文提到的带连字符标签，可带有适当格式说明符（format specifier，如 `%s`））以及格式说明符所对应的参数元组。

<!-- -->

- `type(self)`⸺对于处理 `PKGBUILD` 的模块，返回 `"pkgbuild"`；对于处理二进制包文件的模块，返回 `"tarball"`。

</div>
