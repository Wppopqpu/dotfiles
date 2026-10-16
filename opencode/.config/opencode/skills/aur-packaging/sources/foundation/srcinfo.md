<div class="mw-content-ltr mw-parser-output" lang="zh-Hans-CN" dir="ltr">

<div class="aside archwiki-template-box archwiki-template-box-note noexcerpt">

**翻译状态：**

- 本文（或部分内容）译自 <a href="https://wiki.archlinux.org/title/.SRCINFO" class="extiw" title="arch:.SRCINFO">.SRCINFO</a>，最近一次同步于 2025-10-24，若英文版本有所<a href="https://wiki.archlinux.org/title/.SRCINFO?diff=0&amp;oldid=850332" class="external text" rel="nofollow">更改</a>，则您可以帮助同步与[翻译](../zh-cn/Help:%E7%BF%BB%E8%AF%91.html "Help:翻译")更改的内容。
- 您可以在 <a href="https://wiki.archlinux.org/title/.SRCINFO_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)?action=history" class="external text" rel="nofollow">ArchWiki 的对应页面</a>找到本文翻译的**原始**修订历史。
- 本文可能与英文原文存在出入。

</div>

<div class="archwiki-template-meta-related-articles-start">

相关文章

- [Arch 构建系统](../zh-cn/Arch_%E6%9E%84%E5%BB%BA%E7%B3%BB%E7%BB%9F.html "Arch 构建系统")
- [Arch 打包准则](../zh-cn/Arch_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Arch 打包准则")
- [创建软件包](../zh-cn/%E5%88%9B%E5%BB%BA%E8%BD%AF%E4%BB%B6%E5%8C%85.html "创建软件包")
- [pacman](../zh-cn/Pacman.html "Pacman")
- [pacman/提示和技巧](../zh-cn/Pacman/%E6%8F%90%E7%A4%BA%E5%92%8C%E6%8A%80%E5%B7%A7.html "Pacman/提示和技巧")

</div>

`.SRCINFO` 文件（<a href="https://lists.archlinux.org/archives/list/aur-dev@lists.archlinux.org/thread/OYI3ETHM2WRK4H6HKRWU5LKHBILBNOCB/" class="external text" rel="nofollow">旧称</a> `.AURINFO`）用一个简单直接的格式记录软件包的元数据，这样像 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=devtools" class="external text" rel="nofollow">devtools</a></span><sup><span class="small">包</span></sup></span> 的工具和 <a href="../zh-cn/Arch_%E7%94%A8%E6%88%B7%E8%BD%AF%E4%BB%B6%E4%BB%93%E5%BA%93.html" class="mw-redirect" title="AUR">AUR</a> 网站后台或 [AUR 助手](../zh-cn/AUR_%E5%8A%A9%E6%89%8B.html "AUR 助手")可以不用解析 [PKGBUILD](../zh-cn/PKGBUILD.html "PKGBUILD") 就获得需要的信息。直接解析 shell 脚本的潜在问题可参考 <a href="https://bugs.archlinux.org/task/25210" class="external text" rel="nofollow">FS#25210</a>，<a href="https://bugs.archlinux.org/task/15043" class="external text" rel="nofollow">FS#15043</a> 和 <a href="https://bugs.archlinux.org/task/16394" class="external text" rel="nofollow">FS#16394</a>。

<div class="archwiki-template-box archwiki-template-box-warning">

**警告：**对 `PKGBUILD` 元数据的修改例如 [pkgver()](../zh-cn/PKGBUILD.html#pkgver "PKGBUILD") 更新，不会自动同步到 `.SRCINFO`. 如果修改了 `PKGBUILD` 但是没更新 `.SRCINFO` 会导致 AUR 使用错误的数据。

</div>

<div class="mw-heading mw-heading2">

## <span id=".E7.94.9F.E6.88.90"></span>生成

</div>

可以通过 [makepkg](../zh-cn/Makepkg.html "Makepkg") 自动生成 `.SRCINFO` 文件：

\$ makepkg --printsrcinfo \> .SRCINFO\

<div class="mw-heading mw-heading2">

## <span id=".E8.AF.AD.E6.B3.95"></span>语法

</div>

`.SRCINFO` 按行解析，每一行由像 `key = value` 一样的键值对组成。

每一个键都是一个字段，键值与 PKGBUILD 变量对应，具体请参考 <span class="plainlinks archwiki-template-man" title="$ man 5 PKGBUILD"><a href="https://man.archlinux.org/man/PKGBUILD.5#OPTIONS_AND_DIRECTIVES" class="external text" rel="nofollow">PKGBUILD(5) § OPTIONS AND DIRECTIVES</a></span>。键和数值都不应该加引号。等号两边一定要有一个空格（即使值为空）而且值之间不能包含逗号。有些值在 `PKGBUILD` 中是数组，需要变为同样的值多次指定，例如：

PKGBUILD

arch=(i686 x86_64)

.SRCINFO

arch = i686\
arch = x86_64\

文件以 [pkgbase](../zh-cn/PKGBUILD.html#pkgbase "PKGBUILD") 声明开头，此段落包含适用于整个软件包的数据。标准的 `PKGBUILD` 描述了一个单独的软件包，那么这就是唯一的主段落，后面跟着包含软件包的名称的 [pkgname](../zh-cn/PKGBUILD.html#pkgname "PKGBUILD") 声明，与前面的 `pkgbase` 对应：

pkgbase = foo\
    pkgdesc = An example package.\
    ...\
    md5sums = SKIP\
\
pkgname = foo\

如果 `PKGBUILD` 包含多个软件包，那么每个段落都以 `pkgname` 开头，然后记录针对那个软件包的数据。

<div class="noprint archwiki-template-message">

<span class="mw-default-size" typeof="mw:File"><a href="../File:Tango-view-fullscreen.png" class="mw-file-description"><img src="../File:Tango-view-fullscreen.png" class="mw-file-element" decoding="async" width="48" height="48" /></a></span>**这篇文章的某些内容需要扩充。**

<div>

**原因：**The above will suffice for some, below is a verbose list of parameters; split these up to improve readability. Also, find ways to reduce redundancy between this and [PKGBUILD](../zh-cn/PKGBUILD.html "PKGBUILD"). (在 <a href="../zh-cn/Talk:.SRCINFO.html" class="external text" rel="nofollow">Talk:.SRCINFO</a> 中讨论)

</div>

</div>

<div class="mw-heading mw-heading2">

## <span id=".E8.A6.81.E6.B1.82"></span>要求

</div>

下面字段只能在 `.SRCINFO` 文件的 `pkgbase` 段落出现一次：

- `pkgver`，`pkgrel`，`epoch`

下面字段可以在任何字段出现，每段落最多一次：

- `pkgdesc`，`url`，`install`，`changelog`

下面字段可以在一个段落里多次出现：

- `arch`
- `groups`
- `license`
- `noextract`
- `options`
- `backup`
- `validpgpkeys`（只能在 pkgbase 出现）

下列的字段可以重复出现，以多个[体系结构](../zh-cn/PKGBUILD.html#arch "PKGBUILD")为例：

source_x86_64 = https://foo.bar/file.tar.gz\
source_i686 = https://foo.bar/file_i686_patch.tar.gz\

- `source`
- `depends`，`checkdepends`，`makedepends`，`optdepends`
- `provides`，`conflicts`，`replaces`
- `md5sums`，`sha1sums`，`sha224sums`，`sha256sums`，`sha384sums`，`sha512sums`

其它字段名称、换行和以 `#` 开头的行会被忽略。

</div>
