<div class="mw-content-ltr mw-parser-output" lang="zh-Hans-CN" dir="ltr">

<div class="archwiki-template-meta-related-articles-start">

相关文章

- [.SRCINFO](../zh-cn/.SRCINFO.html ".SRCINFO")
- [Arch 构建系统](../zh-cn/Arch_%E6%9E%84%E5%BB%BA%E7%B3%BB%E7%BB%9F.html "Arch 构建系统")
- <a href="../zh-cn/Arch_%E7%94%A8%E6%88%B7%E8%BD%AF%E4%BB%B6%E4%BB%93%E5%BA%93_(AUR).html" class="mw-redirect" title="Arch 用户软件仓库 (AUR)">Arch 用户软件仓库 (AUR)</a>
- [创建软件包](../zh-cn/%E5%88%9B%E5%BB%BA%E8%BD%AF%E4%BB%B6%E5%8C%85.html "创建软件包")
- [GnuPG](../zh-cn/GnuPG.html "GnuPG")
- [官方仓库](../zh-cn/%E5%AE%98%E6%96%B9%E4%BB%93%E5%BA%93.html "官方仓库")
- <a href="/wzh/index.php?title=OpenPGP&amp;action=edit&amp;redlink=1" class="new" title="OpenPGP（页面不存在）">OpenPGP</a>
- [pacman](../zh-cn/Pacman.html "Pacman")
- [PKGBUILD](../zh-cn/PKGBUILD.html "PKGBUILD")

</div>

<div class="aside archwiki-template-box archwiki-template-box-note noexcerpt">

**翻译状态：**

- 本文（或部分内容）译自 <a href="https://wiki.archlinux.org/title/makepkg" class="extiw" title="arch:makepkg">makepkg</a>，最近一次同步于 2026-01-21，若英文版本有所<a href="https://wiki.archlinux.org/title/makepkg?diff=0&amp;oldid=861950" class="external text" rel="nofollow">更改</a>，则您可以帮助同步与[翻译](../zh-cn/Help:%E7%BF%BB%E8%AF%91.html "Help:翻译")更改的内容。
- 您可以在 <a href="https://wiki.archlinux.org/title/makepkg_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)?action=history" class="external text" rel="nofollow">ArchWiki 的对应页面</a>找到本文翻译的**原始**修订历史。
- 本文可能与英文原文存在出入。

</div>

<a href="https://gitlab.archlinux.org/pacman/pacman/blob/master/scripts/makepkg.sh.in" class="external text" rel="nofollow">makepkg</a> 是一个软件包自动化构建脚本，使用时需要一个具备构建条件的 <a href="https://en.wikipedia.org/wiki/Unix" class="extiw" title="wikipedia:Unix">Unix</a> 环境和一个 [PKGBUILD](../zh-cn/PKGBUILD.html "PKGBUILD") 文件。

*makepkg* 是由 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=pacman" class="external text" rel="nofollow">pacman</a></span><sup><span class="small">包</span></sup></span> 包提供的。

<div class="mw-heading mw-heading2">

## <span id=".E9.85.8D.E7.BD.AE"></span>配置

</div>

全局配置位于 `/etc/makepkg.conf`，还可以通过 `$XDG_CONFIG_HOME/pacman/makepkg.conf` 或 `~/.makepkg.conf` 进行用户特定配置。你还可以添加 `/etc/makepkg.conf.d/makepkg.conf` 文件进行系统全局配置更改。在构建软件包前，建议先检查 makepkg 配置。

<div class="archwiki-template-box archwiki-template-box-tip">

**提示：**<span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=devtools" class="external text" rel="nofollow">devtools</a></span><sup><span class="small">包</span></sup></span> 用于<a href="https://wiki.archlinux.org/title/DeveloperWiki:Building_in_a_clean_chroot" class="external text" rel="nofollow">从干净的 chroot 构建软件包</a>的助手脚本会使用 `/usr/share/devtools/makepkg.conf.d/`*`arch`*`.conf` 配置文件。

</div>

更多信息请参考 <span class="plainlinks archwiki-template-man" title="$ man 5 makepkg.conf"><a href="https://man.archlinux.org/man/makepkg.conf.5" class="external text" rel="nofollow">makepkg.conf(5)</a></span>。

<div class="mw-heading mw-heading3">

### <span id=".E6.89.93.E5.8C.85.E4.BA.BA.E4.BF.A1.E6.81.AF"></span>打包人信息

</div>

每个软件包都会有元数据信息，其中就包含 *packager*。默认情况下，用户自己打包的软件标记为 `Unknown Packager`。如果多个用户会在系统上编译，或者需要发布软件包给其他人，最好提供真实的联系人。打包人信息可以通过 `makepkg.conf` 中的 `PACKAGER` 变量进行设置。

要检查已安装软件包的打包人：

\$ pacman -Qi *package*

...\
Packager       : John Doe \<john@doe.com\>\
...\

要自动化签名过程，请同时在 `makepkg.conf` 中设置 `GPGKEY` 变量.

<div class="mw-heading mw-heading3">

### <span id=".E5.8C.85.E8.BE.93.E5.87.BA"></span>包输出

</div>

*makepkg* 默认会在工作目录创建软件包，并把源代码下载到 `src/` 目录。可以配置到自定义的路径，比如将所有构建出的软件包放到 `~/build/packages/` 目录，所有源文件放到 `~/build/sources/` 目录下。

根据需求不同，可以配置 `makepkg.conf` 下的这些变量：

