<div class="mw-content-ltr mw-parser-output" lang="zh-Hans-CN" dir="ltr">

<div class="aside archwiki-template-box archwiki-template-box-note noexcerpt">

**翻译状态：**

- 本文（或部分内容）译自 <a href="https://wiki.archlinux.org/title/Wine_package_guidelines" class="extiw" title="arch:Wine package guidelines">Wine package guidelines</a>，最近一次同步于 2025-12-18，若英文版本有所<a href="https://wiki.archlinux.org/title/Wine_package_guidelines?diff=0&amp;oldid=859024" class="external text" rel="nofollow">更改</a>，则您可以帮助同步与[翻译](../zh-cn/Help:%E7%BF%BB%E8%AF%91.html "Help:翻译")更改的内容。
- 您可以在 <a href="https://wiki.archlinux.org/title/Wine_package_guidelines_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)?action=history" class="external text" rel="nofollow">ArchWiki 的对应页面</a>找到本文翻译的**原始**修订历史。
- 本文可能与英文原文存在出入。

</div>

<div class="archwiki-template-box" style="display:block; text-align: center; margin-bottom: 1em;">

**[Arch 打包准则](../zh-cn/Arch_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Arch 打包准则")**

------------------------------------------------------------------------

<a href="../zh-cn/32_%E4%BD%8D%E8%BD%AF%E4%BB%B6%E5%8C%85%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html" class="mw-redirect" title="32位软件包打包准则">32 位</a> – [安全](../zh-cn/Arch_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99/%E5%AE%89%E5%85%A8.html "Arch 打包准则/安全") – [CLR](../zh-cn/CLR_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "CLR 软件打包准则") – [CMake](../zh-cn/CMake_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "CMake 软件打包准则") – [DKMS](../zh-cn/DKMS_%E8%BD%AF%E4%BB%B6%E5%8C%85%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "DKMS 软件包打包准则") – [Eclipse](../zh-cn/Eclipse_%E6%8F%92%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Eclipse 插件打包准则") – [Electron](../zh-cn/Electron_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Electron 打包准则") – [Free Pascal](../zh-cn/Free_Pascal_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Free Pascal 打包准则") – <a href="/wzh/index.php?title=GNOME_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="GNOME package guidelines（页面不存在）">GNOME</a> – [Go](../zh-cn/Go_%E8%AF%AD%E8%A8%80%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Go 语言软件打包准则") – [Haskell](../zh-cn/Haskell_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Haskell 打包准则") – [Java](../zh-cn/Java_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Java 打包准则") – [交叉编译工具](../zh-cn/%E4%BA%A4%E5%8F%89%E7%BC%96%E8%AF%91%E5%B7%A5%E5%85%B7%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "交叉编译工具打包准则") – [KDE](../zh-cn/KDE_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "KDE 软件打包准则") – <a href="/wzh/index.php?title=Lisp_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Lisp package guidelines（页面不存在）">Lisp</a> – <a href="/wzh/index.php?title=Meson_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Meson package guidelines（页面不存在）">Meson</a> – <a href="/wzh/index.php?title=MinGW_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="MinGW package guidelines（页面不存在）">MinGW</a> – [内核模块](../zh-cn/%E5%86%85%E6%A0%B8%E6%A8%A1%E5%9D%97%E6%89%93%E5%8C%85%E6%8C%87%E5%8D%97.html "内核模块打包指南") – [Node.js](../zh-cn/Node.js_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Node.js 打包准则") – <a href="/wzh/index.php?title=Nonfree_applications_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Nonfree applications package guidelines（页面不存在）">Nonfree</a> – [OCaml](../zh-cn/OCaml_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "OCaml 打包准则") – <a href="/wzh/index.php?title=Perl_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Perl package guidelines（页面不存在）">Perl</a> – [PHP](../zh-cn/PHP_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "PHP 打包准则") – [Python](../zh-cn/Python_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Python 打包准则") – [R](../zh-cn/R_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "R 软件打包准则") – <a href="/wzh/index.php?title=Ruby_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Ruby package guidelines（页面不存在）">Ruby</a> – [Rust](../zh-cn/Rust_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Rust 软件打包准则") – <a href="/wzh/index.php?title=Shell_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Shell package guidelines（页面不存在）">Shell</a> – [VCS](../zh-cn/VCS_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "VCS 软件打包准则") – <a href="/wzh/index.php?title=Web_application_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Web application package guidelines（页面不存在）">Web</a> – <a href="../zh-cn/Wine_package_guidelines.html" class="mw-redirect" title="Wine package guidelines">Wine</a> – [字体](../zh-cn/%E5%AD%97%E4%BD%93%E6%89%93%E5%8C%85%E6%8C%87%E5%8D%97.html "字体打包指南")

</div>

有不少 Windows 软件在 Linux 上也很有用，所以我们也可以为它们创建软件包，但两个操作系统上的区别使这一过程变得有点复杂。由于提供了源码的软件通常都会被移植到 Linux 上，因此本文将主要讨论 Win32 二进制文件相关内容。

<div class="mw-heading mw-heading2">

## <span id=".E9.A6.96.E5.85.88.E6.A3.80.E6.9F.A5"></span>首先检查

</div>

- 许可证：是否允许重新打包？
- 安装器：是否提供免安装版本？如果没有，是否可以静默安装？
- 便携性与洁净性：软件是否有便携性？是否洁净？

这里提到的便携性是指软件*从不*向注册表或目录外进行写入；洁净是指软件*从不*向自身目录进行写入，但可能会将设置写入到用户目录中。一个软件可以二者兼具（例如从不写入设置信息）或二者兼非（例如会向自身目录、其它目录和注册表等进行写入）。

<div class="mw-heading mw-heading3">

### <span id=".E8.AE.B8.E5.8F.AF.E8.AF.81"></span>许可证

</div>

通常来说许可证是安装路径下的一个文本文件。如果没找到，可以参考安装时显示的界面。如果它没有提到与重新打包相关的内容，则代表作者没有进行限制，可以继续。如果有相关内容，那通常会不允许移除任何文件，甚至是不允许进行重新打包。对于前者，只需确保 [makepkg](../zh-cn/Makepkg.html "Makepkg") 时没有文件丢失，然后可以在 `post_install` 阶段移除不需要的文件（例如卸载器）。对于后者，安装操作必须在 `post_install` 阶段完成，`build` 阶段只可用于复制安装文件。

<div class="mw-heading mw-heading3">

### <span id=".E5.AE.89.E8.A3.85.E5.99.A8"></span>安装器

</div>

类似 `.zip` 的压缩文件比 Windows 安装器处理起来简单得多。如果作者坚持通过安装器来分发软件包，可以查一下 <a href="https://web.archive.org/web/20180209090444/http://unattended.msfn.org/unattended.xp/page/list/switch" class="external text" rel="nofollow">MSFN</a> 或其它网页看看安装器是否支持静默安装。如果找不到办法，可以试试通过其它<a href="/wzh/index.php?title=Nonfree_applications_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Nonfree applications package guidelines（页面不存在）">解压工具</a>打开安装器，有时能行。

<div class="mw-heading mw-heading3">

### <span id=".E4.BE.BF.E6.90.BA.E6.80.A7.E4.B8.8E.E6.B4.81.E5.87.80.E6.80.A7"></span>便携性与洁净性

</div>

便携软件无需独立的 [Wine](../zh-cn/Wine.html "Wine") 模拟文件系统，可以在 <a href="https://www.portablefreeware.com/" class="external text" rel="nofollow">Portable Freeware</a> 上查下你的软件是否便携。

<div class="mw-heading mw-heading2">

## <span id=".E6.8C.87.E5.8D.97.E6.A6.82.E8.A6.81"></span>指南概要

</div>

打包 Windows 软件的过程基本上就是将应用文件作为数据，由 Wine 进行解析，就像 JVM 和 Java 字节码一样。

我们将把应用安装到 `/usr/share/"$pkgname"`，然后将应用所需文件写入到 `"$HOME"/."$pkgname"`。路径位于 `/usr/bin/"$pkgname"` 的一个小脚本将负责创建目录，有需要时进行配置，然后启动应用。

下面的部分将对各个步骤进行讲解。

这样，每个用户都可以保留其独立的设置信息，不会互相影响。

<div class="mw-heading mw-heading3">

### <span id=".E5.AE.89.E8.A3.85"></span>安装

</div>

如果应用没有安装器，那么安装过程就是单纯地解压文件到 `"$pkgdir"/usr/share/$pkgname`，并确保权限配置正常。以下命令可完成该操作：

\$ find "\$pkgdir"/usr/share -type f -exec chmod 644 "{}" \\\
\$ find "\$pkgdir"/usr/share -type d -exec chmod 755 "{}" \\\

如果无法直接解压，就需要创建一个 Wine 环境：

\$ install -m755 -d "\$srcdir"/tmp "\$srcdir"/tmp/env "\$srcdir"/tmp/local\
\$ export WINEPREFIX="\$srcdir"/tmp/env\
\$ export XDG_DATA_HOME="\$srcdir"/tmp/local\
\$ wine "\$srcdir"/installer.exe /silentoptions\

我们还没讲到便携软件，但如果应用不需要其编辑的注册表键值，可以直接复制以下目录：

"\$srcdir"/tmp/env/drive_c/Program\\Files/programname\

否则就需要复制所有注册表文件和应用安装的所有文件。`"$srcdir"/tmp/local` 中包含了菜单图标和桌面快捷方式，可以按需将其复制到软件包中。如果没有办法静默安装，或许也可以自行创建一个 `.tar.gz` 文件，然后传到网上以供下载。如果无法将安装过程自动化，可以强制用户使用安装器，并使用一些检查项来确保安装过程中没有出现异常（例如用户点了取消按钮）。

<div class="mw-heading mw-heading3">

### <span id=".2Fusr.2Fbin_.E8.84.9A.E6.9C.AC"></span>/usr/bin 脚本

</div>

该脚本用于配置设置目录并启动应用。如果应用具有便携性，那么脚本如下：

\#!/bin/bash\
unset WINEPREFIX\
if \[ ! -d "\$HOME"/.programname \] ; then\
   mkdir -p "\$HOME"/.programname\
   #prepare the environment here\
fi\
WINEDEBUG=-all wine "\$HOME"/.programname/programname "\$@"\

如果应用具有洁净性，那么脚本如下：

\#!/bin/bash\
export WINEPREFIX="\$HOME"/.programname/wine\
if \[ ! -d "\$HOME"/.programname \] ; then\
   mkdir -p "\$HOME"/.programname/wine\
   wineboot -u\
   #copy the registry file if needed\
fi\
WINEDEBUG=-all wine /usr/share/programname "\$@"\

可以看到，第二种情况中的脚本没有环境配置的步骤。实际上，由于洁净应用不会向自身目录进行写入，因此可以直接从 `/usr/share` 启动应用，设置信息会被写入到模拟文件系统中。

如果应用不具备便携性和洁净性，那就必须将这两种方法混合使用。

如果应用完全不写入设置信息，那么可以跳过 `if` 这一段，直接从 `/usr/share` 启动应用。

环境配置的具体步骤取决于应用，但可以参考以下经验法则： 如果应用：

- 只需要对文件进行读取，可以创建符号链接
- 如果需要对文件进行写入，则需要将其复制
- 如果无需使用某个文件，则可以无视

显然，最小运行步骤为 `WINEDEBUG=-all wine /usr/share/programname "$@"`。

通常，环境是通过在 `"$HOME"/.`*`programname`* 目录与 `/usr/share/`*`programname`* 文件之间建立符号链接来创建的。但由于某些 Windows 程序对路径非常挑剔，你可能需要直接在 `"$HOME"/.`*`programname`*`/wine/drive_c/Program\ Files/`*`programname`* 目录中创建符号链接。

当然，这些只是将 Win32 应用整合到 Linux 环境中的一种方法，可以自己进行变通和尝试。

举个例子，<a href="https://en.wikipedia.org/wiki/%CE%BCTorrent" class="extiw" title="wikipedia:μTorrent">μTorrent</a> 默认是个洁净应用，但很容易就能将其作为便携应用使用。鉴于该应用为单个文件且体积较小，单独为其创建 Wine 环境（约 5MB）有些小题大做了。更好的方法是符号链接到可执行文件，创建一个空 **settings.dat** 文件，使得能在 `$HOME/.utorrent` 目录下便携使用该应用。该方法还使用户可以在 `.utorrent` 目录中找到下载的 `.torrent` 文件副本。

<div class="mw-heading mw-heading3">

### UnionFsFuse

</div>

可以考虑使用 <a href="https://github.com/rpodgorny/unionfs-fuse" class="external text" rel="nofollow">UnionFsFuse</a>（<span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://aur.archlinux.org/packages/unionfs-fuse/" class="external text" rel="nofollow">unionfs-fuse</a></span><sup><span class="small">AUR</span></sup></span>），它可以将基础目录保留在 `/usr/share`，然后基本上全自动地将应用需写入的文件复制到 `$HOME/.programname`。

使用 UnionFsFuse 意味着需添加额外依赖，并会用到不是所有用户都已加载的 fuce 模块。但如果应用需要大量符号链接，或是不清楚应用具体需要写入哪些文件，那可以考虑使用该方法，只要确保 UnionFs 正确被挂/卸载即可。

<div class="mw-heading mw-heading2">

## <span id=".E7.A4.BA.E4.BE.8B"></span>示例

</div>

可在 <a href="https://aur.archlinux.org/rpc/v5/search/wine?by=depends" class="external free" rel="nofollow">https://aur.archlinux.org/rpc/v5/search/wine?by=depends</a> 查找依赖于 wine 的 AUR 软件包作为示例。

<div class="noprint archwiki-template-message">

<span class="mw-default-size" typeof="mw:File"><a href="../File:Tango-view-refresh-red.png" class="mw-file-description"><img src="../File:Tango-view-refresh-red.png" class="mw-file-element" decoding="async" width="48" height="48" /></a></span>**本文或本节内容已经过时。**

<div>

**原因：** AUR 中没有 emule 软件包，需要使用其它示例。 (在<a href="../zh-cn/Talk:Wine_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html" class="external text" rel="nofollow">Talk:Wine 打包准则</a>讨论)

</div>

</div>

We will make a package for <a href="https://www.emule-project.net/" class="external text" rel="nofollow">eMule</a>. According to <a href="https://www.portablefreeware.com/?q=emule" class="external text" rel="nofollow">Portable Freeware</a>, eMule is not completely portable since it writes some (useless) keys in the registry.

On the other hand, it is not clean either since it writes its configuration files and puts its downloads in its installation folder.

Luckily there is an <a href="https://sourceforge.net/projects/emule/files/eMule/0.49b/eMule0.49b.zip" class="external text" rel="nofollow">installer-less version available</a>.

So we make our [PKGBUILD](../zh-cn/PKGBUILD.html "PKGBUILD"); the only dependency is <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=wine" class="external text" rel="nofollow">wine</a></span><sup><span class="small">包</span></sup></span>. The `md5sums` should be added.

\# Maintainer: You \<youremail\>\
pkgname=emule\
pkgver=0.49b\
pkgrel=1\
pkgdesc="One of the biggest and most reliable peer-to-peer file sharing\
clients around the world."\
arch=('x86_64')\
url="https://www.emule-project.net"\
license=('GPL')\
depends=()\
depends=(wine)\
makedepends=(unzip)\
source=(emule https://sourceforge.net/projects/emule/files/eMule/\$pkgver/eMule\$pkgver.zip)\
noextract=()\
options=(!strip)\
\
build() {\
  rm -f src/eMule"\$pkgver"/license\* #It is GPL\
\
  install -d -m755 pkg/usr/share/emule\
  cp -ra src/eMule"\$pkgver"/\* pkg/usr/share/emule\
  find pkg/usr/share/emule -type d -exec chmod 755 "{}" \\\
  find pkg/usr/share/emule -type f -exec chmod 644 "{}" \\\
\
  install -d -m755 pkg/usr/bin\
  install -m755 emule pkg/usr/bin \
}\

Now we make our **emule** file, which according to `build`, will be copied and made executable in `/usr/bin`.

\#!/bin/bash\
export WINEARCH=win32 WINEPREFIX="\$HOME/.emule/wine"\
\
if \[ ! -d "\$HOME"/.emule \] ; then\
  mkdir -p "\$HOME"/.emule/wine \|\| exit 1\
  #Each user will have its config, we copy the default file since emule\
  #needs to write here.\
  cp -r /usr/share/emule/config "\$HOME"/.emule \|\| exit 1\
  #We symlink the files emule needs to read to work\
  ln -s /usr/share/emule/emule.exe "\$HOME"/.emule/emule \|\| exit 1\
  ln -s -T /usr/share/emule/lang "\$HOME"/.emule/lang \|\| exit 1\
  ln -s -T /usr/share/emule/webserver "\$HOME"/.emule/webserver \|\| exit 1\
fi\
\
wine "\$HOME"/.emule/emule "\$@"\

If you want to be more precise, you may add a message in the `.install` file telling the user that they should disable search history since wine messes up that menu. You may even provide a default configuration file with the best settings. And that's it... run `$ makepkg`, check the package folder to be sure, and install.

<div class="mw-heading mw-heading2">

## <span id="Gecko_.E5.92.8C_Mono"></span>Gecko 和 Mono

</div>

除非你确定软件需要 .NET 运行时的浏览器功能（<span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=wine-gecko" class="external text" rel="nofollow">wine-gecko</a></span><sup><span class="small">包</span></sup></span> 和 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=wine-mono" class="external text" rel="nofollow">wine-mono</a></span><sup><span class="small">包</span></sup></span> 软件包），否则 Wine 默认不应提示安装 Gecko/Mono。

要禁用 HTML 渲染、字节码支持和提示窗口，需要在脚本中使用 dlloverride。 对于 Gecko：

export WINEDLLOVERRIDES="mshtml="\

对于 Mono：

export WINEDLLOVERRIDES="mscoree="\

对于二者：

export WINEDLLOVERRIDES="mscoree,mshtml="\

还可以打开 `winecfg`，然后将 mscoree/mshtml 禁用。

</div>
