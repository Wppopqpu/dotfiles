<div class="mw-content-ltr mw-parser-output" lang="zh-Hans-CN" dir="ltr">

<div class="aside archwiki-template-box archwiki-template-box-note noexcerpt">

**翻译状态：**

- 本文（或部分内容）译自 <a href="https://wiki.archlinux.org/title/VCS_package_guidelines" class="extiw" title="arch:VCS package guidelines">VCS package guidelines</a>，最近一次同步于 2025-08-31，若英文版本有所<a href="https://wiki.archlinux.org/title/VCS_package_guidelines?diff=0&amp;oldid=826458" class="external text" rel="nofollow">更改</a>，则您可以帮助同步与[翻译](../zh-cn/Help:%E7%BF%BB%E8%AF%91.html "Help:翻译")更改的内容。
- 您可以在 <a href="https://wiki.archlinux.org/title/VCS_package_guidelines_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)?action=history" class="external text" rel="nofollow">ArchWiki 的对应页面</a>找到本文翻译的**原始**修订历史。
- 本文可能与英文原文存在出入。

</div>

<div class="archwiki-template-box" style="display:block; text-align: center; margin-bottom: 1em;">

**[Arch 打包准则](../zh-cn/Arch_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Arch 打包准则")**

------------------------------------------------------------------------

<a href="../zh-cn/32_%E4%BD%8D%E8%BD%AF%E4%BB%B6%E5%8C%85%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html" class="mw-redirect" title="32位软件包打包准则">32 位</a> – [安全](../zh-cn/Arch_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99/%E5%AE%89%E5%85%A8.html "Arch 打包准则/安全") – [CLR](../zh-cn/CLR_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "CLR 软件打包准则") – [CMake](../zh-cn/CMake_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "CMake 软件打包准则") – [DKMS](../zh-cn/DKMS_%E8%BD%AF%E4%BB%B6%E5%8C%85%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "DKMS 软件包打包准则") – [Eclipse](../zh-cn/Eclipse_%E6%8F%92%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Eclipse 插件打包准则") – [Electron](../zh-cn/Electron_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Electron 打包准则") – [Free Pascal](../zh-cn/Free_Pascal_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Free Pascal 打包准则") – <a href="/wzh/index.php?title=GNOME_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="GNOME package guidelines（页面不存在）">GNOME</a> – [Go](../zh-cn/Go_%E8%AF%AD%E8%A8%80%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Go 语言软件打包准则") – [Haskell](../zh-cn/Haskell_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Haskell 打包准则") – [Java](../zh-cn/Java_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Java 打包准则") – [交叉编译工具](../zh-cn/%E4%BA%A4%E5%8F%89%E7%BC%96%E8%AF%91%E5%B7%A5%E5%85%B7%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "交叉编译工具打包准则") – [KDE](../zh-cn/KDE_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "KDE 软件打包准则") – <a href="/wzh/index.php?title=Lisp_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Lisp package guidelines（页面不存在）">Lisp</a> – <a href="/wzh/index.php?title=Meson_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Meson package guidelines（页面不存在）">Meson</a> – <a href="/wzh/index.php?title=MinGW_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="MinGW package guidelines（页面不存在）">MinGW</a> – [内核模块](../zh-cn/%E5%86%85%E6%A0%B8%E6%A8%A1%E5%9D%97%E6%89%93%E5%8C%85%E6%8C%87%E5%8D%97.html "内核模块打包指南") – [Node.js](../zh-cn/Node.js_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Node.js 打包准则") – <a href="/wzh/index.php?title=Nonfree_applications_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Nonfree applications package guidelines（页面不存在）">Nonfree</a> – [OCaml](../zh-cn/OCaml_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "OCaml 打包准则") – <a href="/wzh/index.php?title=Perl_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Perl package guidelines（页面不存在）">Perl</a> – [PHP](../zh-cn/PHP_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "PHP 打包准则") – [Python](../zh-cn/Python_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Python 打包准则") – [R](../zh-cn/R_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "R 软件打包准则") – <a href="/wzh/index.php?title=Ruby_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Ruby package guidelines（页面不存在）">Ruby</a> – [Rust](../zh-cn/Rust_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Rust 软件打包准则") – <a href="/wzh/index.php?title=Shell_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Shell package guidelines（页面不存在）">Shell</a> – <span class="mw-selflink selflink">VCS</span> – <a href="/wzh/index.php?title=Web_application_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Web application package guidelines（页面不存在）">Web</a> – <a href="../zh-cn/Wine_package_guidelines.html" class="mw-redirect" title="Wine package guidelines">Wine</a> – [字体](../zh-cn/%E5%AD%97%E4%BD%93%E6%89%93%E5%8C%85%E6%8C%87%E5%8D%97.html "字体打包指南")

</div>

<div class="archwiki-template-meta-related-articles-start">

相关文章

- <a href="../zh-cn/Arch_%E7%94%A8%E6%88%B7%E8%BD%AF%E4%BB%B6%E4%BB%93%E5%BA%93_(AUR).html" class="mw-redirect" title="Arch 用户软件仓库 (AUR)">Arch 用户软件仓库 (AUR)</a>
- [AUR 提交准则](../zh-cn/AUR_%E6%8F%90%E4%BA%A4%E5%87%86%E5%88%99.html "AUR 提交准则")
- [PKGBUILD](../zh-cn/PKGBUILD.html "PKGBUILD")

</div>

<a href="https://zh.wikipedia.org/wiki/%E7%89%88%E6%9C%AC%E6%8E%A7%E5%88%B6" class="extiw" title="zhwp:版本控制">版本控制</a>系统可用于获取常规静态版本软件包的源代码，以及开发分支的最新（主干）版本。

<div class="archwiki-template-box archwiki-template-box-tip">

**提示：**使用 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=pacman" class="external text" rel="nofollow">pacman</a></span><sup><span class="small">包</span></sup></span> 软件包提供的 `/usr/share/pacman/PKGBUILD-vcs.proto` 原型文件。

</div>

<div class="mw-heading mw-heading2">

## <span id=".E5.8C.85.E5.90.8D"></span>包名

</div>

除非软件包获取的是特定发布版本，否则应添加后缀 `-bzr`、`-cvs`、`-darcs`、`-git`、`-hg` 或 `-svn` 等。

<div class="mw-heading mw-heading2">

## <span id=".E7.89.88.E6.9C.AC"></span>版本

</div>

若因修改依赖关系、URL 或源代码导致生成的软件包发生变化，请将 `pkgver` 更新至最新版本。若自上次更新 `PKGBUILD` 以来 `pkgver` 未发生变化，则应递增 `pkgrel` 的值。

建议采用以下版本格式：*`发行（release）`*`.r`*`修订（revision）`*，其中 *`修订`* 是唯一标识源代码树的单调递增数字（VCS 修订号即符合此特性）。若无公开发行版本且仓库无标签，可用 0 作为发行版本号，或完全省略 *`发行`* 部分直接使用形如 `r`*`修订`* 的版本号。若有公开发行版本但仓库未打标签，开发者需通过解析项目文件等方式获取发行版本号。

修订号分隔符（*`修订`* 之前的 `r`）至关重要，可避免上游首次发布版本或使用不同组件数量的版本时出现的问题。例如，若在修订版 `455` 时上游决定发布 `0.1` 版本，修订号分隔符能保持版本单调性：`0.1.r456 > r454`。若无分隔符将导致单调性失效：`0.1.456 < 454`。

<div class="archwiki-template-box archwiki-template-box-tip">

**提示：**可使用 `--holdver` 选项阻止 [makepkg](../zh-cn/Makepkg.html "Makepkg") 更新 `pkgver`，详见 <span class="plainlinks archwiki-template-man" title="$ man 8 makepkg"><a href="https://man.archlinux.org/man/makepkg.8" class="external text" rel="nofollow">makepkg(8)</a></span>。

</div>

<div class="mw-heading mw-heading2">

## <span id=".E5.86.B2.E7.AA.81.E3.80.81.E6.8F.90.E4.BE.9B.E4.B8.8E.E4.BE.9D.E8.B5.96"></span>冲突、提供与依赖

</div>

- 明确声明软件包冲突与提供，例如 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://aur.archlinux.org/packages/fluxbox-git/" class="external text" rel="nofollow">fluxbox-git</a></span><sup><span class="small">AUR</span></sup></span> 应包含：

conflicts=('fluxbox')\
provides=("fluxbox=\${pkgver}")\

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**关于版本控制的通用建议（尤其适用于 VCS 软件包），请参阅 [PKGBUILD#provides](../zh-cn/PKGBUILD.html#provides "PKGBUILD")。

</div>

- `replaces=()` 通常会引起不必要的问题，应避免使用。

<!-- -->

- 在 `makedepends=()` 中包含对应的版本控制工具⸺<span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=cvs" class="external text" rel="nofollow">cvs</a></span><sup><span class="small">包</span></sup></span>、<span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=subversion" class="external text" rel="nofollow">subversion</a></span><sup><span class="small">包</span></sup></span>、<span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=git" class="external text" rel="nofollow">git</a></span><sup><span class="small">包</span></sup></span> 等。

<div class="mw-heading mw-heading2">

## <span id=".E8.AE.A4.E8.AF.81.E4.B8.8E.E5.AE.89.E5.85.A8"></span>认证与安全

</div>

- 使用 cvsroot 时，优先采用 `anonymous:@` 而非 `anonymous@`，以避免输入空密码；若必须提供密码则使用 `anonymous:password@`。
- 由于源代码并非静态文件，需在 `sha256sums=()` 中通过添加 `'SKIP'` 跳过硬校验。

<div class="mw-heading mw-heading2">

## <span id="VCS_.E6.BA.90.E4.BB.A3.E7.A0.81"></span>VCS 源代码

</div>

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**Arch 官方不支持使用稀疏克隆（sparse clone）或浅克隆（shallow clone），相关讨论参见 <a href="https://bugs.archlinux.org/task/34677" class="external text" rel="nofollow">FS#34677</a> 及<a href="https://lists.archlinux.org/archives/list/aur-requests@lists.archlinux.org/thread/4IM3GOPMSIW4IULKB5DTIY3FAOIQKIN6/#O3OB7N3R2G7QMRBDCPE7SYCYVS7VL5JS" class="external text" rel="nofollow">邮件列表</a>。

</div>

VCS 源代码需在 `source` 数组中指定，其处理方式与其他类型源代码相同。makepkg 会将仓库克隆/检出/分支（clone/checkout/branch）到 `$SRCDEST` 目录（若未在 <span class="plainlinks archwiki-template-man" title="$ man 5 makepkg.conf"><a href="https://man.archlinux.org/man/makepkg.conf.5" class="external text" rel="nofollow">makepkg.conf(5)</a></span> 中设置，则默认使用 `$startdir`），然后以特定于各 VCS 的方式将其复制到 `$srcdir`。本地仓库不会被修改，因此无需使用 `-build` 目录。

`source` 数组的通用格式为：

source=('\[folder::\]\[vcs+\]url\[#fragment\]')\

- `folder`（可选）——文件夹名称，用于将默认仓库名称更改为更具意义的名称（例如替代 `trunk`），或保留先前源代码路径
- `vcs+`——当 URL 未体现 VCS 类型时需要添加，例如 `git+https://some_repo`
- `url`——远程或本地仓库的 URL
- `#fragment`（可选）——片段，用于拉取特定分支或提交。各 VCS 支持的片段格式请参阅 <span class="plainlinks archwiki-template-man" title="$ man 5 PKGBUILD"><a href="https://man.archlinux.org/man/PKGBUILD.5#USING_VCS_SOURCES" class="external text" rel="nofollow">PKGBUILD(5) § USING VCS SOURCES</a></span>

使用 [Git](../zh-cn/Git.html "Git") 时的 `source` 数组示例：

source=('project_name::git+https://project_url#branch=project_branch')\

<div class="archwiki-template-box archwiki-template-box-warning">

**警告：**请勿在 `folder` 字段中使用 `pkgver` 变量，因为该变量可能在 `pkgver()` 函数调用时被修改，导致后续函数无法访问已创建的文件夹。

</div>

<div class="mw-heading mw-heading2">

## <span id="pkgver.28.29_.E5.87.BD.E6.95.B0"></span>pkgver() 函数

</div>

通过专用的 `pkgver()` 函数可实现自动版本更新。这种方式能更精细地控制版本号，维护者应尽量采用有意义的版本格式。使用该函数时，仍需预先声明更改 PKGBUILD 时最新的 `pkgver` 变量值，makepkg 工具会自动调用 `pkgver()` 并更新该变量。

<div class="mw-heading mw-heading3">

### Bazaar

</div>

pkgver() {\
  cd "\$pkgname"\
  printf "r%s" "\$(bzr revno)"\
}

r830\

<div class="mw-heading mw-heading3">

### Git

</div>

基于最后提交可达的最近的带注释的标签生成版本号：

pkgver() {\
  cd "\$pkgname"\
  git describe --long --abbrev=7 \| sed 's/\\\[^-\]\*-g\\/r\1/;s/-/./g'\
}

2.0.r6.ga17a017\

基于最后提交可达的最近的未注释的标签生成版本号：

pkgver() {\
  cd "\$pkgname"\
  git describe --long --tags --abbrev=7 \| sed 's/\\\[^-\]\*-g\\/r\1/;s/-/./g'\
}

0.71.r115.gd95ee07\

若 <span class="plainlinks archwiki-template-man" title="$ man 1 git-tag"><a href="https://man.archlinux.org/man/git-tag.1" class="external text" rel="nofollow">git-tag(1)</a></span> 名称不含连字符，可使用简化 <span class="plainlinks archwiki-template-man" title="$ man 1 sed"><a href="https://man.archlinux.org/man/sed.1" class="external text" rel="nofollow">sed(1)</a></span> 表达式 `sed 's/-/.r/;s/-/./'`。

当标签包含前缀（如 `v` 或项目名）时需进行截取：

pkgver() {\
  cd "\$pkgname"\
  # 移除Git标签中的'foo-'前缀\
  git describe --long --abbrev=7 \| sed 's/^foo-//;s/\\\[^-\]\*-g\\/r\1/;s/-/./g'\
}

6.1.r3.gd77e105\

无可用标签时使用历史提交计数：

pkgver() {\
  cd "\$pkgname"\
  printf "r%s.%s" "\$(git rev-list --count HEAD)" "\$(git rev-parse --short=7 HEAD)"\
}

r1142.a17a017\

省略 <a href="https://zh.wikipedia.org/wiki/SHA-1" class="extiw" title="zhwp:SHA-1">SHA-1</a> 哈希，仅保留版本号与修订号（注意此时若版本号混乱，将无法快速定位到具体修订版本）：

git describe --long --abbrev=7 --tags \| sed 's/\\\[^-\]\*\\-g.\*/r\1/;s/-/./g'\

可组合使用两种方法以支持开始无标签、后期添加标签的仓库（使用了 bash 特性）：

pkgver() {\
  cd "\$pkgname"\
  ( set -o pipefail\
    git describe --long --abbrev=7 2\>/dev/null \| sed 's/\\\[^-\]\*-g\\/r\1/;s/-/./g' \|\|\
    printf "r%s.%s" "\$(git rev-list --count HEAD)" "\$(git rev-parse --short=7 HEAD)"\
  )\
}

0.9.9.r27.g2b039da  # 存在标签时\
r1581.2b039da       # 无标签时回退方案\

<div class="mw-heading mw-heading3">

### Mercurial

</div>

pkgver() {\
  cd "\$pkgname"\
  printf "r%s.%s" "\$(hg identify -n)" "\$(hg identify -i)"\
}

r2813.75881cc5391e\

<div class="mw-heading mw-heading3">

### Subversion

</div>

pkgver() {\
  cd "\$pkgname"\
  local ver="\$(svnversion)"\
  printf "r%s" "\${ver//\[\[:alpha:\]\]}"\
}

r8546\

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**应优先采用项目正式发布版本（如果有），而非使用 `0.` 占位符。

</div>

<div class="mw-heading mw-heading3">

### <span id=".E5.9B.9E.E9.80.80.E6.96.B9.E6.A1.88"></span>回退方案

</div>

当无法从仓库提取有效版本时，可使用当前日期：

pkgver() {\
  date +%Y%m%d\
}

20130408\

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**此方法无法唯一标识代码状态，应尽量避免使用。

</div>

<div class="mw-heading mw-heading2">

## <span id=".E6.8F.90.E7.A4.BA.E4.B8.8E.E6.8A.80.E5.B7.A7"></span>提示与技巧

</div>

<div class="mw-heading mw-heading3">

### <span id="Git_.E5.AD.90.E6.A8.A1.E5.9D.97"></span>Git 子模块

</div>

Git 子模块的处理需要特别注意。核心思路是将子模块自身的 URL 直接添加到 `sources` 数组，然后在 `prepare()` 阶段进行引用。

下游项目开发者可能不会使用与上游仓库相同的子模块命名。要查看 Git 子模块名称，需访问项目仓库中的 `.gitmodules` 文件。例如，上游开发者命名为 *`lib-dependency`* 的仓库，在下游 `.gitmodules` 中可能注册为 *`libs/libdep`* 子模块。

\[submodule "***libs/libdep***"\]\
  path = ***libs/libdep***\
  url = https://example.org/lib-dependency/***lib-dependency***.git\

source=("git+https://example.org/main-project/main-project.git"\
        https://example.org/lib-dependency/***lib-dependency***.git)\
\
prepare() {\
  cd main-project\
  git submodule init\
  git config submodule.***libs/libdep***.url "\$srcdir/***lib-dependency***"\
  git -c protocol.file.allow=always submodule update\
}\

<div class="mw-heading mw-heading3">

### <span id="Git_.E5.A4.A7.E6.96.87.E4.BB.B6.E5.AD.98.E5.82.A8.EF.BC.88LFS.EF.BC.89"></span>Git 大文件存储（LFS）

</div>

Git 大文件存储（LFS）需要一些额外配置：

makedepends=(... 'git-lfs')\

prepare() {\
  git lfs install --local\
  git remote add network-origin https://example.org/upstream/lfs/repo\
  git lfs fetch network-origin\
  git lfs checkout\
}\

这在子模块中使用 LFS 时也可用：

prepare() {\
  git submodule init\
  git config submodule.***libs/libdep***.url "\$srcdir/***lib-dependency***"\
  git -c protocol.file.allow=always submodule update\
\
  git -C ***libs/libdep*** lfs install --local\
  git -C ***libs/libdep*** remote add network-origin https://example.org/upstream/lfs/repo\
  git -C ***libs/libdep*** lfs fetch network-origin\
  git -C ***libs/libdep*** lfs checkout\
}\

<div class="mw-heading mw-heading3">

### <span id="Git_.E6.A0.A1.E9.AA.8C.E5.92.8C"></span>Git 校验和

</div>

当通过 `git+https://domain.invalid/repository.git#tag=v1.0.0` 引用稳定的 Git 标签或特定提交作为源时，可以在 `PKGBUILD` 中指定校验和。只需使用 `makepkg -g` 或 `updatepkgsums` 生成校验和，操作方式与其他非 Git 源相同。

</div>
