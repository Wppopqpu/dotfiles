<div class="mw-content-ltr mw-parser-output" lang="zh-Hans-CN" dir="ltr">

<div class="aside archwiki-template-box archwiki-template-box-note noexcerpt">

**翻译状态：**

- 本文（或部分内容）译自 <a href="https://wiki.archlinux.org/title/Java_package_guidelines" class="extiw" title="arch:Java package guidelines">Java package guidelines</a>，最近一次同步于 2024-07-08，若英文版本有所<a href="https://wiki.archlinux.org/title/Java_package_guidelines?diff=0&amp;oldid=812127" class="external text" rel="nofollow">更改</a>，则您可以帮助同步与[翻译](../zh-cn/Help:%E7%BF%BB%E8%AF%91.html "Help:翻译")更改的内容。
- 您可以在 <a href="https://wiki.archlinux.org/title/Java_package_guidelines_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)?action=history" class="external text" rel="nofollow">ArchWiki 的对应页面</a>找到本文翻译的**原始**修订历史。
- 本文可能与英文原文存在出入。

</div>

<div class="archwiki-template-box" style="display:block; text-align: center; margin-bottom: 1em;">

**[Arch 打包准则](../zh-cn/Arch_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Arch 打包准则")**

------------------------------------------------------------------------

<a href="../zh-cn/32_%E4%BD%8D%E8%BD%AF%E4%BB%B6%E5%8C%85%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html" class="mw-redirect" title="32位软件包打包准则">32 位</a> – [安全](../zh-cn/Arch_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99/%E5%AE%89%E5%85%A8.html "Arch 打包准则/安全") – [CLR](../zh-cn/CLR_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "CLR 软件打包准则") – [CMake](../zh-cn/CMake_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "CMake 软件打包准则") – [DKMS](../zh-cn/DKMS_%E8%BD%AF%E4%BB%B6%E5%8C%85%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "DKMS 软件包打包准则") – [Eclipse](../zh-cn/Eclipse_%E6%8F%92%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Eclipse 插件打包准则") – [Electron](../zh-cn/Electron_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Electron 打包准则") – [Free Pascal](../zh-cn/Free_Pascal_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Free Pascal 打包准则") – <a href="/wzh/index.php?title=GNOME_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="GNOME package guidelines（页面不存在）">GNOME</a> – [Go](../zh-cn/Go_%E8%AF%AD%E8%A8%80%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Go 语言软件打包准则") – [Haskell](../zh-cn/Haskell_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Haskell 打包准则") – <span class="mw-selflink selflink">Java</span> – [交叉编译工具](../zh-cn/%E4%BA%A4%E5%8F%89%E7%BC%96%E8%AF%91%E5%B7%A5%E5%85%B7%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "交叉编译工具打包准则") – [KDE](../zh-cn/KDE_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "KDE 软件打包准则") – <a href="/wzh/index.php?title=Lisp_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Lisp package guidelines（页面不存在）">Lisp</a> – <a href="/wzh/index.php?title=Meson_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Meson package guidelines（页面不存在）">Meson</a> – <a href="/wzh/index.php?title=MinGW_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="MinGW package guidelines（页面不存在）">MinGW</a> – [内核模块](../zh-cn/%E5%86%85%E6%A0%B8%E6%A8%A1%E5%9D%97%E6%89%93%E5%8C%85%E6%8C%87%E5%8D%97.html "内核模块打包指南") – [Node.js](../zh-cn/Node.js_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Node.js 打包准则") – <a href="/wzh/index.php?title=Nonfree_applications_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Nonfree applications package guidelines（页面不存在）">Nonfree</a> – [OCaml](../zh-cn/OCaml_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "OCaml 打包准则") – <a href="/wzh/index.php?title=Perl_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Perl package guidelines（页面不存在）">Perl</a> – [PHP](../zh-cn/PHP_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "PHP 打包准则") – [Python](../zh-cn/Python_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Python 打包准则") – [R](../zh-cn/R_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "R 软件打包准则") – <a href="/wzh/index.php?title=Ruby_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Ruby package guidelines（页面不存在）">Ruby</a> – [Rust](../zh-cn/Rust_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Rust 软件打包准则") – <a href="/wzh/index.php?title=Shell_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Shell package guidelines（页面不存在）">Shell</a> – [VCS](../zh-cn/VCS_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "VCS 软件打包准则") – <a href="/wzh/index.php?title=Web_application_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Web application package guidelines（页面不存在）">Web</a> – <a href="../zh-cn/Wine_package_guidelines.html" class="mw-redirect" title="Wine package guidelines">Wine</a> – [字体](../zh-cn/%E5%AD%97%E4%BD%93%E6%89%93%E5%8C%85%E6%8C%87%E5%8D%97.html "字体打包指南")

</div>

<div class="noprint archwiki-template-message">

<span class="mw-default-size" typeof="mw:File"><a href="../File:Tango-preferences-desktop-locale-modified.png" class="mw-file-description"><img src="../File:Tango-preferences-desktop-locale-modified.png" class="mw-file-element" decoding="async" width="48" height="48" /></a></span>**这篇文章或章节的<a href="../Project:%E8%B4%A1%E7%8C%AE.html#Translating" class="mw-redirect" title="Project:Contributing">翻译</a>质量不佳。**

<div>

**原因：**可能大量使用了机器翻译，有部分翻译不准确或错误，需要重新校对或翻译（在 <a href="../zh-cn/Talk:Java_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html" class="external text" rel="nofollow">Talk:Java 打包准则#</a> 中讨论）

</div>

</div>

本文档定义了 Arch Linux 下打包 [Java](../zh-cn/Java.html "Java") 程序的建议标准。Java 程序是出了名的难以在没有重叠的依赖关系的情况下干净利落地打包。本文档描述了一种处理这种情况的方法。这些指南十分灵活，以涵盖处理 Java 程序时遇到的许多不同情况。

<div class="mw-heading mw-heading2">

## <span id=".E4.BB.8B.E7.BB.8D"></span>介绍

</div>

Arch Linux 的打包人员似乎无法就如何处理 Java 包达成一致。官方和非官方软件库以及 <a href="../zh-cn/Arch_%E7%94%A8%E6%88%B7%E8%BD%AF%E4%BB%B6%E4%BB%93%E5%BA%93.html" class="mw-redirect" title="AUR">AUR</a> 的 [PKGBUILD](../zh-cn/PKGBUILD.html "PKGBUILD") 中使用了各种方法。这包括把所有东西扔到 `/opt` 里，把 Shell 脚本放在 `/usr/bin` 或把配置文件放在 `/etc/profile` 中。其他的则是放在 `/usr/share` 目录中，脚本放在 `/usr/bin` 中。许多做法在系统 `CLASSPATH` 和 `PATH` 中添加了不必要的文件。

<div class="mw-heading mw-heading2">

## <span id=".E5.85.B8.E5.9E.8B_Java_.E5.BA.94.E7.94.A8.E7.A8.8B.E5.BA.8F.E7.9A.84.E7.BB.93.E6.9E.84"></span>典型 Java 应用程序的结构

</div>

大多数桌面 Java 应用程序结构类似。它们是由一个不依赖系统（但依赖软件包！）的安装程序安装的。这通常会把所有东西都安装在包含 `bin`、`lib`、`jar`、`conf`等子目录的目录下。一般会有一个包含主要可执行类的主 jar 文件。通常还会提供一个 Shell 脚本来运行主类，这样用户就不必直接调用 Java 解释器。这个 Shell 脚本通常相当复杂，因为它需要在不同的发行版中通用，而且经常包括不同系统的特殊情况（例如 Cygwin）。

`lib` 目录通常包含捆绑的 jar 文件来满足 Java 程序的依赖。这使用户安装程序变得简单（其中包含了所有依赖），但却是软件包开发者的噩梦。几个软件包捆绑相同的依赖会浪费空间。这在过去并不是一个大问题，当时桌面 Java 应用程序和库较少，而那些存在的应用程序和库本身往往也非常大。但现在情况不同了……

运行程序所需的其他文件通常与主 jar 文件存放在同一目录或其子目录下。由于 Java 程序不知道它们的类是从哪里加载的，所以通常需要在这个目录中运行（即 Shell 脚本应 `cd` 进入该目录），或者设置一个环境变量来指示这个目录的位置。

<div class="mw-heading mw-heading2">

## <span id=".E5.9C.A8_Arch_Linux_.E4.B8.AD.E6.89.93_Java_.E5.8C.85"></span>在 Arch Linux 中打 Java 包

</div>

在 Arch 中打包 Java 应用程序将会比现在更费劲。然而，这是值得的，它可以使文件系统更干净，捆绑的依赖更少（随着越来越多的Java 库被重构为单独的包，打包会变得更容易）。在创建 Arch Linux Java 包时，应遵循以下准则：

- 如果 Java 库有一个通用的名字，那么包的名字应该在前面加上 `java-` 以与其他库区分。对于命名独特的包（如 JUnit）、终端用户程序（如 Eclipse）或可以用其他前缀唯一描述的库（如 jakarta-commons-collections 或 apache-ant），则不需要这样做。

<!-- -->

- 将所有随程序分发的 jar 文件（而不是其他文件）放在 `/usr/share/java/`*`程序`*目录下。这包括随程序分发的所有依赖 jar 文件。然而，应该努力将常见的或大型的依赖放到单独的包中。这只有在程序不依赖某个特定版本的库时才能实现。

这个规则使得迭代重构依赖关系成为可能。也就是说，软件包和它的所有依赖可以先放在一个目录中。经过测试后，主要的依赖可以一个一个地被重构出来。请注意，有些应用程序在主 jar 文件中包括捆绑的依赖。也就是说，他们将捆绑的依赖解包，并将其包含在主 jar 中。这样的依赖通常非常小，重构它们没有什么意义。

- 如果程序是要由用户运行的，编写一个自定义的 Shell 脚本运行主 jar 文件。这个脚本应该放在 `/usr/bin` 中。库一般不需要 Shell 脚本。从头开始编写 Shell 脚本，不要使用程序捆绑的脚本。删除检查自定义环境（如 Cygwin）的代码，以及试图确定 `JAVA_HOME` 是否已经设置的代码（Arch [不使用](../zh-cn/Java.html#%E5%AE%89%E8%A3%85 "Java") `JAVA_HOME`，而是使用 `archlinux-java` 来设置 `/usr/bin/java` 符号连接）。

寻找 jar 文件的脚本应该类似这样：

\#!/bin/sh\
exec /usr/bin/java -jar '/usr/share/java/*程序*/*程序*.jar' "\$@"

寻找单个类文件的应该类似这样：

\#!/bin/sh\
exec /usr/bin/java '/usr/share/java/*程序*/*程序类名'* "\$@"

- 使用 `-cp` 选项为 Java 解释器设置 `CLASSPATH`，除非有明确的理由不这样做（即：`CLASSPATH` 用于插件机制）。`CLASSPATH` 应该包括 `/usr/share/java/`*`程序`*目录下的所有 jar 文件，以及已被重构到其他目录中的依赖库的 jar 文件。可以使用类似以下代码：

for name in /usr/share/java/*程序*/\*.jar ; do\
  CP=\$CP:\$name\
done\
CP=\$CP:/usr/share/java/dep1/dep1.jar\
java -cp \$CP *程序*.java.MainClass

- 确保 Shell 脚本可执行！

<!-- -->

- 随软件包一起分发的其他文件应存放在 `/usr/share` 下以该软件包命名的目录中。你可能需要在 Shell 脚本中的 `项目_HOME` 等变量中设置该目录的位置。本准则假设程序希望所有文件都在同一目录下（这是 Java 软件包的标准做法）。如果配置文件更适合放在其他地方（例如，把日志放在 `/var/log` 中），则可以这样做。

请记住，在某些系统上 `/usr` 可能被挂载为只读。如果应用程序需要写入共享目录中的文件，它们可能需要被重新定位到`/etc`、`/var` 或用户的主目录。

- 与其他 Arch Linux 软件包的标准一样，如果遵守上述标准需要做大量的工作，则应以其偏好的方式安装软件包，并将生成的目录放在 `/opt` 中。这对于捆绑 JRE、包含自定义版本的依赖或做其他奇怪和痛苦的事情的程序很有用。

<div class="mw-heading mw-heading3">

### <span id=".E5.A4.9A.E4.B8.AAAPI.E5.AE.9E.E7.8E.B0"></span>多个API实现

</div>

如果软件包分发了常用的 API 实现（比如 jdbc 驱动），则应该把库放在 `/usr/share/java/`*`API_名称`* 下。这样，允许用户选择实现的应用程序会知道在哪里寻找它们。这个位置只用于库包本身。如果这样的实现是应用程序分发的一部分，**不要**将这个 jar 文件放在公共位置，而是使用普通的包结构。

<div class="mw-heading mw-heading3">

### <span id=".E7.9B.AE.E5.BD.95.E7.BB.93.E6.9E.84.E7.A4.BA.E4.BE.8B"></span>目录结构示例

</div>

为了说明问题，下面是一个假想的名为 `foo` 程序的目录结构示例。由于 `foo` 是一个常见的名字，所以软件包被命名为 `java-foo`，但注意目录结构中并没有体现：

- `/usr/share/java/foo/`
- `/usr/share/java/foo/foo.jar`
- `/usr/share/java/foo/bar.jar`（`java-foo` 包含的依赖）
- `/usr/share/foo/`
- `/usr/share/foo/*.*`（`java-foo` 需要的一些文件）
- `/usr/bin/foo`（可执行的 Shell 脚本）

<div class="mw-heading mw-heading3">

### <span id=".E4.BE.9D.E8.B5.96"></span>依赖

</div>

Java packages might specify `java-runtime` or `java-environment` as dependency, based on what they need. For most packages, `java-runtime` (*Java Runtime Environment*) is what is needed to simply run software written in *Java*. `java-environment` (*Java Development Toolkit*) is needed by packages that will need to compile *Java* source code into bytecode.

更多信息参见 [Java](../zh-cn/Java.html "Java")。

</div>
