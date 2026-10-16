<div class="mw-content-ltr mw-parser-output" lang="zh-Hans-CN" dir="ltr">

<div class="aside archwiki-template-box archwiki-template-box-note noexcerpt">

**翻译状态：**

- 本文（或部分内容）译自 <a href="https://wiki.archlinux.org/title/Font_package_guidelines" class="extiw" title="arch:Font package guidelines">Font package guidelines</a>，最近一次同步于 2022-05-27，若英文版本有所<a href="https://wiki.archlinux.org/title/Font_package_guidelines?diff=0&amp;oldid=719729" class="external text" rel="nofollow">更改</a>，则您可以帮助同步与[翻译](../zh-cn/Help:%E7%BF%BB%E8%AF%91.html "Help:翻译")更改的内容。
- 您可以在 <a href="https://wiki.archlinux.org/title/Font_package_guidelines_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)?action=history" class="external text" rel="nofollow">ArchWiki 的对应页面</a>找到本文翻译的**原始**修订历史。
- 本文可能与英文原文存在出入。

</div>

<div class="archwiki-template-box" style="display:block; text-align: center; margin-bottom: 1em;">

**[Arch 打包准则](../zh-cn/Arch_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Arch 打包准则")**

------------------------------------------------------------------------

<a href="../zh-cn/32_%E4%BD%8D%E8%BD%AF%E4%BB%B6%E5%8C%85%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html" class="mw-redirect" title="32位软件包打包准则">32 位</a> – [安全](../zh-cn/Arch_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99/%E5%AE%89%E5%85%A8.html "Arch 打包准则/安全") – [CLR](../zh-cn/CLR_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "CLR 软件打包准则") – [CMake](../zh-cn/CMake_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "CMake 软件打包准则") – [DKMS](../zh-cn/DKMS_%E8%BD%AF%E4%BB%B6%E5%8C%85%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "DKMS 软件包打包准则") – [Eclipse](../zh-cn/Eclipse_%E6%8F%92%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Eclipse 插件打包准则") – [Electron](../zh-cn/Electron_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Electron 打包准则") – [Free Pascal](../zh-cn/Free_Pascal_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Free Pascal 打包准则") – <a href="/wzh/index.php?title=GNOME_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="GNOME package guidelines（页面不存在）">GNOME</a> – [Go](../zh-cn/Go_%E8%AF%AD%E8%A8%80%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Go 语言软件打包准则") – [Haskell](../zh-cn/Haskell_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Haskell 打包准则") – [Java](../zh-cn/Java_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Java 打包准则") – [交叉编译工具](../zh-cn/%E4%BA%A4%E5%8F%89%E7%BC%96%E8%AF%91%E5%B7%A5%E5%85%B7%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "交叉编译工具打包准则") – [KDE](../zh-cn/KDE_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "KDE 软件打包准则") – <a href="/wzh/index.php?title=Lisp_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Lisp package guidelines（页面不存在）">Lisp</a> – <a href="/wzh/index.php?title=Meson_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Meson package guidelines（页面不存在）">Meson</a> – <a href="/wzh/index.php?title=MinGW_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="MinGW package guidelines（页面不存在）">MinGW</a> – [内核模块](../zh-cn/%E5%86%85%E6%A0%B8%E6%A8%A1%E5%9D%97%E6%89%93%E5%8C%85%E6%8C%87%E5%8D%97.html "内核模块打包指南") – [Node.js](../zh-cn/Node.js_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Node.js 打包准则") – <a href="/wzh/index.php?title=Nonfree_applications_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Nonfree applications package guidelines（页面不存在）">Nonfree</a> – [OCaml](../zh-cn/OCaml_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "OCaml 打包准则") – <a href="/wzh/index.php?title=Perl_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Perl package guidelines（页面不存在）">Perl</a> – [PHP](../zh-cn/PHP_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "PHP 打包准则") – [Python](../zh-cn/Python_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Python 打包准则") – [R](../zh-cn/R_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "R 软件打包准则") – <a href="/wzh/index.php?title=Ruby_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Ruby package guidelines（页面不存在）">Ruby</a> – [Rust](../zh-cn/Rust_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Rust 软件打包准则") – <a href="/wzh/index.php?title=Shell_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Shell package guidelines（页面不存在）">Shell</a> – [VCS](../zh-cn/VCS_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "VCS 软件打包准则") – <a href="/wzh/index.php?title=Web_application_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Web application package guidelines（页面不存在）">Web</a> – <a href="../zh-cn/Wine_package_guidelines.html" class="mw-redirect" title="Wine package guidelines">Wine</a> – <span class="mw-selflink selflink">字体</span>

</div>

本文档提供为<a href="../zh-cn/%E5%AD%97%E4%BD%93.html" class="mw-redirect" title="Fonts">字体</a>撰写 [PKGBUILD](../zh-cn/PKGBUILD.html "PKGBUILD") 的建议规范。

<div class="mw-heading mw-heading2">

## <span id=".E9.80.9A.E7.94.A8.E6.8C.87.E5.BC.95"></span>通用指引

</div>

<div class="mw-heading mw-heading3">

### <span id=".E5.8C.85.E5.91.BD.E5.90.8D"></span>包命名

</div>

- <a href="https://zh.wikipedia.org/wiki/TrueType" class="extiw" title="zhwp:TrueType">TTF</a> 字体使用`ttf-`前缀。
- <a href="https://zh.wikipedia.org/wiki/OpenType" class="extiw" title="zhwp:OpenType">OTF</a> 字体使用`otf-`前缀。

若为<a href="https://zh.wikipedia.org/wiki/%E5%8F%AF%E5%8F%98%E5%AD%97%E4%BD%93" class="extiw" title="zhwp:可变字体">可变字体</a>，使用`-variable`后缀。

包名应使用全小写。

<div class="mw-heading mw-heading3">

### <span id=".E5.8C.85.E6.8F.8F.E8.BF.B0"></span>包描述

</div>

至少要表明它是一个字体，并注明字体类别：衬线体、非衬线体、等宽等。

<div class="mw-heading mw-heading3">

### <span id=".E6.9E.B6.E6.9E.84"></span>架构

</div>

字体是与架构无关的。使用`arch=(any)`。

<div class="mw-heading mw-heading3">

### <span id=".E4.BE.9D.E8.B5.96"></span>依赖

</div>

字体没有依赖项。但是许多仓库里的包依赖于 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=fontconfig" class="external text" rel="nofollow">fontconfig</a></span><sup><span class="small">包</span></sup></span> 和 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=xorg-mkfontscale" class="external text" rel="nofollow">xorg-mkfontscale</a></span><sup><span class="small">包</span></sup></span>，这些依赖是以前字体包还需要使用安装脚本更新字体缓存时的历史遗留。现在可以用 [pacman 钩子](../zh-cn/Pacman.html#%E9%92%A9%E5%AD%90 "Pacman")来完成这项工作。安装上述两个包时，`/usr/share/fonts/`下的所有字体都会被缓存，因此无需再强制使用 fontconfig 或 mkfontscale。

<div class="mw-heading mw-heading3">

### <span id=".E6.8F.90.E4.BE.9B"></span>提供

</div>

许多应用依赖于虚拟包`ttf-font`。若你的字体家族满足<a href="https://archlinux.org/todo/fix-ttf-font-default-font-setup" class="external text" rel="nofollow">该页面</a>的要求，可添加`provides=('ttf-font')`。

<div class="mw-heading mw-heading3">

### <span id=".E6.9D.A5.E6.BA.90"></span>来源

</div>

可按下列顺序查询：

- 官方网站，或某个如 GitHub 的托管平台
- <a href="https://fonts.google.com" class="external text" rel="nofollow">Google Fonts</a>: `https://fonts.google.com/download?family=`*`Name`*
- <a href="https://www.fontsquirrel.com" class="external text" rel="nofollow">Font Squirrel</a>、<a href="https://fontlibrary.org" class="external text" rel="nofollow">Font Library</a>、<a href="https://www.ffonts.net" class="external text" rel="nofollow">FFonts</a>、<a href="https://www.1001freefonts.com" class="external text" rel="nofollow">1001 Fonts</a>、 <a href="https://www.dafont.com" class="external text" rel="nofollow">DaFont</a>

以下来源不推荐：

- <a href="https://www.fontspace.com" class="external text" rel="nofollow">FontSpace</a>（校验码因不明原因变动）

<div class="mw-heading mw-heading2">

## <span id=".E6.89.93.E5.8C.85"></span>打包

</div>

下列片段是以 OFL（SIL Open Font License）授权的 OTF 字体的示例片段：

license=('OFL')\
...\
package() {\
  install -Dm644 -t "\$pkgdir/usr/share/fonts/OTF" "path/to/font/\*.otf"\
  install -Dm644 -t "\$pkgdir/usr/share/licenses/\$pkgname" "path/to/license/OFL.txt"\
}\

- <a href="https://zh.wikipedia.org/wiki/SIL%E5%BC%80%E6%BA%90%E5%AD%97%E4%BD%93%E6%8E%88%E6%9D%83" class="extiw" title="zhwp:SIL开源字体授权">OFL</a>理论上是个[自定义许可](../zh-cn/PKGBUILD.html#license "PKGBUILD")，因此字体包的许可证文件需要安装在`/usr/share/licenses/[包名]`。
- 若有许多个文件，目标目录名可考虑使用`包名`而非`OTF`。

<div class="mw-heading mw-heading2">

## <span id=".E7.A4.BA.E4.BE.8B.E5.8C.85"></span>示例包

</div>

- <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://aur.archlinux.org/packages/ttf-merriweather-sans/" class="external text" rel="nofollow">ttf-merriweather-sans</a></span><sup><span class="small">AUR</span></sup></span>
- <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://aur.archlinux.org/packages/otf-commissioner/" class="external text" rel="nofollow">otf-commissioner</a></span><sup><span class="small">AUR</span></sup></span> - OTF、TTF、可变三种包分离

<div class="mw-heading mw-heading2">

## <span id=".E5.8F.82.E8.A7.81"></span>参见

</div>

- <a href="https://bbs.archlinux.org/viewtopic.php?pid=1888912" class="external text" rel="nofollow">论坛讨论</a>

</div>
