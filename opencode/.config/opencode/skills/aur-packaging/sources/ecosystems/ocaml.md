<div class="mw-content-ltr mw-parser-output" lang="zh-Hans-CN" dir="ltr">

<div class="noprint archwiki-template-message">

<span class="mw-default-size" typeof="mw:File"><a href="../File:Tango-preferences-desktop-locale.png" class="mw-file-description"><img src="../File:Tango-preferences-desktop-locale.png" class="mw-file-element" decoding="async" width="48" height="48" /></a></span>**本文或本节需要<a href="../Project:Contributing_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87).html#%E7%BF%BB%E8%AF%91" class="mw-redirect" title="Project:Contributing (简体中文)">翻译</a>。要贡献翻译，请访问[简体中文翻译团队](../Project:%E7%BF%BB%E8%AF%91%E5%9B%A2%E9%98%9F.html "Project:翻译团队")。**

<div>

**附注：** 尚有一些段落未翻译完全（在 <a href="../zh-cn/Talk:OCaml_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html" class="external text" rel="nofollow">Talk:OCaml 打包准则#</a> 中讨论）

</div>

</div>

<div class="aside archwiki-template-box archwiki-template-box-note noexcerpt">

**翻译状态：**

- 本文（或部分内容）译自 <a href="https://wiki.archlinux.org/title/OCaml_package_guidelines" class="extiw" title="arch:OCaml package guidelines">OCaml package guidelines</a>，最近一次同步于 2025-07-14，若英文版本有所<a href="https://wiki.archlinux.org/title/OCaml_package_guidelines?diff=0&amp;oldid=812144" class="external text" rel="nofollow">更改</a>，则您可以帮助同步与[翻译](../zh-cn/Help:%E7%BF%BB%E8%AF%91.html "Help:翻译")更改的内容。
- 您可以在 <a href="https://wiki.archlinux.org/title/OCaml_package_guidelines_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)?action=history" class="external text" rel="nofollow">ArchWiki 的对应页面</a>找到本文翻译的**原始**修订历史。
- 本文可能与英文原文存在出入。

</div>

<div class="archwiki-template-box" style="display:block; text-align: center; margin-bottom: 1em;">

