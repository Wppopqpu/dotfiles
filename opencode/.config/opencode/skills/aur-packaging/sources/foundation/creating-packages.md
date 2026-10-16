<div class="mw-content-ltr mw-parser-output" lang="zh-Hans-CN" dir="ltr">

<div class="aside archwiki-template-box archwiki-template-box-note noexcerpt">

**翻译状态：**

- 本文（或部分内容）译自 <a href="https://wiki.archlinux.org/title/Creating_packages" class="extiw" title="arch:Creating packages">Creating packages</a>，最近一次同步于 2026-01-19，若英文版本有所<a href="https://wiki.archlinux.org/title/Creating_packages?diff=0&amp;oldid=858913" class="external text" rel="nofollow">更改</a>，则您可以帮助同步与[翻译](../zh-cn/Help:%E7%BF%BB%E8%AF%91.html "Help:翻译")更改的内容。
- 您可以在 <a href="https://wiki.archlinux.org/title/Creating_packages_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)?action=history" class="external text" rel="nofollow">ArchWiki 的对应页面</a>找到本文翻译的**原始**修订历史。
- 本文可能与英文原文存在出入。

</div>

<div class="archwiki-template-meta-related-articles-start">

相关文章

- <a href="/wzh/index.php?title=Creating_packages_for_other_distributions&amp;action=edit&amp;redlink=1" class="new" title="Creating packages for other distributions（页面不存在）">Creating packages for other distributions</a>
- [软件包补丁](../zh-cn/%E8%BD%AF%E4%BB%B6%E5%8C%85%E8%A1%A5%E4%B8%81.html "软件包补丁")
- [.SRCINFO](../zh-cn/.SRCINFO.html ".SRCINFO")

</div>

本文旨在帮助用户利用类似于 <a href="https://zh.wikipedia.org/wiki/Ports" class="extiw" title="zhwp:Ports">ports</a> 的 [Arch 构建系统](../zh-cn/Arch_%E6%9E%84%E5%BB%BA%E7%B3%BB%E7%BB%9F.html "Arch 构建系统")来创建自己的软件包，以及如何提交到 [Arch 用户软件仓库](../zh-cn/Arch_%E7%94%A8%E6%88%B7%E8%BD%AF%E4%BB%B6%E4%BB%93%E5%BA%93.html "Arch 用户软件仓库")。本文讲述了如何创建 <span class="plainlinks archwiki-template-man" title="$ man 5 PKGBUILD"><a href="https://man.archlinux.org/man/PKGBUILD.5" class="external text" rel="nofollow">PKGBUILD(5)</a></span>，这是一个描述如何构建软件包的文件，[makepkg](../zh-cn/Makepkg.html "Makepkg") 会使用它来从源代码创建二进制软件包。

