<div class="mw-content-ltr mw-parser-output" lang="zh-Hans-CN" dir="ltr">

<div class="aside archwiki-template-box archwiki-template-box-note noexcerpt">

**翻译状态：**

- 本文（或部分内容）译自 <a href="https://wiki.archlinux.org/title/Kernel_module_package_guidelines" class="extiw" title="arch:Kernel module package guidelines">Kernel module package guidelines</a>，最近一次同步于 2022-08-08，若英文版本有所<a href="https://wiki.archlinux.org/title/Kernel_module_package_guidelines?diff=0&amp;oldid=740618" class="external text" rel="nofollow">更改</a>，则您可以帮助同步与[翻译](../zh-cn/Help:%E7%BF%BB%E8%AF%91.html "Help:翻译")更改的内容。
- 您可以在 <a href="https://wiki.archlinux.org/title/Kernel_module_package_guidelines_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)?action=history" class="external text" rel="nofollow">ArchWiki 的对应页面</a>找到本文翻译的**原始**修订历史。
- 本文可能与英文原文存在出入。

</div>

<div class="archwiki-template-box" style="display:block; text-align: center; margin-bottom: 1em;">

**[Arch 打包准则](../zh-cn/Arch_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Arch 打包准则")**

------------------------------------------------------------------------

<a href="../zh-cn/32_%E4%BD%8D%E8%BD%AF%E4%BB%B6%E5%8C%85%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html" class="mw-redirect" title="32位软件包打包准则">32 位</a> – [安全](../zh-cn/Arch_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99/%E5%AE%89%E5%85%A8.html "Arch 打包准则/安全") – [CLR](../zh-cn/CLR_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "CLR 软件打包准则") – [CMake](../zh-cn/CMake_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "CMake 软件打包准则") – [DKMS](../zh-cn/DKMS_%E8%BD%AF%E4%BB%B6%E5%8C%85%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "DKMS 软件包打包准则") – [Eclipse](../zh-cn/Eclipse_%E6%8F%92%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Eclipse 插件打包准则") – [Electron](../zh-cn/Electron_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Electron 打包准则") – [Free Pascal](../zh-cn/Free_Pascal_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Free Pascal 打包准则") – <a href="/wzh/index.php?title=GNOME_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="GNOME package guidelines（页面不存在）">GNOME</a> – [Go](../zh-cn/Go_%E8%AF%AD%E8%A8%80%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Go 语言软件打包准则") – [Haskell](../zh-cn/Haskell_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Haskell 打包准则") – [Java](../zh-cn/Java_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Java 打包准则") – [交叉编译工具](../zh-cn/%E4%BA%A4%E5%8F%89%E7%BC%96%E8%AF%91%E5%B7%A5%E5%85%B7%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "交叉编译工具打包准则") – [KDE](../zh-cn/KDE_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "KDE 软件打包准则") – <a href="/wzh/index.php?title=Lisp_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Lisp package guidelines（页面不存在）">Lisp</a> – <a href="/wzh/index.php?title=Meson_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Meson package guidelines（页面不存在）">Meson</a> – <a href="/wzh/index.php?title=MinGW_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="MinGW package guidelines（页面不存在）">MinGW</a> – <span class="mw-selflink selflink">内核模块</span> – [Node.js](../zh-cn/Node.js_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Node.js 打包准则") – <a href="/wzh/index.php?title=Nonfree_applications_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Nonfree applications package guidelines（页面不存在）">Nonfree</a> – [OCaml](../zh-cn/OCaml_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "OCaml 打包准则") – <a href="/wzh/index.php?title=Perl_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Perl package guidelines（页面不存在）">Perl</a> – [PHP](../zh-cn/PHP_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "PHP 打包准则") – [Python](../zh-cn/Python_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Python 打包准则") – [R](../zh-cn/R_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "R 软件打包准则") – <a href="/wzh/index.php?title=Ruby_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Ruby package guidelines（页面不存在）">Ruby</a> – [Rust](../zh-cn/Rust_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Rust 软件打包准则") – <a href="/wzh/index.php?title=Shell_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Shell package guidelines（页面不存在）">Shell</a> – [VCS](../zh-cn/VCS_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "VCS 软件打包准则") – <a href="/wzh/index.php?title=Web_application_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Web application package guidelines（页面不存在）">Web</a> – <a href="../zh-cn/Wine_package_guidelines.html" class="mw-redirect" title="Wine package guidelines">Wine</a> – [字体](../zh-cn/%E5%AD%97%E4%BD%93%E6%89%93%E5%8C%85%E6%8C%87%E5%8D%97.html "字体打包指南")

</div>

<div class="mw-heading mw-heading2">

## <span id=".E6.89.93.E5.8C.85.E5.88.86.E7.A6.BB"></span>打包分离

</div>

包含<a href="../zh-cn/Kernel_module.html" class="mw-redirect" title="Kernel module">内核模块</a>的软件包应予以特殊对待，以支持希望在系统上安装多个内核的用户。

当打包包含内核模块和其他非模块支持文件/实用程序的软件时，将内核模块与支持文件分开很重要。

<div class="mw-heading mw-heading3">

### <span id=".E5.87.86.E5.88.99"></span>准则

</div>

打包此类软件时（以 [NVIDIA](../zh-cn/NVIDIA.html "NVIDIA") 驱动程序为例），约定为：

- 创建一个 `nvidia` 包，其中只包含为vanilla内核构建的内核模块
- 创建包含支持文件的 `nvidia-utils` 包
- 确保 `nvidia` 依赖于 `nvidia-utils`（除非有充分的理由不这样做）
- 对于另一个内核，比如 `linux-mm`，创建 `nvidia-mm` ，其中包含针对该内核构建的内核模块，该内核提供 `nvidia` ，并且还依赖于 `nvidia-utils`
- 确保 `nvidia` 依赖于当前的主要内核版本，例如：
  depends=('linux' 'nvidia-utils')

<div class="mw-heading mw-heading3">

### <span id=".E5.9F.BA.E6.9C.AC.E5.8E.9F.E7.90.86"></span>基本原理

</div>

虽然为不同内核构建的内核模块始终位于不同的目录中并且可以和平共处，但是支持文件预计会在一个位置找到。如果一个软件包包含模块和支持文件，则您将无法为多个内核安装模块，因为软件包中的支持文件将导致 pacman 文件冲突。

模块和随附文件的分离允许在同一系统上为多个内核安装多个内核模块软件包，同时在预期位置之间共享支持文件。

<div class="mw-heading mw-heading2">

## <span id=".E6.96.87.E4.BB.B6.E6.94.BE.E7.BD.AE"></span>文件放置

</div>

如果软件包中包含旨在覆盖现有同名模块的内核模块，则应将该模块放在 `/lib/modules/`*`X`*`.`*`Y`*`.`*`Z`*`-arch1-1/updates` 目录中。当 *depmod* 运行时，此目录中的模块将优先考虑。

</div>