**[Arch 打包准则](../zh-cn/Arch_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Arch 打包准则")**

------------------------------------------------------------------------

<a href="../zh-cn/32_%E4%BD%8D%E8%BD%AF%E4%BB%B6%E5%8C%85%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html" class="mw-redirect" title="32位软件包打包准则">32 位</a> – [安全](../zh-cn/Arch_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99/%E5%AE%89%E5%85%A8.html "Arch 打包准则/安全") – [CLR](../zh-cn/CLR_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "CLR 软件打包准则") – [CMake](../zh-cn/CMake_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "CMake 软件打包准则") – [DKMS](../zh-cn/DKMS_%E8%BD%AF%E4%BB%B6%E5%8C%85%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "DKMS 软件包打包准则") – [Eclipse](../zh-cn/Eclipse_%E6%8F%92%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Eclipse 插件打包准则") – [Electron](../zh-cn/Electron_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Electron 打包准则") – [Free Pascal](../zh-cn/Free_Pascal_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Free Pascal 打包准则") – <a href="/wzh/index.php?title=GNOME_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="GNOME package guidelines（页面不存在）">GNOME</a> – [Go](../zh-cn/Go_%E8%AF%AD%E8%A8%80%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Go 语言软件打包准则") – [Haskell](../zh-cn/Haskell_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Haskell 打包准则") – [Java](../zh-cn/Java_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Java 打包准则") – [交叉编译工具](../zh-cn/%E4%BA%A4%E5%8F%89%E7%BC%96%E8%AF%91%E5%B7%A5%E5%85%B7%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "交叉编译工具打包准则") – [KDE](../zh-cn/KDE_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "KDE 软件打包准则") – <a href="/wzh/index.php?title=Lisp_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Lisp package guidelines（页面不存在）">Lisp</a> – <a href="/wzh/index.php?title=Meson_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Meson package guidelines（页面不存在）">Meson</a> – <a href="/wzh/index.php?title=MinGW_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="MinGW package guidelines（页面不存在）">MinGW</a> – [内核模块](../zh-cn/%E5%86%85%E6%A0%B8%E6%A8%A1%E5%9D%97%E6%89%93%E5%8C%85%E6%8C%87%E5%8D%97.html "内核模块打包指南") – [Node.js](../zh-cn/Node.js_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Node.js 打包准则") – <a href="/wzh/index.php?title=Nonfree_applications_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Nonfree applications package guidelines（页面不存在）">Nonfree</a> – <span class="mw-selflink selflink">OCaml</span> – <a href="/wzh/index.php?title=Perl_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Perl package guidelines（页面不存在）">Perl</a> – [PHP](../zh-cn/PHP_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "PHP 打包准则") – [Python](../zh-cn/Python_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Python 打包准则") – [R](../zh-cn/R_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "R 软件打包准则") – <a href="/wzh/index.php?title=Ruby_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Ruby package guidelines（页面不存在）">Ruby</a> – [Rust](../zh-cn/Rust_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Rust 软件打包准则") – <a href="/wzh/index.php?title=Shell_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Shell package guidelines（页面不存在）">Shell</a> – [VCS](../zh-cn/VCS_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "VCS 软件打包准则") – <a href="/wzh/index.php?title=Web_application_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Web application package guidelines（页面不存在）">Web</a> – <a href="../zh-cn/Wine_package_guidelines.html" class="mw-redirect" title="Wine package guidelines">Wine</a> – [字体](../zh-cn/%E5%AD%97%E4%BD%93%E6%89%93%E5%8C%85%E6%8C%87%E5%8D%97.html "字体打包指南")

</div>

为使用 <a href="https://en.wikipedia.org/wiki/OCaml" class="extiw" title="wikipedia:OCaml">OCaml</a> 编写的软件创建 [PKGBUILD](../zh-cn/PKGBUILD.html "PKGBUILD")。

<div class="mw-heading mw-heading2">

## <span id=".E5.91.BD.E5.90.8D"></span>命名

</div>

若是库则采用 `ocaml-`*`modulename`* 的格式，若是程序则采用程序名。不论如何，名字都应当是全小写的。

<div class="mw-heading mw-heading2">

## <span id=".E6.96.87.E4.BB.B6.E7.9A.84.E4.BD.8D.E7.BD.AE"></span>文件的位置

</div>

<div class="mw-heading mw-heading3">

### <span id=".E5.BA.93"></span>库

</div>

OCaml 库应当安装到 `/usr/lib/ocaml`。到 `/usr/lib/ocaml/site-lib` 已经弃用。

OCaml 库应当使用 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=ocaml-findlib" class="external text" rel="nofollow">ocaml-findlib</a></span><sup><span class="small">包</span></sup></span> 来安装。`ocaml-findlib` 在包种包含了元信息来使库管理更加简单。这是一种惯例，现在很多 OCaml 都需要它。

`ocaml-findlib` 从应被包含在源码包中的 `META` 的文件中取出必要的数据。If this file is not included, one should either be obtained from the corresponding Debian, Ubuntu, or Fedora package, or created for the package by the maintainer. A request to include the file should also be made to the upstream developers of the package.

The `OCAMLFIND_DESTDIR` variable should be used when installing packages with `ocaml-findlib`. See the example PKGBUILD below for details.

<div class="mw-heading mw-heading3">

### OASIS

</div>

OCaml packages that install executables using OASIS ignore `DESTDIR`. This is a known limitation of OASIS (<a href="https://github.com/ocaml/oasis/issues/493" class="external text" rel="nofollow">issue #493</a>). One way to enable `DESTDIR`-like functionality is to run the `configure` script with the `--destdir` argument, like so:

build() {\
    cd "\${srcname}-\${pkgver}"\
    ./configure --prefix /usr --destdir "\$pkgdir"\
\
    # build commands\
}\

<div class="mw-heading mw-heading2">

## OCaml bytecode and levels

</div>

OCaml can run code on multiple "levels", the top level interprets OCaml Code without compiling, the bytecode level creates machine independent bytecode and the native level creates machine code binaries (just like C/C++).

When building OCaml Packages you need to be aware if the build process is compiling native machine code, bytecode, or as in many cases both. This creates a number of situations which can cause problems with package options and the right dependencies.

If bytecode is produced at all then the PKGBUILD must contain the following to protect the bytecode:

options=('!strip')\

If the package does not contain bytecode and only distributes a binary, then `ocaml` is not needed as a dependency, but it of course is required as a makedepends since the `ocaml` package provides the OCaml compiler. If the package contains both native code and bytecode then `ocaml` should be a dependency and a makedepends.

OCaml code is rarely (if ever) distributed as bytecode only and will almost always include native code: the only case where using *any* as the *arch* is advisable is when only un-compiled source code is distributed, usually with a library, though many libraries still distribute native code.

The moral of the story here is to be aware of what it is you are distributing, chances are your package contains both native machine code and bytecode.

<div class="mw-heading mw-heading2">

## <span id=".E4.BD.BF.E7.94.A8_Dune_.E7.9A.84_PKGBUILD_.E5.AE.9E.E4.BE.8B"></span>使用 Dune 的 PKGBUILD 实例

</div>

<a href="https://dune.build/" class="external text" rel="nofollow">Dune</a> 是一种新的构建系统，现在已经越来越多的被用于 OCaml 项目中。

One thing to be aware is that a single project can build several "packages" in the OPAM/findlib sense, each with its own directory in `/usr/lib/ocaml/`. See <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=ocaml-cairo" class="external text" rel="nofollow">ocaml-cairo</a></span><sup><span class="small">包</span></sup></span> for an example. For release builds, all "packages" have to be explicitly listed.

\# Contributor: Your Name \<youremail@domain.com\>\
\
pkgname=ocaml-\<package name\>\
pkgver=4.2\
pkgrel=1\
license=(*)*\
arch=('x86_64')\
pkgdesc="An OCaml Package"\
url=""\
depends=('ocaml')\
makedepends=('dune')\
source=()\
options=('!strip')\
sha256sums=()\
\
build() {\
  cd "\${pkgname}-\${pkgver}"\
  # The "-p" flag is necessary for release builds, see the Dune manpage. Dune will complain if you forget some packages.\
  dune build -p package1,package1-extension,package2\
}\
\
package() {\
   cd "\${pkgname}-\${pkgver}"\
    \
   DESTDIR="\${pkgdir}" dune install --prefix "/usr" --libdir "/usr/lib/ocaml" --docdir "/usr/share/doc"

<div class="mw-heading mw-heading2">

## <span id=".E4.BD.BF.E7.94.A8_findlib_.E7.9A.84_PKGBUILD_.E5.AE.9E.E4.BE.8B"></span>使用 findlib 的 PKGBUILD 实例

</div>

\# Contributor: Your Name \<youremail@domain.com\>\
\
pkgname=ocaml-\<package name\>\
pkgver=4.2\
pkgrel=1\
license=(*)*\
arch=('x86_64')\
pkgdesc="An OCaml Package"\
url=""\
depends=('ocaml')\
makedepends=('ocaml-findlib')\
source=()\
options=('!strip')\
md5sums=()\
\
OCAMLFIND_DESTDIR="\${pkgdir}\$(ocamlfind printconf destdir)"\
\
build() {\
  cd "\${pkgname}-\${pkgver}"\
  mkdir -p "\$OCAMLFIND_DESTDIR"\
  ./configure --prefix=/usr\
  make\
}\
\
package() {\
  cd "\${pkgname}-\${pkgver}"\
  env DESTDIR="\${pkgdir}" \\\
    OCAMLFIND_DESTDIR="\$OCAMLFIND_DESTDIR" \\\
    make install\
}

需要留意的是许多 OCaml 包都需要给 `make` 与 `make install` 一些额外信息。同时，请去除 `!strip` 选项，并在包不编译为字节码时指定架构。

</div>