关于构建规则和提高软件包质量的方法，请参考 [Arch 打包准则](../zh-cn/Arch_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Arch 打包准则")。

<div class="mw-heading mw-heading2">

## <span id=".E6.A6.82.E8.BF.B0"></span>概述

</div>

Arch Linux 中的软件包是通过 *makepkg* 工具以及存储在 `PKGBUILD` 文件中的信息编译的。运行 *makepkg* 时，它会自动在当前目录下搜索 `PKGBUILD` 文件，然后根据其中的信息下载文件，按需把软件源码重新编译打包为一个 *[`pkgname`](../zh-cn/PKGBUILD.html#pkgname "PKGBUILD")*`.pkg.tar.zst` 软件包文件。软件包文件中包含了 [pacman](../zh-cn/Pacman.html "Pacman") 安装需要的二进制文件和安装指令。

一个 Arch 软件包就是一个使用 <span class="plainlinks archwiki-template-man" title="$ man 1 zstd"><a href="https://man.archlinux.org/man/zstd.1" class="external text" rel="nofollow">zstd(1)</a></span> 压缩的 <span class="plainlinks archwiki-template-man" title="$ man 1 tar"><a href="https://man.archlinux.org/man/tar.1" class="external text" rel="nofollow">tar(1)</a></span> 压缩包，或者叫 [tarball](../zh-cn/%E5%BD%92%E6%A1%A3%E4%B8%8E%E5%8E%8B%E7%BC%A9.html#%E4%BB%85%E5%BD%92%E6%A1%A3 "归档与压缩")。它包含了以下由 *makepkg* 生成的文件：

- 要安装的二进制文件；

<!-- -->

- `.PKGINFO`: 包含所有 pacman 处理软件包所需的元数据、依赖等等；

<!-- -->

- `.BUILDINFO`: 包含可复现编译需要的信息，参阅 <span class="plainlinks archwiki-template-man" title="$ man 5 BUILDINFO"><a href="https://man.archlinux.org/man/BUILDINFO.5" class="external text" rel="nofollow">BUILDINFO(5)</a></span> ；

<!-- -->

- `.MTREE`: 包含了文件的哈希值与时间戳，pacman 能够根据这些储存在本地数据库的信息校验软件包的完整性；

<!-- -->

- `.INSTALL`: 可选的文件，可以用来在安装/升级/删除操作之后运行命令。(本文件只有在 `PKGBUILD` 中制定才会存在)；

<!-- -->

- `.Changelog`: 一个可选的文件，保存了包管理员描述软件变更的日志。

<div class="mw-heading mw-heading2">

## <span id=".E5.87.86.E5.A4.87.E5.B7.A5.E4.BD.9C"></span>准备工作

</div>

<div class="mw-heading mw-heading3">

### <span id=".E5.BF.85.E9.9C.80.E7.9A.84.E8.BD.AF.E4.BB.B6.E5.8C.85"></span>必需的软件包

</div>

首先，确定你已<a href="../zh-cn/Help:%E9%98%85%E8%AF%BB.html#%E5%AE%89%E8%A3%85%E8%BD%AF%E4%BB%B6%E5%8C%85" class="mw-redirect" title="安装">安装</a>必须的工具包。安装 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=base-devel" class="external text" rel="nofollow">base-devel</a></span><sup><span class="small">包</span></sup></span> <a href="../zh-cn/%E5%85%83%E8%BD%AF%E4%BB%B6%E5%8C%85%E5%92%8C%E8%BD%AF%E4%BB%B6%E5%8C%85%E7%BB%84.html" class="mw-redirect" title="元软件包">元软件包</a>应当足够；它会引入 <span class="plainlinks archwiki-template-man" title="$ man 1 make"><a href="https://man.archlinux.org/man/make.1" class="external text" rel="nofollow">make(1)</a></span> 和其它一些编译源码时需要的工具。

创建包的一个关键工具是 *makepkg*（由 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=pacman" class="external text" rel="nofollow">pacman</a></span><sup><span class="small">包</span></sup></span> 提供），它的功能请参阅 [Arch 打包准则#Makepkg 的任务](../zh-cn/Arch_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html#Makepkg_%E7%9A%84%E4%BB%BB%E5%8A%A1 "Arch 打包准则")。

<div class="mw-heading mw-heading3">

### <span id=".E4.B8.8B.E8.BD.BD.E5.B9.B6.E6.B5.8B.E8.AF.95.E5.AE.89.E8.A3.85"></span>下载并测试安装

</div>

下载你想打包的软件的源代码压缩包，解压，按照作者所说的步骤安装它。记录下在编译和安装软件过程中需要的所有命令或步骤。你将要在 `PKGBUILD` 文件中重复这些命令和步骤。

大多数软件作者遵循三步走的安装惯例：

\$ ./configure\
\$ make\
\# make install\

建议在这时测试软件的功能是否正常。

<div class="mw-heading mw-heading3">

### <span id=".E5.88.9B.E5.BB.BA.E4.B8.80.E4.B8.AA.E5.B9.B2.E5.87.80.E7.9A.84_chroot"></span>创建一个干净的 chroot

</div>

建议参考[创建一个干净的 chroot](../zh-cn/%E5%88%9B%E5%BB%BA%E4%B8%80%E4%B8%AA%E5%B9%B2%E5%87%80%E7%9A%84_chroot.html "创建一个干净的 chroot") 来保证你的系统中的其它软件包和配置不会影响 `PKGBUILD`。这个方法容错性更强，是一个更加恰当的构建软件包的方法，通常能够发现那些你未曾意识到需要的依赖项，因为它们已经在你的系统中存在。

<div class="mw-heading mw-heading2">

## <span id=".E5.88.9B.E5.BB.BA_PKGBUILD"></span>创建 PKGBUILD

</div>

当你运行 `makepkg` 时，它会在当前工作目录寻找一个 `PKGBUILD` 文件。如果找到 `PKGBUILD` 文件，它会下载该软件的源代码，根据 `PKGBUILD` 文件中的指令编译它。PKGBUILD 中的指令必须能完全被 [Bash](../zh-cn/Bash.html "Bash") 解释。

编译成功后，最后的二进制文件和包的元信息（即包的版本、依赖）被一起打包在 *`pkgname`*`.pkg.tar.zst` 软件包文件中，这个文件包可以通过 `makepkg --install` 调用 pacman 或直接使用 `pacman -U `*`<package file>`* 来安装。

要开始制作一个包，你应该先创建一个空工作目录，进入该目录，创建一个 `PKGBUILD` 文件。你可以复制 `PKGBUILD` 模板（位于 /usr/share/pacman/）到工作目录，或者复制一个类似包的 `PKGBUILD` 也可以。如果你只想在别人的基础上更改一些选项的话，后一种方法比较方便。

<div class="mw-heading mw-heading3">

### <span id="PKGBUILD_.E5.8F.98.E9.87.8F"></span>PKGBUILD 变量

</div>

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**主页面为 [PKGBUILD](../zh-cn/PKGBUILD.html "PKGBUILD")，另外也请参考 <span class="plainlinks archwiki-template-man" title="$ man 5 PKGBUILD"><a href="https://man.archlinux.org/man/PKGBUILD.5#OPTIONS_AND_DIRECTIVES" class="external text" rel="nofollow">PKGBUILD(5) § OPTIONS AND DIRECTIVES</a></span>。

</div>

*makepkg* 预定义了以下变量，打包者需使用它们指代构建过程的临时路径：

`srcdir`  
*makepkg*将会把源文件解压到此文件夹，或在此文件夹中生成指向 source 数组中文件的软连接。

`pkgdir`  
*makepkg*会把该文件夹当成系统根目录，并将软件安装在此文件夹下。

这些变量都是*绝对路径*，即意味着只要你合适地使用这些变量，就不用担心当前工作目录的影响.

<div class="archwiki-template-box archwiki-template-box-note">

**注意：***makepkg* 及延伸到 `build()` 和 `package()` 函数在运行过程中都应当是非交互的。在这些函数中调用交互工具或脚本可能会中断 *makepkg* 的运行，特别是启用了构建日志的时候（`--log`）。具体信息请参考 <a href="https://bugs.archlinux.org/task/13214" class="external text" rel="nofollow">FS#13214</a>。

</div>

<div class="mw-heading mw-heading3">

### <span id="PKGBUILD_.E5.87.BD.E6.95.B0"></span>PKGBUILD 函数

</div>

在构建软件包时，`makepkg` 会在 `PKGBUILD` 中有定义的情况下调用以下五个函数。`PKGBUILD` 中必须包含 `package()` 函数并总会被调用。对于其它函数，如果其未被定义，那么 `makepkg` 会将其略过。

在构建时，函数将按下文列出的顺序执行。

另请参考 <span class="plainlinks archwiki-template-man" title="$ man 5 PKGBUILD"><a href="https://man.archlinux.org/man/PKGBUILD.5#PACKAGING_FUNCTIONS" class="external text" rel="nofollow">PKGBUILD(5) § PACKAGING FUNCTIONS</a></span>。

<div class="mw-heading mw-heading4">

#### <span id="prepare.28.29"></span>prepare()

</div>

此函数会执行用于预处理源文件以进行构建的命令，例如 <a href="/wzh/index.php?title=Patching_in_ABS&amp;action=edit&amp;redlink=1" class="new" title="Patching in ABS（页面不存在）">patching</a>。此函数执行在 [pkgver()](#pkgver()) 之前，软件包解压之后。如果解压过程被跳过（`makepkg --noextract`），那么 `prepare()` 函数就不会被执行。

<div class="archwiki-template-box archwiki-template-box-note">

**注意：** (从 <span class="plainlinks archwiki-template-man" title="$ man 5 PKGBUILD"><a href="https://man.archlinux.org/man/PKGBUILD.5" class="external text" rel="nofollow">PKGBUILD(5)</a></span>) 中可以知道，该函数运行在 `bash -e` 模式下，意味着任何以非零状态退出的命令都会造成该函数中止.

</div>

如果不清楚应该将操作放到 `prepare()` 还是 `build()`，只需要记得 `prepare()` 中的步骤应在解压后仅执行一次，而 `build()` 中的步骤应在解压后文件被修改时都执行一次。

<div class="mw-heading mw-heading4">

#### <span id="pkgver.28.29"></span>pkgver()

</div>

`pkgver()` 会在抓取并解压源文件，执行 [prepare()](#prepare()) 后执行此函数，可用于在 makepkg 阶段中更新 pkgver 变量。

[为使用 git/svn/hg 等工具的项目打包](../zh-cn/VCS_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "VCS 软件打包准则")时，由于它们的构建过程相同，但源文件可能每天甚至每小时更新一次，这一特性将会十分有用。过去的方法是把日期写入到 pkgver 变量中，但这样一来 makepkg 会在即使软件没有更新的情况下依然重新构建软件包，因为它会认为软件包的版本改变了。其他与此有关的命令有 `git describe`，`hg identify -ni` 等等。请在提交 PKGBUILD 前做好测试，因为如果 `pkgver()` 执行失败，整个构建过程都会终止。

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**pkgver 不能含有空格或连接符 (`-`)，通常可以用 sed 来进行修正。

</div>

<div class="mw-heading mw-heading4">

#### <span id="build.28.29"></span>build()

</div>

现在你需要编写 `PKGBUILD` 文件中的 `build()` 函数。这个函数使用 <a href="https://en.wikipedia.org/wiki/Bash_(Unix_shell)" class="extiw" title="wikipedia:Bash (Unix shell)">Bash</a> 语法的通用 shell 命令来自动编译软件，并创建名为 `pkg` 的软件安装目录。这允许 *makepkg* 无需详查你的文件系统就可以打包你的软件。

在 `build()` 函数中第一步就是进入由解压源码包所生成的目录。*makepkg* 会在执行 `build()` 函数之前将当前活动目录设为为 `$srcdir`；因此，大多数情况下第一条命令是这样的：(参考示例文件 `/usr/share/pacman/PKGBUILD.proto`）：

cd "\$pkgname-\$pkgver"\

现在，你需要把你当时手动编译软件时用到的命令一一列上。`build()` 基本上会自动运行你当时手动输入的命令，并在伪 root 环境下编译该软件。如果要打包的软件使用了一个配置脚本，最好在配置中加上 `--prefix=/usr`。许多软件都将自己安装到 `/usr/local` 下，但你只应在手动从源码安装时这么做。所有的 Arch Linux 软件包都应当使用 `/usr` 目录。文件中接下来的两行应当如下（参考 `/usr/share/pacman/PKGBUILD.proto`）：

./configure --prefix=/usr\
make\

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**如果你的软件不需要构建任何东西，请不要使用 `build()` 函数，但 `package()` 函数依然是必须的。

</div>

<div class="mw-heading mw-heading4">

#### <span id="check.28.29"></span>check()

</div>

用于执行 `make check` 和其它一些例行测试。强烈建议使用 `check()` 确保软件正常构建，并能搭配依赖正常使用。

如果不需要或是维护者无法使软件包通过测试，可以给 `makepkg` 传入 `--nocheck` 参数来禁用它。

如果要测试的是 GUI 图形化应用，可以[在虚拟 xserver 中运行测试](../zh-cn/Xinit.html#Running_in_a_virtual_server "Xinit")。

<div class="mw-heading mw-heading4">

#### <span id="package.28.29"></span>package()

</div>

最后一步是将编译好的文件放到一个目录下，让 *makepkg* 可以获取并打包为软件包。默认情况下该目录为 `pkg`——一个简单的伪 root 环境。`pkg` 目录复制了根目录下软件安装路径的继承关系，如果你需要手动把文件放到根目录下，那么需要把文件放在 `pkg` 下相同的文件层级结构中。比如，你想把一个文件安装到 `/usr/bin`，那么在伪 root 环境中对应的路径为 `$pkgdir/usr/bin`。安装步骤通常不需要用户手动复制大量文件到某个地方，而只需调用 `make install` 即可。为了将软件正确地安装到 `pkg` 路径下，最后一行一般应该这样写：

make DESTDIR="\$pkgdir" install\

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**有时候在 `Makefile` 里没有使用`DESTDIR`；你可能需要使用 `prefix` 来替代。如果软件包是用 *autoconf*/*automake* 来构建的，那就需根据<a href="https://www.gnu.org/software/automake/manual/automake.html#Install" class="external text" rel="nofollow">文档</a>使用 `DESTDIR`；如果 `DESTDIR` 不起作用，可以试试 `make prefix="$pkgdir/usr" install`。如果这还不起作用的话，你就需要深入检查 `make <...> install` 具体执行的安装命令了。

</div>

`makepkg --repackage` 命令只运行 `package()` 函数,它只是将文件打包成软件包，并不运行编译过程。如果你只是更改了 `depends` 依赖变量，用这个命令来打包可以节省很多时间。

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**使用类似 `mv` 的命令从 `$srcdir` 移动由 `build()` 生成的文件到 `$pkgdir` 会破坏 *makepkg* 的 `--repackage` 选项。

</div>

<div class="mw-heading mw-heading2">

## <span id=".E6.B5.8B.E8.AF.95_PKGBUILD_.E6.96.87.E4.BB.B6.E5.92.8C.E8.BD.AF.E4.BB.B6.E5.8C.85"></span>测试 PKGBUILD 文件和软件包

</div>

在编写 `build()` 函数时，需要频繁测试更改以确保没有 bug。你可以在包含 `PKGBUILD` 的目录下运行 `makepkg` 命令来确保没有问题。如果 `PKGBUILD` 没有错误，将会生成一个软件包；但是如果 `PKGBUILD` 有问题或未完成，它将抛出一个错误。

如果运行 `makepkg` 成功，在你的工作目录下将会生成一个名为 *`pkgname-pkgver`*`.pkg.tar.zst` 的新文件，可以使用 `pacman -U` 进行安装。注意，成功生成了软件包不代表软件能正常运行，它有可能仅包含有空目录，也可能包含如不正确的前缀等问题。你可以使用 pacman 的 `pacman -Qlp `*`pkgname`* 查询软件包的文件清单，以及通过 `pacman -Qip `*`pkgname`* 检查依赖项是否正确。

如果包看起来是正确的，那你的工作就完成了。但是如果你打算发布这个 `PKGBUILD` 文件，你就需要确认确认再确认 `depends` 数组中的依赖是否正确。

另外也要确保包二进制文件完全正常地*运行*！如果发布出去的软件包已涵盖所有必要文件，但仅因某些选项与其他系统不兼容而崩溃会非常令人讨厌。如果你只是为自己的系统编译这个软件，就不必做这个质量保证了，因为只有你一个人需要忍受这些错误。

<div class="mw-heading mw-heading3">

### <span id=".E6.A3.80.E6.9F.A5.E5.8C.85.E7.9A.84.E9.80.BB.E8.BE.91.E6.80.A7"></span>检查包的逻辑性

</div>

确定包可以正常使用后，再使用[namcap](../zh-cn/Namcap.html "Namcap")来检查错误：

\$ namcap PKGBUILD\
\$ namcap *pkgname*.pkg.tar.zst\

*Namcap* 将会做以下工作：

- 检查 `PKGBUILD` 里的一些常见错误，以及包文件结构是否有不必要或错位的文件
- 用 `ldd` 扫描包中所有的 <a href="https://en.wikipedia.org/wiki/Executable_and_Linkable_Format" class="extiw" title="wikipedia:Executable and Linkable Format">ELF</a> 文件，自动报告 `depends` 中缺失或可去除的依赖
- 启发式搜寻缺失或冗余的依赖

等等。

要养成用 *namcap* 检查包的习惯，以避免提交包后再做修复的麻烦。

<div class="mw-heading mw-heading3">

### <span id=".E4.BD.BF.E7.94.A8_pkgctl_.E5.9C.A8.E5.B9.B2.E5.87.80.E7.9A.84_chroot_.E7.8E.AF.E5.A2.83.E4.B8.AD.E8.BF.9B.E8.A1.8C.E6.9E.84.E5.BB.BA"></span>使用 pkgctl 在干净的 chroot 环境中进行构建

</div>

<div class="noprint archwiki-template-message">

<span class="mw-default-size" typeof="mw:File"><a href="../File:Merge-arrows-2.png" class="mw-file-description"><img src="../File:Merge-arrows-2.png" class="mw-file-element" decoding="async" width="48" height="48" /></a></span>**本文或本章节可能需要合并到[Arch 构建系统#构建软件包](../zh-cn/Arch_%E6%9E%84%E5%BB%BA%E7%B3%BB%E7%BB%9F.html#%E6%9E%84%E5%BB%BA%E8%BD%AF%E4%BB%B6%E5%8C%85 "Arch 构建系统")。**

<div>

**附注：** 本文与构建系统无关，且与 [\#创建一个干净的 chroot](#%E5%88%9B%E5%BB%BA%E4%B8%80%E4%B8%AA%E5%B9%B2%E5%87%80%E7%9A%84_chroot) 和 <a href="/wzh/index.php?title=DeveloperWiki:Building_in_a_clean_chroot&amp;action=edit&amp;redlink=1" class="new" title="DeveloperWiki:Building in a clean chroot（页面不存在）">DeveloperWiki:Building in a clean chroot</a> 重复。（在 <a href="../zh-cn/Talk:%E5%88%9B%E5%BB%BA%E8%BD%AF%E4%BB%B6%E5%8C%85.html" class="external text" rel="nofollow">Talk:创建软件包</a> 中讨论）

</div>

</div>

可以使用 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=devtools" class="external text" rel="nofollow">devtools</a></span><sup><span class="small">包</span></sup></span> 的 `pkgctl` 来检查软件包是否可以在无其它包的环境中正常构建。在包含 PKGBUILD 的目录下执行：

\$ pkgctl build\

然后检查输出是否包含错误或警告。如果软件包依赖于 AUR 包，则需要事先构建并带入 chroot jail 中：

\$ pkgctl build -I path/to/somepkg.tar.gz -I ...\

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**如果包之前是通过 AUR 助手安装的，那很可能缓存目录中已经有其 tarball 了。

</div>

更多选项请参考 <span class="plainlinks archwiki-template-man" title="$ man 1 pkgctl-build"><a href="https://man.archlinux.org/man/pkgctl-build.1" class="external text" rel="nofollow">pkgctl-build(1)</a></span>。

<div class="mw-heading mw-heading2">

## <span id=".E6.8A.8A.E5.8C.85.E6.8F.90.E4.BA.A4.E7.BB.99_AUR"></span>把包提交给 AUR

</div>

请参考 [AUR 提交准则](../zh-cn/AUR_%E6%8F%90%E4%BA%A4%E5%87%86%E5%88%99.html "AUR 提交准则")，里面详细介绍了提交流程。

<div class="mw-heading mw-heading2">

## <span id=".E6.80.BB.E7.BB.93"></span>总结

</div>

- 下载你希望打包的软件源代码
- 试着编译安装包到任意目录
- 复制文件模板 `/usr/share/pacman/PKGBUILD.proto` 到一个临时目录，并重命名为 `PKGBUILD`
- 根据需要修改 `PKGBUILD` 文件
- 运行 `makepkg` 看看输出的打包结果是否正确
- 如果不正确，重复前两个步骤

<div class="mw-heading mw-heading3">

### <span id=".E6.B3.A8.E6.84.8F.E4.BA.8B.E9.A1.B9"></span>注意事项

</div>

- 除非你“很清楚”你正在做什么，否则在开始自动打包*之前*，需确保你至少已成功手动打包一次。不幸的是，虽然大多数软件作者遵循了三步走的安装惯例：`./configure`; `make`; `make install`，但事情并不都是这样的，有时候你不得不自己打补丁才能安装成功。经验是：如果你手动无法编译成功或者无法将软件安装到指定子目录下，那你就不必费心打包了。`makepkg`没有任何魔力能消除源代码的问题让你编译成功。

<!-- -->

- 在少数情况下，软件包不提供源码，而只能使用类似 `sh installer.run` 的命令进行安装，这时就需要你自己做很多工作了（比如查看 README，安装指导，手册，或者 Gentoo 或其它软件包安装器的 ebuild 等等）。在一些很变态的情况下，你需要自己编辑源码才能正常安装。但是，`makepkg` 需要完全自主运行，不能有用户的干预。因此，如果你想修改 makefiles，需要随 `PKGBUILD` 附上一个定制的补丁，然后在 `prepare()` 函数里安装这个补丁；或者你可以在 `prepare()` 函数里通过 `sed` 来修改。

<div class="mw-heading mw-heading2">

## <span id=".E8.87.AA.E5.8A.A8.E5.8C.96"></span>自动化

</div>

<div class="mw-heading mw-heading3">

### <span id=".E6.A0.A1.E9.AA.8C.E5.92.8C"></span>校验和

</div>

可以使用 `updpkgsums` 工具简化为新版本软件更新校验和的工作，具体信息请参考 [Makepkg#生成新校验和](../zh-cn/Makepkg.html#%E7%94%9F%E6%88%90%E6%96%B0%E6%A0%A1%E9%AA%8C%E5%92%8C "Makepkg")。

<div class="mw-heading mw-heading3">

### <span id="PKGBUILD_.E7.94.9F.E6.88.90.E5.99.A8"></span>PKGBUILD 生成器

</div>

某些软件包的 `PKGBUILD` 可以通过工具自动生成。

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**用户需要在提交文件到 <a href="../zh-cn/Arch_%E7%94%A8%E6%88%B7%E8%BD%AF%E4%BB%B6%E4%BB%93%E5%BA%93.html" class="mw-redirect" title="AUR">AUR</a> 前确保软件包满足高质量标准。

</div>

- <a href="/wzh/index.php?title=Haskell&amp;action=edit&amp;redlink=1" class="new" title="Haskell（页面不存在）">Haskell</a>：<a href="https://github.com/magthe/cblrepo" class="external text" rel="nofollow">cblrepo</a>，<span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=arch-hs" class="external text" rel="nofollow">arch-hs</a></span><sup><span class="small">包</span></sup></span>
- [Node.js](../zh-cn/Node.js.html "Node.js")：<span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://aur.archlinux.org/packages/nodejs-npm2arch/" class="external text" rel="nofollow">nodejs-npm2arch</a></span><sup><span class="small">AUR</span></sup></span>
- <a href="/wzh/index.php?title=Perl&amp;action=edit&amp;redlink=1" class="new" title="Perl（页面不存在）">Perl</a>：<span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=perl-cpanplus-dist-arch" class="external text" rel="nofollow">perl-cpanplus-dist-arch</a></span><sup><span class="small">包</span></sup></span>
- [Python](../zh-cn/Python.html "Python")：<span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://aur.archlinux.org/packages/pipman-git/" class="external text" rel="nofollow">pipman-git</a></span><sup><span class="small">AUR</span></sup></span>，<span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://aur.archlinux.org/packages/pip2arch-git/" class="external text" rel="nofollow">pip2arch-git</a></span><sup><span class="small">AUR</span></sup></span>，<span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://aur.archlinux.org/packages/python-pypi2pkgbuild/" class="external text" rel="nofollow">python-pypi2pkgbuild</a></span><sup><span class="small">AUR</span></sup></span>
- [Ruby](../zh-cn/Ruby.html "Ruby")：<span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://aur.archlinux.org/packages/gem2arch/" class="external text" rel="nofollow">gem2arch</a></span><sup><span class="small">AUR</span></sup></span>，<span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://aur.archlinux.org/packages/pacgem/" class="external text" rel="nofollow">pacgem</a></span><sup><span class="small">AUR</span></sup></span>
- [Rust](../zh-cn/Rust.html "Rust")：<span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://aur.archlinux.org/packages/cargo-pkgbuild/" class="external text" rel="nofollow">cargo-pkgbuild</a></span><sup><span class="small">AUR</span></sup></span>，<span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://aur.archlinux.org/packages/cargo-aur-bin/" class="external text" rel="nofollow">cargo-aur-bin</a></span><sup><span class="small">AUR</span></sup></span>

<div class="mw-heading mw-heading3">

### <span id=".E6.96.B0.E7.9A.84.E4.B8.8A.E6.B8.B8.E7.89.88.E6.9C.AC.E5.8F.91.E5.B8.83"></span>新的上游版本发布

</div>

来自 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=devtools" class="external text" rel="nofollow">devtools</a></span><sup><span class="small">包</span></sup></span> 的 *pkgctl* 以 `.nvchecker.toml` 配置文件的形式支持 <a href="https://github.com/lilydjwg/nvchecker" class="external text" rel="nofollow">nvchecker</a> 集成，该文件需与 `PKGBUILD` 位于同一目录下。具体示例请参考 pacman 包的 <a href="https://gitlab.archlinux.org/archlinux/packaging/packages/pacman/-/blob/main/.nvchecker.toml?ref_type=heads" class="external text" rel="nofollow">.nvchecker.toml</a> 配置文件。

<div class="archwiki-template-box archwiki-template-box-tip">

**提示：**`pkgctl version setup` 会通过分析 PKGBUILD 的 source 数组尝试自动创建 `.nvchecker.toml` 配置文件。

</div>

完成配置后，可以使用 `pkgctl version check` 比较 `PKGBUILD` 中的 `pkgver` 来检查上游是否发布了新版本，之后可以使用 `pkgctl version upgrade` 更新 `PKGBUILD`。详细信息请参考 <span class="plainlinks archwiki-template-man" title="$ man 1 pkgctl-version"><a href="https://man.archlinux.org/man/pkgctl-version.1" class="external text" rel="nofollow">pkgctl-version(1)</a></span>。

<div class="mw-heading mw-heading2">

## <span id=".E5.8F.82.E8.80.83"></span>参考

</div>

- <a href="https://bbs.archlinux.org/viewtopic.php?id=91408" class="external text" rel="nofollow">如何正确创建补丁文件</a>
- <a href="https://github.com/archwomen/classroom-media/tree/master/classlogs" class="external text" rel="nofollow">Arch Linux Classroom IRC 上关于如何创建 PKGBUILD 的教学日志</a>
- <a href="https://www.linuxfromscratch.org/hints/downloads/files/fakeroot.txt" class="external text" rel="nofollow">使用 fakeroot 方式安装软件包</a>

</div>
