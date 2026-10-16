<div class="mw-content-ltr mw-parser-output" lang="zh-Hans-CN" dir="ltr">

<div class="aside archwiki-template-box archwiki-template-box-note noexcerpt">

**翻译状态：**

- 本文（或部分内容）译自 <a href="https://wiki.archlinux.org/title/CMake_package_guidelines" class="extiw" title="arch:CMake package guidelines">CMake package guidelines</a>，最近一次同步于 2026-02-20，若英文版本有所<a href="https://wiki.archlinux.org/title/CMake_package_guidelines?diff=0&amp;oldid=823701" class="external text" rel="nofollow">更改</a>，则您可以帮助同步与[翻译](../zh-cn/Help:%E7%BF%BB%E8%AF%91.html "Help:翻译")更改的内容。
- 您可以在 <a href="https://wiki.archlinux.org/title/CMake_package_guidelines_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)?action=history" class="external text" rel="nofollow">ArchWiki 的对应页面</a>找到本文翻译的**原始**修订历史。
- 本文可能与英文原文存在出入。

</div>

<div class="archwiki-template-box" style="display:block; text-align: center; margin-bottom: 1em;">

**[Arch 打包准则](../zh-cn/Arch_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Arch 打包准则")**

------------------------------------------------------------------------

<a href="../zh-cn/32_%E4%BD%8D%E8%BD%AF%E4%BB%B6%E5%8C%85%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html" class="mw-redirect" title="32位软件包打包准则">32 位</a> – [安全](../zh-cn/Arch_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99/%E5%AE%89%E5%85%A8.html "Arch 打包准则/安全") – [CLR](../zh-cn/CLR_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "CLR 软件打包准则") – <span class="mw-selflink selflink">CMake</span> – [DKMS](../zh-cn/DKMS_%E8%BD%AF%E4%BB%B6%E5%8C%85%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "DKMS 软件包打包准则") – [Eclipse](../zh-cn/Eclipse_%E6%8F%92%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Eclipse 插件打包准则") – [Electron](../zh-cn/Electron_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Electron 打包准则") – [Free Pascal](../zh-cn/Free_Pascal_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Free Pascal 打包准则") – <a href="/wzh/index.php?title=GNOME_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="GNOME package guidelines（页面不存在）">GNOME</a> – [Go](../zh-cn/Go_%E8%AF%AD%E8%A8%80%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Go 语言软件打包准则") – [Haskell](../zh-cn/Haskell_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Haskell 打包准则") – [Java](../zh-cn/Java_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Java 打包准则") – [交叉编译工具](../zh-cn/%E4%BA%A4%E5%8F%89%E7%BC%96%E8%AF%91%E5%B7%A5%E5%85%B7%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "交叉编译工具打包准则") – [KDE](../zh-cn/KDE_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "KDE 软件打包准则") – <a href="/wzh/index.php?title=Lisp_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Lisp package guidelines（页面不存在）">Lisp</a> – <a href="/wzh/index.php?title=Meson_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Meson package guidelines（页面不存在）">Meson</a> – <a href="/wzh/index.php?title=MinGW_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="MinGW package guidelines（页面不存在）">MinGW</a> – [内核模块](../zh-cn/%E5%86%85%E6%A0%B8%E6%A8%A1%E5%9D%97%E6%89%93%E5%8C%85%E6%8C%87%E5%8D%97.html "内核模块打包指南") – [Node.js](../zh-cn/Node.js_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Node.js 打包准则") – <a href="/wzh/index.php?title=Nonfree_applications_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Nonfree applications package guidelines（页面不存在）">Nonfree</a> – [OCaml](../zh-cn/OCaml_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "OCaml 打包准则") – <a href="/wzh/index.php?title=Perl_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Perl package guidelines（页面不存在）">Perl</a> – [PHP](../zh-cn/PHP_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "PHP 打包准则") – [Python](../zh-cn/Python_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Python 打包准则") – [R](../zh-cn/R_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "R 软件打包准则") – <a href="/wzh/index.php?title=Ruby_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Ruby package guidelines（页面不存在）">Ruby</a> – [Rust](../zh-cn/Rust_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Rust 软件打包准则") – <a href="/wzh/index.php?title=Shell_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Shell package guidelines（页面不存在）">Shell</a> – [VCS](../zh-cn/VCS_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "VCS 软件打包准则") – <a href="/wzh/index.php?title=Web_application_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Web application package guidelines（页面不存在）">Web</a> – <a href="../zh-cn/Wine_package_guidelines.html" class="mw-redirect" title="Wine package guidelines">Wine</a> – [字体](../zh-cn/%E5%AD%97%E4%BD%93%E6%89%93%E5%8C%85%E6%8C%87%E5%8D%97.html "字体打包指南")

</div>

本文描述了为使用 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=cmake" class="external text" rel="nofollow">cmake</a></span><sup><span class="small">包</span></sup></span> 的软件编写 [PKGBUILD](../zh-cn/PKGBUILD.html "PKGBUILD") 时需遵循的标准与指引。

摘自 <a href="https://cmake.org" class="external text" rel="nofollow">CMake 网站</a>：

CMake is an open-source, cross-platform family of tools designed to build, test and package software. CMake is used to control the software compilation process using simple platform and compiler independent configuration files, and generate native makefiles and workspaces that can be used in the compiler environment of your choice.

<div class="mw-heading mw-heading2">

## <span id=".E5.85.B8.E5.9E.8B.E7.94.A8.E6.B3.95"></span>典型用法

</div>

典型用法是运行 `cmake` 命令，然后执行构建命令。`cmake` 命令通常会设置一些参数，检查所需的依赖关系并创建构建文件，从而使该软件可以通过诸如 `make` 和 `ninja` 的其他工具进行构建。

<div class="mw-heading mw-heading2">

## <span id="CMake_.E7.9A.84.E4.B8.8D.E8.89.AF.E8.A1.8C.E4.B8.BA"></span>CMake 的不良行为

</div>

由于其内部的生成构建文件的特性，有时 CMake 可能会以不良方式运行。因此，在为基于 CMake 的软件编写 [PKGBUILD](../zh-cn/PKGBUILD.html "PKGBUILD") 时，应注意一些步骤。

<div class="mw-heading mw-heading3">

### <span id="CMake_.E5.8F.AF.E8.83.BD.E4.BC.9A.E8.87.AA.E5.8A.A8.E8.A6.86.E7.9B.96.E9.BB.98.E8.AE.A4.E7.9A.84.E7.BC.96.E8.AF.91.E5.99.A8.E4.BC.98.E5.8C.96.E6.A0.87.E5.BF.97"></span>CMake 可能会自动覆盖默认的编译器优化标志

</div>

使用 `-DCMAKE_BUILD_TYPE=Release` 选项运行 CMake 是很常见的。一些上游项目甚至无意中在其构建指令中包含此选项，但这会产生不希望的行为。

每个构建类型都会导致 CMake 自动将一组标志附加到 `CFLAGS` 和 `CXXFLAGS`。当使用通用 `Release` 构建类型时，它会自动附加 `-O3`<a href="https://github.com/Kitware/CMake/blob/v3.17.0/Modules/Compiler/GNU.cmake#L58" class="external autonumber" rel="nofollow">[1]</a> 编译器优化标志，这将覆盖当前为 `-O2`（在 [makepkg 配置文件](../zh-cn/Makepkg.html#%E9%85%8D%E7%BD%AE "Makepkg")中定义）的默认 Arch Linux 标志。这是不可取的，因为它偏离了 Arch Linux 的目标优化级别。

<div class="mw-heading mw-heading4">

#### <span id=".E5.85.B3.E4.BA.8E_-O3_.E7.9A.84.E6.B3.A8.E6.84.8F.E4.BA.8B.E9.A1.B9"></span>关于 -O3 的注意事项

</div>

使用 `-O3` 不能保证软件的性能会更好，有时甚至会减慢程序的速度。在某些情况下，它也会破坏软件。Arch Linux 开发者选择 `-O2` 作为目标优化级别是经斟酌后的结果，不应进行改动。除非你确切知道自己在做什么，或者如果上游明确告诉或暗示需要 `-O3`，否则应该避免在我们的软件包中使用它。

<div class="mw-heading mw-heading4">

#### <span id=".E4.BF.AE.E5.A4.8D.E8.87.AA.E5.8A.A8.E4.BC.98.E5.8C.96.E6.A0.87.E5.BF.97.E8.A6.86.E7.9B.96"></span>修复自动优化标志覆盖

</div>

由于 CMake 的灵活性，以 100% 完全解决这个问题并不简单。请注意，不存在可适用于所有情况的标准解决方案。本节将讨论可能的解决方案和应遵守的一些要点。

默认的 CMake 构建类型是 `None`，默认情况下它不会向 `CFLAGS` 和 `CXXFLAGS` 附加任何标志，因此只要省略 `CMAKE_BUILD_TYPE` 就默认使用 `None` 类型。但请注意，忽略此选项并不能保证解决问题，因为如果命令行中未设置 `CMAKE_BUILD_TYPE`，许多软件项目会自动将 CMake 文件中的生成类型设置为 `Release` 或其他类型。另外请注意，由于 `None` 构建类型中缺少 `NDEBUG` 定义，软件包结果中可能会有对源文件的引用，并导致 [makepkg](../zh-cn/Makepkg.html "Makepkg") 输出 `WARNING: Package contains reference to $srcdir` 警告。

由于默认的 `None` 构建类型在默认情况下不会向 `CFLAGS` 和 `CXXFLAGS` 追加任何标志，因此也可以使用 `-DCMAKE_BUILD_TYPE=None` 选项。一般来说，使用 `-DCMAKE_BUILD_TYPE=None` 选项比省略 `CMAKE_BUILD_TYPE` 要好，它默认不会附加任何标志，也很少有软件会为 `None` 构建类型设置不需要的标志。

不幸的是，该问题不是简单使用 `-DCMAKE_BUILD_TYPE=None` 就能解决的。当使用 `None` 构建类型修复 `-O3` 问题时，可能会遇到另一个问题。很多软件项目会在 CMake 文件中为 `Release` 构建类型定义一些必需的编译器标志（例如 `CMAKE_C_FLAGS_RELEASE` 和 `CMAKE_CXX_FLAGS_RELEASE` CMake 变量）。如果使用 `None` 构建类型，在没有这些上游定义标志的情况下编译时，此类软件可能会损坏或出现错误行为。为了确定是否缺少某些标志，需要检查 CMake 文件，或者可以比较 `make VERBOSE=1` 对于 `None` `Release` 构建类型的输出。如果 `None` 构建类型导致某些上游定义的标志丢失，该怎么办？这时存在两种情况：如果你使用了 `Release` 构建类型，那么就可能会使用到不需要的 `-O3` 标志；如果使用 `None` 构建类型，那就会丢失必需的上游定义标志。该问题不存在标准解决方法，需要逐案分析。如果上游为 `Release` 构建类型定义了 `-O2`，则可以使用 `-DCMAKE_BUILD_TYPE=Release` （参见下文）。否则，可以尝试修补 CMake 文件。

一些软件项目在其 CMake 文件中为 `Release` 构建类型硬编码了 `-O2`，因此，如果您确定 `-O2` 是正在使用的优化级别，那么在这种情况下可以安全地设置 `-DCMAKE_BUILD_TYPE=Release`。

<div class="archwiki-template-box archwiki-template-box-warning">

**警告：**

- 使用 `None` 类型时，某些软件可能会崩溃。当使用 `None` 时请测试软件，检查软件是否损坏或缺少功能。
- 某些软件可能只适用于 `Release` 构建类型。你需要实验和测试软件。

</div>

<div class="mw-heading mw-heading3">

### <span id=".E9.AA.8C.E8.AF.81.E4.BF.AE.E5.A4.8D"></span>验证修复

</div>

通过启用生成工具的详细模式，可以验证 CMake 是否正确应用了修复。例如，当使用 `make`（这是 CMake 的默认值）时，可以通过将 `VERBOSE=1` 添加到 `make` 中（比如 `make VERBOSE=1`）来完成。这将使 `make` 能够输出正在执行的编译器命令。然后，您可以运行 [makepkg](../zh-cn/Makepkg.html "Makepkg") 并检查输出，看看编译器是否使用了 `-D_FORTIFY_SOURCE=2` 和 `-O2` 标志。如果在每个命令行中显示多个优化标志，则该行中的最后一个标志将是编译器使用的标志（这意味着 `-O2` 需要是最后一个优化标志才能生效）。

<div class="mw-heading mw-heading2">

## <span id=".E5.89.8D.E7.BC.80.E5.92.8C.E5.BA.93.E5.AE.89.E8.A3.85.E7.9B.AE.E5.BD.95"></span>前缀和库安装目录

</div>

标准 Arch Linux `/usr` 前缀可以由 `-DCMAKE_INSTALL_PREFIX=/usr` CMake 选项指定。通常需要这样做，因为许多软件默认将文件安装到 `/usr/local` 前缀中。

一些上游项目将 CMake 文件设置为将库安装到 `/usr/lib64` 目录中。如果是这种情况，可以使用 `-DCMAKE_INSTALL_LIBDIR=lib` CMake 选项将库安装目录正确设置为 `/usr/lib`。

<div class="mw-heading mw-heading2">

## <span id=".E6.8F.90.E7.A4.BA.E5.92.8C.E6.8A.80.E5.B7.A7"></span>提示和技巧

</div>

<div class="mw-heading mw-heading3">

### <span id=".E6.8C.87.E5.AE.9A.E7.9B.AE.E5.BD.95"></span>指定目录

</div>

自从 CMake 3.13 版本开始，可以使用 `-B` 来自动创建构建目录。这样可以避免使用单独的 `mkdir` 或 `install` 命令创建生成目录。`-S` 选项指定源目录（即搜索 `CMakeLists.txt` 文件的位置），并避免在执行 `cmake` 之前使用 `cd` 进入源码树。将这两个选项结合在一起，可以快捷指定生成目录和源目录。

构建 CMake 项目一般需要使用很多选项，可以把它们放到构建函数的本地数组中进行指定。这可以避免使用反斜杠将长命令切割为多行，还可以为各选项单独进行注释：

PKGBUILD

build() {\
  local cmake_options=(\
    -B build\
    -S \$pkgname-\$pkgver\
    # Any other options required to build a project may follow\
    *\[other_cmake_options\]*\
  )\
  cmake "\${cmake_options\[@\]}"\
  cmake --build build\
}

<div class="mw-heading mw-heading3">

### <span id=".E5.87.8F.E5.B0.91.E5.8F.AF.E8.83.BD.E4.B8.8D.E9.9C.80.E8.A6.81.E7.9A.84.E8.BE.93.E5.87.BA"></span>减少可能不需要的输出

</div>

`-Wno-dev` 选项将抑制某些警告的输出，这些警告仅适用于编写 `CMakeLists.txt` 文件的上游项目开发人员。删除这些警告将使 CMake 输出更流畅，并减少检查它的负担。一般来说，打包者通常可以被安全地忽略这些警告。

<div class="mw-heading mw-heading3">

### <span id=".E4.BB.8E.E4.BA.8C.E8.BF.9B.E5.88.B6.E6.96.87.E4.BB.B6.E4.B8.AD.E5.88.A0.E9.99.A4.E4.B8.8D.E5.AE.89.E5.85.A8.E7.9A.84_RPATH_.E5.BC.95.E7.94.A8"></span>从二进制文件中删除不安全的 RPATH 引用

</div>

有时生成的二进制文件可能在 `RPATH` 中包含不安全的引用。这可以通过在构建的包上运行 [Namcap](../zh-cn/Namcap.html "Namcap") 来验证，并且这是一个需要修复的安全问题。使用 `CMAKE_SKIP_INSTALL_RPATH=YES` **或** `CMAKE_SKIP_RPATH=YES` CMake 选项很有可能解决此问题。你需要尝试这两个选项，并查看哪一个选项在对应软件中可用（不需要同时使用）。

<div class="mw-heading mw-heading3">

### <span id=".E8.8E.B7.E5.8F.96.E6.89.80.E6.9C.89.E5.8F.AF.E7.94.A8.E7.9A.84_CMake_.E9.80.89.E9.A1.B9"></span>获取所有可用的 CMake 选项

</div>

要获取软件项目可用的所有“可见” CMake 选项，请在源码树（主 `CMakeLists.txt` 文件所在位置）中执行 `cmake -LAH`。

如果要保存输出以供以后参考，可以将其重定向到文件：

\$ cmake -LAH \>options.txt 2\>&1\

<div class="mw-heading mw-heading3">

### <span id=".E9.81.BF.E5.85.8D.E5.9C.A8.E6.9E.84.E5.BB.BA.E6.97.B6.E4.BD.BF.E7.94.A8_FetchContent_.E8.BF.9B.E8.A1.8C.E4.B8.8B.E8.BD.BD"></span>避免在构建时使用 FetchContent 进行下载

</div>

CMake 提供了 <a href="https://cmake.org/cmake/help/latest/module/FetchContent.html" class="external text" rel="nofollow">FetchContent</a> 模块，可以在构建时下载额外的资源和子项目。但在理想情况下，所有资源都应在 `sources` 数组中指定，并由 [makepkg](../zh-cn/Makepkg.html "Makepkg") 在构建之前获取。可以通过 <a href="https://cmake.org/cmake/help/latest/module/FetchContent.html#variable:FETCHCONTENT_SOURCE_DIR_%3CuppercaseName%3E" class="external text" rel="nofollow">FETCHCONTENT_SOURCE_DIR_&lt;uppercaseName&gt;</a> 选项指定需获取的文件的路径，另外还可以使用 <a href="https://cmake.org/cmake/help/latest/module/FetchContent.html#variable:FETCHCONTENT_FULLY_DISCONNECTED" class="external text" rel="nofollow">FETCHCONTENT_FULLY_DISCONNECTED=ON</a> 跳过所有构建时的下载，无视任何 `FetchContent` 定义。

<div class="mw-heading mw-heading4">

#### <span id=".E7.A4.BA.E4.BE.8B"></span>示例

</div>

假设项目需要获取的资源名为 `foo`：

CMakeLists.txt

FetchContent_Declare(\
    foo\
    URL https://example.com/foo.tar.gz\
    URL_HASH SHA256=cf051bf611a94884ba5e4c2d03932d14e83875c5b77f0fdf55c404cad0e4a6e6\
)\
FetchContent_MakeAvailable(foo)\

可以将该资源添加到 `sources` 数组并在生成构建文件时进行声明，而不是在构建时下载：

PKGBUILD

sources=(\
    ...\
    "https://example.com/foo.tar.gz"\
)\
\
sha256sums=(\
    ...\
    "cf051bf611a94884ba5e4c2d03932d14e83875c5b77f0fdf55c404cad0e4a6e6"\
)\

\$ cmake -B build -S "\$pkgname-\$pkgver" -DFETCHCONTENT_FULLY_DISCONNECTED=ON -DFETCHCONTENT_SOURCE_DIR_FOO="\$srcdir/foo"\

<div class="mw-heading mw-heading2">

## <span id=".E6.A8.A1.E6.9D.BF"></span>模板

</div>

下面是 `build()` 函数的通用模板，它是基于 CMake 的包的起点。假设软件基于 C 和 C++，且在 CMake 文件中没有为 `Release` 构建类型定义必需编译器标志：

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**check 函数只在 `CMakeLists.txt` 中使用了 `enable_testing()` 和/或 `add_test()` 功能时可用。

</div>

PKGBUILD

build() {\
  local cmake_options=(\
    -B build\
    -S \$pkgname-\$pkgver\
    -W no-dev\
    -D CMAKE_BUILD_TYPE=None\
    -D CMAKE_INSTALL_PREFIX=/usr\
  )\
  cmake "\${cmake_options\[@\]}"\
  cmake --build build\
}\
\
check() {\
  local excluded_tests=""\
  local ctest_flags=(\
    --test-dir build\
    # show the stdout and stderr when the test fails\
    --output-on-failure\
    # execute tests in parallel\
    --parallel \$(nproc)\
    # exclude problematic tests\
    --exclude-regex "\$excluded_tests"\
  )\
  ctest "\${ctest_flags\[@\]}"\
}\
\
package() {\
  DESTDIR="\$pkgdir" cmake --install build\
}

不要忘记将 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=cmake" class="external text" rel="nofollow">cmake</a></span><sup><span class="small">包</span></sup></span> 添加到 <a href="../zh-cn/PKGBUILD.html#makedepends" class="mw-redirect" title="Makedepends">makedepends</a>。

<div class="mw-heading mw-heading2">

## <span id=".E8.8C.83.E4.BE.8B.E5.8C.85"></span>范例包

</div>

- <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=i2pd" class="external text" rel="nofollow">i2pd</a></span><sup><span class="small">包</span></sup></span>
- <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=libmysofa" class="external text" rel="nofollow">libmysofa</a></span><sup><span class="small">包</span></sup></span>

<div class="mw-heading mw-heading2">

## <span id=".E5.8F.A6.E8.AF.B7.E5.8F.82.E8.A7.81"></span>另请参见

</div>

- <a href="https://cmake.org/documentation/" class="external text" rel="nofollow">CMake 文档</a>
- <a href="https://cmake.org/cmake/help/latest/" class="external text" rel="nofollow">最新版本的文档参考</a>
- <a href="https://zh.wikipedia.org/wiki/CMake" class="extiw" title="zhwp:CMake">维基百科文章</a>
- <span class="plainlinks archwiki-template-man" title="$ man 1 cmake"><a href="https://man.archlinux.org/man/cmake.1" class="external text" rel="nofollow">cmake(1)</a></span>

</div>