- `PKGDEST` - 软件包构建输出目录
- `SRCDEST` - 用于存放[源数据](../zh-cn/PKGBUILD.html#source "PKGBUILD")的目录（在指向其它位置的情况下，软链接将被放置到 `src/` 目录下）
- `SRCPKGDEST` - 源代码包构建输出目录（通过 `makepkg -S` 构建）

<div class="archwiki-template-box archwiki-template-box-tip">

**提示：**可以参考 [pacman#清理软件包缓存](../zh-cn/Pacman.html#%E6%B8%85%E7%90%86%E8%BD%AF%E4%BB%B6%E5%8C%85%E7%BC%93%E5%AD%98 "Pacman") 用命令（例如 `paccache -c ~/build/packages/`）清理 `PKGDEST` 目录

</div>

你还可以[\#在包目录下使用相对路径](#%E5%9C%A8%E5%8C%85%E7%9B%AE%E5%BD%95%E4%B8%8B%E4%BD%BF%E7%94%A8%E7%9B%B8%E5%AF%B9%E8%B7%AF%E5%BE%84)。

<div class="mw-heading mw-heading3">

### <span id=".E9.AA.8C.E8.AF.81.E7.AD.BE.E5.90.8D"></span>验证签名

</div>

<div class="archwiki-template-box archwiki-template-box-note">

**注意：***makepkg* 中的签名验证并不使用 pacman 的密钥环, 而是使用用户的密钥<a href="http://allanmcrae.com/2015/01/two-pgp-keyrings-for-package-management-in-arch-linux/" class="external autonumber" rel="nofollow">[1]</a>。

</div>

如果签名文件是以 *.sig* 或 *.asc* 形式作为 [PKGBUILD](../zh-cn/PKGBUILD.html "PKGBUILD") 源码数组的一部分提供，*makepkg* 会自动[验证](../zh-cn/GnuPG.html#%E9%AA%8C%E8%AF%81%E7%AD%BE%E5%90%8D "GnuPG")软件包。如果用户未提供需要的签名公钥，*makepkg* 会停止安装过程并提示用户说无法验证 PGP 密钥。

如果缺少软件包所需的公钥，那么 [PKGBUILD](../zh-cn/PKGBUILD.html "PKGBUILD") 很可能带有 [validpgpkeys](../zh-cn/PKGBUILD.html#validpgpkeys "PKGBUILD") 项，其中包含了所需的密钥 ID。你可以[手动进行导入](../zh-cn/GnuPG.html#%E5%AF%BC%E5%85%A5%E5%85%AC%E5%85%B1%E5%AF%86%E9%92%A5 "GnuPG")，也可以在[在公钥服务器上](../zh-cn/GnuPG.html#%E4%BD%BF%E7%94%A8%E5%85%AC%E9%92%A5%E6%9C%8D%E5%8A%A1%E5%99%A8 "GnuPG")进行查找，然后导入。运行 *makepkg* 时使用 `--skippgpcheck` 选项可以临时禁用签名检查。

<div class="mw-heading mw-heading2">

## <span id=".E4.BD.BF.E7.94.A8"></span>使用

</div>

继续之前，确保已<a href="../zh-cn/Help:%E9%98%85%E8%AF%BB.html#%E5%AE%89%E8%A3%85%E8%BD%AF%E4%BB%B6%E5%8C%85" class="mw-redirect" title="安装">安装</a>了 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/groups/x86_64/base-devel/" class="external text" rel="nofollow">base-devel</a></span><sup><span class="small">包组</span></sup></span> <a href="../zh-cn/%E5%85%83%E8%BD%AF%E4%BB%B6%E5%8C%85%E5%92%8C%E8%BD%AF%E4%BB%B6%E5%8C%85%E7%BB%84.html" class="mw-redirect" title="软件包组">软件包组</a>。属于这个组的软件包**不会**被要求列在 [PKGBUILD](../zh-cn/PKGBUILD.html "PKGBUILD") 文件的构建时依赖（*makedepends*）中。

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**

- 确保为传入 [pacman](../zh-cn/Pacman.html "Pacman") 的命令正确配置了 [sudo](../zh-cn/Sudo.html "Sudo")。另外，可以通过 <span class="plainlinks archwiki-template-man" title="$ man 5 makepkg.conf"><a href="https://man.archlinux.org/man/makepkg.conf.5" class="external text" rel="nofollow">makepkg.conf(5)</a></span> 配置文件的 `PACMAN_AUTH` 参数指定不同的认证命令。
- <a href="https://lists.archlinux.org/archives/list/pacman-dev@lists.archlinux.org/message/ZLRXMUGXULDHLTGSRYVGVWG3BVATV3OY/" class="external text" rel="nofollow">不允许</a>以根用户（root）身份运行 `makepkg`。<a href="https://gitlab.archlinux.org/pacman/pacman/blob/master/NEWS" class="external autonumber" rel="nofollow">[2]</a> 原因除了 `PKGBUILD` 可能包含恶意代码外，以 root 身份构建软件一般都被认为是不安全的。<a href="https://bbs.archlinux.org/viewtopic.php?id=67561" class="external autonumber" rel="nofollow">[3]</a> 无法使用普通用户时需以 <a href="http://allanmcrae.com/2015/01/replacing-makepkg-asroot/" class="external text" rel="nofollow">nobody 用户</a>的身份运行 `makepkg`（例如 `runuser -u nobody makepkg`）。

</div>

要构建软件包，用户必须首先创建一个 [PKGBUILD](../zh-cn/PKGBUILD.html "PKGBUILD") 文件或编译脚本（在[创建软件包](../zh-cn/%E5%88%9B%E5%BB%BA%E8%BD%AF%E4%BB%B6%E5%8C%85.html "创建软件包")中有详细描述），或者从 [Arch 构建系统](../zh-cn/Arch_%E6%9E%84%E5%BB%BA%E7%B3%BB%E7%BB%9F.html "Arch 构建系统")*（ABS）*、<a href="../zh-cn/Arch_%E7%94%A8%E6%88%B7%E8%BD%AF%E4%BB%B6%E4%BB%93%E5%BA%93.html" class="mw-redirect" title="AUR">AUR</a> 或其他来源获取。获取到 `PKGBUILD` 后，切换到该文件所在文件夹中，然后执行以下命令构建软件包：

\$ makepkg\

如果需要的依赖不满足，*makepkg* 会输出一个警告然后失败。想要编译软件包并自动安装必须的依赖，只需添加 `-s`/`--syncdeps` 参数：

\$ makepkg --syncdeps\

如果添加了 `-r`/`--rmdeps` 选项，*makepkg* 会在结束后删除不再需要的编译依赖。如果需要持续编译软件包，请考虑定期[删除未使用软件包](../zh-cn/Pacman/%E6%8F%90%E7%A4%BA%E5%92%8C%E6%8A%80%E5%B7%A7.html#%E5%88%A0%E9%99%A4%E6%9C%AA%E4%BD%BF%E7%94%A8%E7%9A%84%E8%BD%AF%E4%BB%B6%E5%8C%85%EF%BC%88%E5%AD%A4%E7%AB%8B%E8%BD%AF%E4%BB%B6%E5%8C%85%EF%BC%89 "Pacman/提示和技巧")。

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**

- 这些依赖必须在已配置的软件源之中存在，具体信息请参考 [pacman#软件仓库](../zh-cn/Pacman.html#%E8%BD%AF%E4%BB%B6%E4%BB%93%E5%BA%93 "Pacman")。另外，用户也可以在编译前手动安装需要的依赖：(`pacman -S --asdeps `*`dep1`*` `*`dep2`*)。
- 在安装依赖包时，只使用全局值，即不会使用拆分包打包功能中的任何覆盖值。

</div>

在满足所有依赖并成功编译软件包后，一个软件包文件（*`pkgname`*`-`*`pkgver`*`.pkg.tar.zst`）将会被创建在工作目录下。如需安装，请使用 `-i`/`--install` 参数（与 `pacman -U `*`pkgname`*`-`*`pkgver`*`.pkg.tar.zst` 相同）：

\$ makepkg --install\

要清理残余的文件和目录（如解压到 `$srcdir` 的文件），请使用 `-c`/`--clean` 选项。这对于在使用同一个文件夹多次编译同一个软件包或者升级软件包版本时很有用。它可以防止过期或残余的文件被呈递到新的构建任务中：

\$ makepkg --clean\

更多信息请阅读 <span class="plainlinks archwiki-template-man" title="$ man 8 makepkg"><a href="https://man.archlinux.org/man/makepkg.8" class="external text" rel="nofollow">makepkg(8)</a></span>。

<div class="mw-heading mw-heading2">

## <span id=".E4.BC.98.E5.8C.96"></span>优化

</div>

默认选项与 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=devtools" class="external text" rel="nofollow">devtools</a></span><sup><span class="small">包</span></sup></span> 为[官方仓库](../zh-cn/%E5%AE%98%E6%96%B9%E4%BB%93%E5%BA%93.html "官方仓库")构建软件包使用的选项一致<a href="https://gitlab.archlinux.org/archlinux/packaging/packages/pacman/-/issues/23#note_173678" class="external autonumber" rel="nofollow">[4]</a>。因此，用户可以通过调整以下选项来适应本地环境，以获得或多或少的收益。

<div class="mw-heading mw-heading3">

### <span id=".E4.BC.98.E5.8C.96.E7.BC.96.E8.AF.91.E7.BB.93.E6.9E.9C"></span>优化编译结果

</div>

通过启用针对主机的编译器优化，可以提高打包后软件的性能。缺点是，为特定处理器架构编译的二进制文件无法在其他机器上正常运行。在 x86_64 机器上，重新构建官方软件包通常不会有显著的性能提升，因此不值得为此投入时间。

不过，使用 “非标准” 编译器标志很容易降低性能。许多编译器优化仅在某些情况下有用，不应对软件包随意应用。除非有评测数据证明某项优化更快，否则很有可能会导致性能下降！Gentoo 的 <a href="https://wiki.gentoo.org/wiki/GCC_optimization" class="external text" rel="nofollow">GCC 优化</a>和<a href="https://wiki.gentoo.org/wiki/Safe_CFLAGS" class="external text" rel="nofollow">安全的 CFLAGS</a> 文章提供了有关编译器优化的更多信息。

<div class="mw-heading mw-heading4">

#### <span id="C_.E5.92.8C_C.2B.2B"></span>C 和 C++

</div>

传递到 C/C++ 编译器（例如 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=gcc" class="external text" rel="nofollow">gcc</a></span><sup><span class="small">包</span></sup></span> 或 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=clang" class="external text" rel="nofollow">clang</a></span><sup><span class="small">包</span></sup></span>）的选项是通过 `CFLAGS`、`CXXFLAGS` 和 `CPPFLAGS` [环境变量](../zh-cn/%E7%8E%AF%E5%A2%83%E5%8F%98%E9%87%8F.html "环境变量")传入的。在使用 Arch 构建系统时，*makepkg* 会将 `makepkg.conf` 中的配置项作为这些环境变量进行传递。默认值会生成通用的二进制文件，可安装在各种机器上。

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**

- 记住，不是所有的构建系统都会使用 `makepkg.conf` 中设置的变量。例如，*cmake* 不会遵循 `CPPFLAGS` 预处理器选项环境变量。因此，很多 [PKGBUILD](../zh-cn/PKGBUILD.html "PKGBUILD") 都包含了针对打包软件所使用的构建系统而设置的选项。
- 源码提供的 `Makefile` 或编译命令行中指定的参数优先级更高，并有可能会取代掉 `makepkg.conf` 中的配置。

</div>

GCC 可以自动检测架构，并应用安全的架构特定优化项。要使用该特性，首先需要移除所有 `-march` 和 `-mtune` 标志，然后添加 `-march=native`，例如：

/etc/makepkg.conf

CFLAGS="**-march=native** -O2 -pipe ..."\
CXXFLAGS="\${CFLAGS} ..."

要查看该操作会启用的选项，执行：

\$ gcc -march=native -v -Q --help=target\

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**如果没有指定 `-march=native`，`-Q --help=target` 将**不会**起作用<a href="https://bbs.archlinux.org/viewtopic.php?pid=1616694#p1616694" class="external autonumber" rel="nofollow">[5]</a>。具体启用的选项需要编译后才能知道。详细步骤请参考<a href="https://wiki.gentoo.org/wiki/Safe_CFLAGS" class="external autonumber" rel="nofollow">[6]</a>。

</div>

进一步优化需要启用对内存占用和编译时间有较大负面影响的选项，做法为将优化级别从 `-O2` 设为 `-O3`。使用该选项一般都能提升二进制文件的性能，但具体效果取决于文件本身。更多信息请参考 <a href="https://wiki.gentoo.org/wiki/GCC_optimization#-O" class="extiw" title="gentoo:GCC optimization">Gentoo:GCC optimization#-O</a> 和 <a href="https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html#Options-That-Control-Optimization" class="external text" rel="nofollow">GCC 优化选项页</a>。

<div class="mw-heading mw-heading4">

#### Rust

</div>

从 `pacman` 5.2.2 开始，`makepkg.conf` 还包含了对 `RUSTFLAGS` 环境变量的覆写，用于替换 Rust 编译器的标志。通过在 `RUSTFLAGS` 中添加 `-C target-cpu=native`，Rust 编译器还能检测并应用架构特定优化项：

/etc/makepkg.conf.d/rust.conf

RUSTFLAGS="-C force-frame-pointers=yes **-C target-cpu=native**"

查看该操作会已启用的 CPU 特性：

\$ rustc -C target-cpu=native --print cfg\

在不包含 `-C target-cpu=native` 的情况下运行 `--print cfg` 将输出默认配置。

下面为一些可以添加到 `RUSTFLAGS` 的优化参数：

- `-C opt-level=3`：可以根据需要将该值更改为 `3`、`s` 或 `z`。针对分发的构建默认使用 `opt-level=3`。
- `-C codegen-units=`*`n`*：选择小于 `16` 的 *`n`* 值可以优化二进制文件，但会增加构建耗时。
- `-C link-arg=-z -C link-arg=pack-relative-relocs` 可以降低二进制文件的大小。

更多信息请参考 <a href="https://doc.rust-lang.org/rustc/codegen-options/index.html" class="external text" rel="nofollow">Rust 编译器文档</a>。

<div class="mw-heading mw-heading3">

### <span id=".E5.87.8F.E5.B0.91.E7.BC.96.E8.AF.91.E6.97.B6.E9.97.B4"></span>减少编译时间

</div>

<div class="mw-heading mw-heading4">

#### <span id=".E5.B9.B6.E8.A1.8C.E7.BC.96.E8.AF.91"></span>并行编译

</div>

<span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=make" class="external text" rel="nofollow">make</a></span><sup><span class="small">包</span></sup></span> 编译系统使用 `MAKEFLAGS` [环境变量](../zh-cn/%E7%8E%AF%E5%A2%83%E5%8F%98%E9%87%8F.html "环境变量")指定 *make* 的额外选项。这个值也可以在 `makepkg.conf` 文件中进行设置。

使用多核/多处理器系统的用户可以设定同时运行的任务数。可以用 <span class="plainlinks archwiki-template-man" title="$ man 1 nproc"><a href="https://man.archlinux.org/man/nproc.1" class="external text" rel="nofollow">nproc(1)</a></span> 获得可用处理器的个数，例如：`MAKEFLAGS="--jobs=$(nproc)"`。

有些 `PKGBUILD` 会强制使用 `-j1`，因为某些版本会产生冲突或者软件包本身并不支持。如果出现软件包因为此原因无法编译，请在确认错误是由 `MAKEFLAGS` 引起的前提下，在 bug 跟踪系统中进行[报告](../zh-cn/%E6%BC%8F%E6%B4%9E%E6%8A%A5%E5%91%8A%E5%87%86%E5%88%99.html "漏洞报告准则")（如果是 <a href="../zh-cn/Arch_%E7%94%A8%E6%88%B7%E8%BD%AF%E4%BB%B6%E4%BB%93%E5%BA%93.html" class="mw-redirect" title="AUR">AUR</a> 包，则向包维护者报告）。

完整可用选项请参考 <span class="plainlinks archwiki-template-man" title="$ man 1 make"><a href="https://man.archlinux.org/man/make.1" class="external text" rel="nofollow">make(1)</a></span>。

<div class="mw-heading mw-heading4">

#### <span id=".E4.BD.BF.E7.94.A8.E5.86.85.E5.AD.98.E6.96.87.E4.BB.B6.E7.B3.BB.E7.BB.9F.E8.BF.9B.E8.A1.8C.E7.BC.96.E8.AF.91"></span>使用内存文件系统进行编译

</div>

编译过程需要大量的读写操作，要处理很多小文件。将工作目录移动到 [tmpfs](../zh-cn/Tmpfs.html "Tmpfs") 可能会减少编译时间。

使用 `BUILDDIR` 变量可以临时将 *makepkg* 的编译目录设置到现有 tmpfs，例如：

\$ BUILDDIR=/tmp/makepkg makepkg\

将 `makepkg.conf` 中的 `BUILDDIR` 选项取消注释可以永久变更编译目录，具体位于 `/etc/makepkg.conf` 文件末尾的 `BUILD ENVIRONMENT` 一节。设置此变量为 `BUILDDIR=/tmp/makepkg` 可以利用 Arch 默认的 `/tmp` 临时文件系统。

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**

- 在 [tmpfs](../zh-cn/Tmpfs.html "Tmpfs") 中构建大型软件包时可能会内存不足。
- 挂载 [tmpfs](../zh-cn/Tmpfs.html "Tmpfs") 目录时不能使用 `noexec` 选项，否则编译命令无法执行。
- 在 [tmpfs](../zh-cn/Tmpfs.html "Tmpfs") 中构建好的包重启后会消失，设置 [PKGDEST](#%E5%8C%85%E8%BE%93%E5%87%BA) 选项可以将构建结果保存到其它目录。

</div>

<div class="mw-heading mw-heading4">

#### <span id=".E4.BD.BF.E7.94.A8.E7.BC.96.E8.AF.91.E7.BC.93.E5.AD.98"></span>使用编译缓存

</div>

[ccache](../zh-cn/Ccache.html "Ccache") 可以将编译结果缓存起来供下次编译使用，减少编译时间。

<div class="mw-heading mw-heading4">

#### <span id=".E4.BD.BF.E7.94.A8_mold_.E9.93.BE.E6.8E.A5.E5.99.A8"></span>使用 mold 链接器

</div>

<span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=mold" class="external text" rel="nofollow">mold</a></span><sup><span class="small">包</span></sup></span> 是 <a href="../zh-cn/GNU_Compiler_Collection.html" class="mw-redirect" title="GCC">ld</a>/[lld](../zh-cn/LLVM.html "LLVM") 链接器的直接替代，据称其速度稍微较快。

要使用 *mold*，需添加 `-fuse-ld=mold` 到 `LDFLAGS`，例如：

/etc/makepkg.conf

LDFLAGS="... -fuse-ld=mold"

要向 *mold* 添加额外选项，可以将它们添加到 `LDFLAGS` 中，例如：

/etc/makepkg.conf

LDFLAGS="... -fuse-ld=mold -Wl,--separate-debug-file"

要为 Rust 软件包使用 *mold*，可以将 `-C link-arg=-fuse-ld=mold` 添加到 `RUSTFLAGS` 中，例如：

/etc/makepkg.conf.d/rust.conf

RUSTFLAGS="... -C link-arg=-fuse-ld=mold"

<div class="mw-heading mw-heading4">

#### <span id=".E7.A6.81.E7.94.A8.E8.B0.83.E8.AF.95.E5.8C.85.E5.92.8C_LTO"></span>禁用调试包和 LTO

</div>

包含在 <a href="https://gitlab.archlinux.org/archlinux/packaging/packages/pacman/-/blob/6.0.2-9/makepkg.conf?ref_type=tags" class="external text" rel="nofollow">2024 年 2 月 pacman 6.0.2-9 版本</a>的 <a href="https://gitlab.archlinux.org/archlinux/packaging/packages/pacman/-/commit/90bf367e61b4f77f8351d0412be3d0c4ddadb85a" class="external text" rel="nofollow">90bf367e 号提交</a>默认启用了 `debug` 和 `lto` 选项。

构建调试包能让官方仓库为用户提供更多的问题排查工具（<a href="https://gitlab.archlinux.org/archlinux/packaging/packages/pacman/-/issues/23#note_173528" class="external text" rel="nofollow">archlinux/packaging/packages/pacman#23#note_173528</a>），但在自行构建软件包时，调试包不是必需的，而且会减慢构建进程。参见 <a href="https://gitlab.archlinux.org/archlinux/packaging/packages/pacman/-/issues/23#note_173782" class="external text" rel="nofollow">archlinux/packaging/packages/pacman#23#note_173782</a>。

<a href="https://en.wikipedia.org/wiki/Link-time_optimization" class="extiw" title="wikipedia:Link-time optimization">链接时优化</a>可以生成更优化的二进制文件，但会增加构建耗时（<a href="https://gitlab.archlinux.org/archlinux/packaging/packages/pacman/-/issues/23#note_173678" class="external text" rel="nofollow">archlinux/packaging/packages/pacman#23#note_173678</a>），不一定是一个理想的权衡。

如需禁用这些选项，可以在 `OPTIONS=()` 数组中的这些选项前直接添加 `!` 符号，例如：`OPTIONS=(...!debug !lto...)`

<div class="mw-heading mw-heading3">

### <span id=".E5.8E.8B.E7.BC.A9"></span>压缩

</div>

<div class="mw-heading mw-heading4">

#### <span id=".E4.BD.BF.E7.94.A8.E5.85.B6.E5.AE.83.E5.8E.8B.E7.BC.A9.E7.AE.97.E6.B3.95"></span>使用其它压缩算法

</div>

为了加快打包和安装速度，您可以更改 `PKGEXT`，代价是生成的软件包文件更大。

例如，以下命令可以跳过压缩步骤，使得<a href="../zh-cn/Help:%E9%98%85%E8%AF%BB.html#%E5%AE%89%E8%A3%85%E8%BD%AF%E4%BB%B6%E5%8C%85" class="mw-redirect" title="安装">安装</a>时无需解压：

\$ PKGEXT='.pkg.tar' makepkg\

另一个例子使用 lz4 算法，可以提升速度：

\$ PKGEXT='.pkg.tar.lz4' makepkg\

要使这些设置之一永久生效，请在 `/etc/makepkg.conf` 中设置 `PKGEXT` 。

<div class="mw-heading mw-heading4">

#### <span id=".E5.9C.A8.E5.8E.8B.E7.BC.A9.E6.97.B6.E4.BD.BF.E7.94.A8.E5.A4.9A.E4.B8.AA_CPU_.E6.A0.B8.E5.BF.83"></span>在压缩时使用多个 CPU 核心

</div>

<span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=zstd" class="external text" rel="nofollow">zstd</a></span><sup><span class="small">包</span></sup></span> 支持<a href="https://en.wikipedia.org/wiki/Symmetric_multiprocessing" class="extiw" title="wikipedia:Symmetric multiprocessing">对称多处理（SMP）</a>，通过添加 `-T`/`--threads` 标志可以加速压缩。默认情况下，`/etc/makepkg.conf` 中的 `COMPRESSZST` 数组包含了 `-T0` 标志，使得 *zstd* 尽可能使用多的物理 CPU 核心来压缩软件包。可以通过 `--auto-threads=logical` 标志让 *zstd* 根据逻辑 CPU 核心数进一步提升调用数：

COMPRESSZST=(zstd -c -T0 **--auto-threads=logical** -)\

<span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=lz4" class="external text" rel="nofollow">lz4</a></span><sup><span class="small">包</span></sup></span> 和 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=xz" class="external text" rel="nofollow">xz</a></span><sup><span class="small">包</span></sup></span> 默认使用多线程，不需要对 `/etc/makepkg.conf` 进行修改。

<span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=pigz" class="external text" rel="nofollow">pigz</a></span><sup><span class="small">包</span></sup></span> 是 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=gzip" class="external text" rel="nofollow">gzip</a></span><sup><span class="small">包</span></sup></span> 的一个替代、并行实现，它默认使用所有可用的CPU核心（可以使用 `-p`/`--processes` 标志来使用较少的核心）：

COMPRESSGZ=(**pigz** -c -f -n)\

<span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=pbzip2" class="external text" rel="nofollow">pbzip2</a></span><sup><span class="small">包</span></sup></span> 是 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=bzip2" class="external text" rel="nofollow">bzip2</a></span><sup><span class="small">包</span></sup></span> 的一个替代、并行实现，它也默认使用所有可用的CPU核心。可以使用 `-p#` 标志来使用较少的核心（注意：`-p` 和核心数之间没有空格）：

COMPRESSBZ2=(**pbzip2** -c -f)\

<span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=lbzip2" class="external text" rel="nofollow">lbzip2</a></span><sup><span class="small">包</span></sup></span> 是 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=bzip2" class="external text" rel="nofollow">bzip2</a></span><sup><span class="small">包</span></sup></span> 的另一个替代、并行实现，它也默认使用所有可用的CPU核心。可以使用 `-n` 标志来使用较少的核心。

COMPRESSBZ2=(**lbzip2** -c -f)\

<span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://aur.archlinux.org/packages/plzip/" class="external text" rel="nofollow">plzip</a></span><sup><span class="small">AUR</span></sup></span> 是 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=lzip" class="external text" rel="nofollow">lzip</a></span><sup><span class="small">包</span></sup></span> 的一个多线程实现，它也默认使用所有可用的 CPU 核心。可以使用 `-n`/`--threads` 标志来使用较少的核心。

COMPRESSLZ=(**plzip** -c -f)\

<div class="mw-heading mw-heading4">

#### <span id=".E4.BF.AE.E6.94.B9.E5.8E.8B.E7.BC.A9.E7.AD.89.E7.BA.A7"></span>修改压缩等级

</div>

有几种压缩算法（包括 zstd 和 xz）支持设定压缩等级，以在速度、内存占用和压缩效率间进行取舍。

<div class="mw-heading mw-heading2">

## <span id=".E5.B0.8F.E6.8A.80.E5.B7.A7"></span>小技巧

</div>

<div class="mw-heading mw-heading3">

### <span id=".E5.87.8F.E5.B0.91.E4.B8.8B.E8.BD.BD.E5.92.8C.E8.A7.A3.E5.8E.8B.E6.97.B6.E9.97.B4"></span>减少下载和解压时间

</div>

<div class="mw-heading mw-heading4">

#### <span id=".E8.AE.BE.E5.AE.9A.E6.BA.90.E6.96.87.E4.BB.B6.E4.BD.8D.E7.BD.AE"></span>设定源文件位置

</div>

特别是在编译 [VCS 软件包](../zh-cn/VCS_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "VCS 软件打包准则")时，使用 `SRCDEST` 可以缩短重新构建时获取和解压源代码的时间。

<div class="mw-heading mw-heading4">

#### <span id=".E8.87.AA.E5.AE.9A.E4.B9.89_DLAGENTS"></span>自定义 DLAGENTS

</div>

可以使用支持并行下载的下载器，以 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=axel" class="external text" rel="nofollow">axel</a></span><sup><span class="small">包</span></sup></span> 为例：

/etc/makepkg.conf

DLAGENTS=('file::/bin/curl -gqC - -o %o %u'\
          'ftp::/bin/axel -n 2 -o %o %u'\
          'http::/bin/axel -n 2 -o %o %u'\
          'https::/bin/axel -n 2 -o %o %u')

另请参考 <a href="/wzh/index.php?title=Nonfree_applications_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Nonfree applications package guidelines（页面不存在）">Nonfree applications package guidelines#Custom DLAGENTS</a>。

<div class="mw-heading mw-heading3">

### <span id=".E7.94.9F.E6.88.90.E6.96.B0.E6.A0.A1.E9.AA.8C.E5.92.8C"></span>生成新校验和

</div>

安装 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=pacman-contrib" class="external text" rel="nofollow">pacman-contrib</a></span><sup><span class="small">包</span></sup></span>，然后在 PKGBUILD 文件所在目录中执行以下命令来生成新校验和：

\$ updpkgsums\

`updpkgsums` 使用 `makepkg --geninteg` 生成校验和，查看<a href="https://bbs.archlinux.org/viewtopic.php?pid=1933763#p1933763" class="external text" rel="nofollow">此论坛</a>了解详情

也可以用如 `sha256sum` 命令生成校验和并手动加入到 `sha256sums` 数组中。

<div class="mw-heading mw-heading3">

### <span id=".E4.BB.8E.E6.9C.AC.E5.9C.B0.E6.BA.90.E6.96.87.E4.BB.B6.E7.94.9F.E6.88.90"></span>从本地源文件生成

</div>

如果您想对源代码进行更改，可以使用`-o`、`--nobuild`下载源代码，而无需构建软件包，仅进行下载和解压缩文件选项。

\$ makepkg -o\

您现在可以对源代码进行更改，然后使用`-e`，`--noextract` 不提取源文件（使用现有的\$srcdir/ dir）选项构建软件包。使用`-f`选项覆盖已经生成的和现有的包。

\$ makepkg -ef\

<div class="mw-heading mw-heading3">

### <span id=".E6.98.BE.E7.A4.BA.E5.85.B7.E6.9C.89.E7.89.B9.E5.AE.9A.E6.89.93.E5.8C.85.E7.A8.8B.E5.BA.8F.E7.9A.84.E5.8C.85"></span>显示具有特定打包程序的包

</div>

<span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=expac" class="external text" rel="nofollow">expac</a></span><sup><span class="small">包</span></sup></span> 是一个pacman数据库提取工具。此命令显示系统上安装的所有打包程序名为*packagername*的包：

\$ expac "%n %p" \| grep "*packagername*" \| column -t\

这将显示系统上安装的所有软件包， `/etc/makepkg` 变量 `PACKAGER`仅显示在中定义的存储库中的包 `/etc/pacman.conf`。

\$ . /etc/makepkg.conf; grep -xvFf \<(pacman -Qqm) \<(expac "%n\t%p" \| grep "\$PACKAGER\$" \| cut -f1)\

<div class="mw-heading mw-heading3">

### <span id=".E5.9C.A8_64_.E4.BD.8D.E7.B3.BB.E7.BB.9F.E4.B8.8A.E6.9E.84.E5.BB.BA_32_.E4.BD.8D.E8.BD.AF.E4.BB.B6.E5.8C.85"></span>在 64 位系统上构建 32 位软件包

</div>

参考<a href="../zh-cn/32_%E4%BD%8D%E8%BD%AF%E4%BB%B6%E5%8C%85%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html" class="mw-redirect" title="32位软件包打包准则">32位软件包打包准则</a>。

<div class="mw-heading mw-heading3">

### <span id=".E8.BD.AF.E4.BB.B6.E5.8C.85.E7.AD.BE.E5.90.8D.E6.89.98.E7.AE.A1"></span>软件包签名托管

</div>

<div class="noprint archwiki-template-message">

<span class="mw-default-size" typeof="mw:File"><a href="../File:Merge-arrows-2.png" class="mw-file-description"><img src="../File:Merge-arrows-2.png" class="mw-file-element" decoding="async" width="48" height="48" /></a></span>**本文或本章节可能需要合并到[GnuPG#Unattended_passphrase](../zh-cn/GnuPG.html#Unattended_passphrase "GnuPG")。**

<div>

**附注：** 非 *makepkg* 特定。（在 <a href="../zh-cn/Talk:Makepkg.html" class="external text" rel="nofollow">Talk:Makepkg</a> 中讨论）

</div>

</div>

<div class="noprint archwiki-template-message">

<span class="mw-default-size" typeof="mw:File"><a href="../File:Tango-view-fullscreen.png" class="mw-file-description"><img src="../File:Tango-view-fullscreen.png" class="mw-file-element" decoding="async" width="48" height="48" /></a></span>**这篇文章的某些内容需要扩充。**

<div>

**原因：**还可以使用 <span class="plainlinks archwiki-template-man" title="$ man 1 gpg-preset-passphrase"><a href="https://man.archlinux.org/man/gpg-preset-passphrase.1" class="external text" rel="nofollow">gpg-preset-passphrase(1)</a></span> (在 <a href="../zh-cn/Talk:Makepkg.html" class="external text" rel="nofollow">Talk:Makepkg</a> 中讨论)

</div>

</div>

在使用类似 <a href="/wzh/index.php?title=Jenkins&amp;action=edit&amp;redlink=1" class="new" title="Jenkins（页面不存在）">Jenkins</a> 的自动构建环境时，用户可能无法为用于软件签名的 gpg 私钥提供密码。另外，不建议在没有密码保护的系统上存放 GPG 私钥。

使用 *makepkg* 创建的 zst 软件包可以在创建后通过如下命令进行签名：

\$ gpg --detach-sign --pinentry-mode loopback --passphrase --passphrase-fd 0 --output *NewlyBuilt.pkg.tar.zst.sig* --sign *NewlyBuilt.pkg.tar.zst* \

其中 GPG 密码由你选择的自动化套件安全地提供和隐藏。

生成的 `zst` 和 `sig` 文件可被需要有效签名的 [pacman](../zh-cn/Pacman.html "Pacman") 客户端和使用 `repo-add --sign` 创建的软件仓库引用。

<div class="mw-heading mw-heading3">

### <span id=".E7.A3.81.E5.8A.9B.E9.93.BE.E6.8E.A5_URI"></span>磁力链接 URI

</div>

使用 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://aur.archlinux.org/packages/transmission-dlagent/" class="external text" rel="nofollow">transmission-dlagent</a></span><sup><span class="small">AUR</span></sup></span> 下载器可以支持在 `source` 字段使用磁力链接 URI（前缀为 `magnet://`）。

<div class="mw-heading mw-heading3">

### Running makepkg in a systemd control group

</div>

If the package you are building takes too many resources to build with your default *make* flags, which are otherwise set properly for most packages, you can try running it in its own <a href="/wzh/index.php?title=Control_group&amp;action=edit&amp;redlink=1" class="new" title="Control group（页面不存在）">control group</a>. <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://aur.archlinux.org/packages/makepkg-cg/" class="external text" rel="nofollow">makepkg-cg</a></span><sup><span class="small">AUR</span></sup></span> is a wrapper for *makepkg* that achieved this via systemd control groups (see <span class="plainlinks archwiki-template-man" title="$ man 5 systemd.resource-control"><a href="https://man.archlinux.org/man/systemd.resource-control.5" class="external text" rel="nofollow">systemd.resource-control(5)</a></span>).

<div class="mw-heading mw-heading3">

### Running with idle scheduling policy

</div>

Package build process can lead to high CPU utilization, especially in case of [\#Parallel compilation](#Parallel_compilation). Under heavy CPU load, the system can issue a significant slowdown up to becoming unusable, even with the highest <span class="plainlinks archwiki-template-man" title="$ man 1 nice"><a href="https://man.archlinux.org/man/nice.1" class="external text" rel="nofollow">nice(1)</a></span> value. User interface and foreground applications may stutter or even became unresponsive.

This can be worked around by changing the scheduling policy to `SCHED_IDLE` before running *makepkg*. It ensures that package building process does not interfere with regular tasks and only utilizes remaining unused CPU time.

From <span class="plainlinks archwiki-template-man" title="$ man 7 sched"><a href="https://man.archlinux.org/man/sched.7#SCHED_IDLE:_Scheduling_very_low_priority_jobs" class="external text" rel="nofollow">sched(7) § SCHED_IDLE: Scheduling very low priority jobs</a></span>:

This policy is intended for running jobs at extremely low priority (lower even than a +19 nice value with the `SCHED_OTHER` or `SCHED_BATCH` policies).

The `SCHED_IDLE` policy can be set by running <span class="plainlinks archwiki-template-man" title="$ man 1 chrt"><a href="https://man.archlinux.org/man/chrt.1" class="external text" rel="nofollow">chrt(1)</a></span> command with the `-i` flag, specifying priority 0 (the only valid option for `SCHED_IDLE`) and specifying the PID of the current shell.

For most shells:

\$ chrt -iap 0 \$\$\

<div class="archwiki-template-box archwiki-template-box-tip">

**提示：**You can apply this command for every build by placing it into `makepkg.conf`.

</div>

For the [fish](../zh-cn/Fish.html "Fish") shell, where `$$` is not set:

\$ chrt -iap 0 %self\

<div class="mw-heading mw-heading3">

### <span id=".E5.9C.A8.E5.8C.85.E7.9B.AE.E5.BD.95.E4.B8.8B.E4.BD.BF.E7.94.A8.E7.9B.B8.E5.AF.B9.E8.B7.AF.E5.BE.84"></span>在包目录下使用相对路径

</div>

Instead of using absolute paths for the [package output options](#Package_output), you can also configure relative paths inside each package directory.

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**The following options might cause problems with some <a href="../zh-cn/AUR_helpers.html" class="mw-redirect" title="AUR helpers">AUR helpers</a>, as they might use `makepkg.conf` in a context where `$startdir` is not defined. So be careful.

</div>

For example, you can define target paths in your `makepkg.conf` file as follows. The `$startdir` variable refers to the directory where a `PKGBUILD` is located when you build a package.

PKGDEST="\$startdir/build/packages/"\
SRCDEST="\$startdir/build/sources/"\
SRCPKGDEST="\$startdir/build/srcpackages/"\
LOGDEST="\$startdir/logs/"\

This will result in:

- Built packages will be stored in: `"package directory"/build/packages/`
- All downloaded source files will be stored in: `"package directory"/build/sources/`
- Built source packages will be stored in: `"package directory"/build/srcpackages/`
- All logs will be stored in: `"package directory"/logs/`

*makepkg* will still create `src/` and `pkg/` directories as usual, so this is expected behaviour.

<div class="mw-heading mw-heading2">

## <span id=".E9.97.AE.E9.A2.98.E5.A4.84.E7.90.86"></span>问题处理

</div>

<div class="mw-heading mw-heading3">

### Specifying install directory for QMAKE based packages

</div>

The makefile generated by *qmake* uses the environment variable `INSTALL_ROOT` to specify where the program should be installed. Thus this package function should work:

PKGBUILD

...\
package() {\
    cd "\$srcdir/\${pkgname%-git}"\
    make INSTALL_ROOT="\$pkgdir" install\
}\
...

Note, that qmake also has to be configured appropriately. For example put this in the corresponding *.pro* file:

YourProject.pro

...\
target.path = /usr/local/bin\
INSTALLS += target\
...

<div class="mw-heading mw-heading3">

### <span id="WARNING:_Package_contains_reference_to_.24srcdir"></span>WARNING: Package contains reference to \$srcdir

</div>

由于某种原因，有时 `$pkgdir` 或 `$srcdir` 中的字面字符串会进入到软件包中的文件<a href="https://lists.archlinux.org/archives/list/arch-general@lists.archlinux.org/thread/Y26ARK6GVXTXSBFRLWNUDPYZV37UQTXH/#DB2RSM6E5UVZKFEGC7JTR6ZDADCVECCT" class="external autonumber" rel="nofollow">[7]</a>。

可以在 *makepkg* 构建文件夹中执行以下命令进行检测：

\$ grep -R "\$PWD/src" pkg/\

一个可能是 C/++ 代码使用了 `__FILE__` 宏并将完整路径传递给了编译器。

Dotnet 二进制文件有时也会在默认配置文件中包含 `.pdb` 文件的完整路径。

<div class="mw-heading mw-heading3">

### Makepkg fails to download dependencies when behind proxy

</div>

When *makepkg* calls dependencies, it calls pacman to install the packages, which requires administrative privileges via *sudo*. However, *sudo* does not pass any <a href="../zh-cn/Environment_variables.html" class="mw-redirect" title="Environment variables">environment variables</a> to the privileged environment, and as well excludes the proxy-related variables ftp_proxy, http_proxy, https_proxy, and no_proxy.

In order to have *makepkg* working behind a proxy, invoke one of the following methods.

<div class="mw-heading mw-heading4">

#### Enable proxy by setting its URL in XferCommand

</div>

The XferCommand can be set to use the desired proxy URL in `/etc/pacman.conf`. Add or uncomment the following line in `pacman.conf`:

/etc/pacman.conf

...\
XferCommand = /usr/bin/curl --proxy http://username:password@proxy.proxyhost.com:80 --location --continue-at - --fail --output %o %u\
...

<div class="mw-heading mw-heading4">

#### <span id="Enable_proxy_via_sudoer.27s_env_keep"></span>Enable proxy via sudoer's env_keep

</div>

Alternatively, one may want to use sudoer's `env_keep` option, which enables preserving given variables the privileged environment. See [Pacman#pacman does not honor proxy settings](../zh-cn/Pacman.html#pacman_does_not_honor_proxy_settings "Pacman") for more details.

<div class="mw-heading mw-heading3">

### <span id="Makepkg_fails.2C_but_make_succeeds"></span>Makepkg fails, but make succeeds

</div>

If something successfully compiles using *make*, but fails through *makepkg*, it is almost certainly because `/etc/makepkg.conf` sets an incompatible compilation variable. Try adding these flags to the PKGBUILD `options` array:

`!buildflags`, to prevent its default `CPPFLAGS`, `CFLAGS`, `CXXFLAGS`, and `LDFLAGS`.

`!makeflags`, to prevent its default `MAKEFLAGS`.

`!debug`, to prevent its default `DEBUG_CFLAGS`, and `DEBUG_CXXFLAGS`, in case the PKGBUILD is a debug build.

If any of these fix the problem, this could warrant an upstream bug report assuming the offending flag has been identified.

<div class="mw-heading mw-heading2">

## <span id=".E5.8F.82.E9.98.85"></span>参阅

</div>

- <span class="plainlinks archwiki-template-man" title="$ man 8 makepkg"><a href="https://man.archlinux.org/man/makepkg.8" class="external text" rel="nofollow">makepkg(8)</a></span>
- <span class="plainlinks archwiki-template-man" title="$ man 5 makepkg.conf"><a href="https://man.archlinux.org/man/makepkg.conf.5" class="external text" rel="nofollow">makepkg.conf(5)</a></span>
- <a href="https://gist.github.com/Earnestly/bebad057f40a662b5cc3" class="external text" rel="nofollow">Makepkg 流程概览</a>
- <a href="https://gitlab.archlinux.org/pacman/pacman/blob/master/scripts/makepkg.sh.in" class="external text" rel="nofollow">makepkg 源码</a>

</div>
