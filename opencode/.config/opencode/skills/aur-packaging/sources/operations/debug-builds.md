<div class="mw-content-ltr mw-parser-output" lang="zh-Hans-CN" dir="ltr">

<div class="aside archwiki-template-box archwiki-template-box-note noexcerpt">

**翻译状态：**

- 本文（或部分内容）译自 <a href="https://wiki.archlinux.org/title/Debugging/Getting_traces" class="extiw" title="arch:Debugging/Getting traces">Debugging/Getting traces</a>，最近一次同步于 2025-01-28，若英文版本有所<a href="https://wiki.archlinux.org/title/Debugging/Getting_traces?diff=0&amp;oldid=758446" class="external text" rel="nofollow">更改</a>，则您可以帮助同步与[翻译](../../zh-cn/Help:%E7%BF%BB%E8%AF%91.html "Help:翻译")更改的内容。
- 您可以在 <a href="https://wiki.archlinux.org/title/Debugging_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)/Getting_traces_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)?action=history" class="external text" rel="nofollow">ArchWiki 的对应页面</a>找到本文翻译的**原始**修订历史。
- 本文可能与英文原文存在出入。

</div>

<div class="archwiki-template-meta-related-articles-start">

相关文章

- <a href="../../zh-cn/General_troubleshooting.html" class="mw-redirect" title="General troubleshooting">General troubleshooting</a>
- <a href="../../zh-cn/Reporting_bug_guidelines.html" class="mw-redirect" title="Reporting bug guidelines">Reporting bug guidelines</a>
- [Debuginfod](../../zh-cn/Debuginfod.html "Debuginfod")
- [核心转储](../../zh-cn/%E6%A0%B8%E5%BF%83%E8%BD%AC%E5%82%A8.html "核心转储")

</div>

通常，为了让人们方便调试，会让可执行文件尽可能小。在没有调试信息的情况下获取跟踪信息，会大大降低其实用性。例如，在没有调试信息的情况下，<span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=gdb" class="external text" rel="nofollow">gdb</a></span><sup><span class="small">包</span></sup></span> 会话的跟踪信息可能如下所示：

\[...\]\
Backtrace was generated from '/usr/bin/epiphany'\
\
**(no debugging symbols found)**\
Using host libthread_db library "**/lib/libthread_db.so.1**".\
**(no debugging symbols found)**\
\[Thread debugging using libthread_db enabled\]\
\[New Thread -1241265952 (LWP 12630)\]\
(no debugging symbols found)\
0xb7f25410 in \_\_kernel_vsyscall ()\
\#0  0xb7f25410 in \_\_kernel_vsyscall ()\
\#1  0xb741b45b in **??** () from /lib/libpthread.so.0\
\[...\]\

`??` 会显示调试信息缺失的位置，以及调用该函数的库或可执行文件的名称。同样，当出现 `(no debugging symbols found)` 时，应查找所述文件名。

要获得对程序开发人员有用的正确跟踪，请遵循以下章节。大多数 Arch 官方软件包都有单独的调试文件，可以通过 [Debuginfod](../../zh-cn/Debuginfod.html "Debuginfod") 下载（参见 [\#获取跟踪](#%E8%8E%B7%E5%8F%96%E8%B7%9F%E8%B8%AA)）。 如果没有在可执行文件中添加enhanced debugging information，则必须启用调试符号[重建软件包](#%E9%87%8D%E5%BB%BA%E8%BD%AF%E4%BB%B6%E5%8C%85)。

使用完整的堆栈跟踪来告知开发人员您之前发现的错误。

<div class="mw-heading mw-heading2">

## <span id=".E8.8E.B7.E5.8F.96.E8.BF.BD.E8.B8.AA.E6.96.87.E4.BB.B6"></span>获取追踪文件

</div>

实际的回溯（或堆栈跟踪）可以通过 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=gdb" class="external text" rel="nofollow">gdb</a></span><sup><span class="small">包</span></sup></span> （GNU 调试器）获取。根据是否应启动程序的新实例、是否应附加到现有进程、或是否应检查之前的崩溃，可以以多种方式使用调试器。

<div class="mw-heading mw-heading3">

### <span id=".E5.90.AF.E5.8A.A8.E7.A8.8B.E5.BA.8F.E7.9A.84.E6.96.B0.E5.AE.9E.E4.BE.8B"></span>启动程序的新实例

</div>

Start *gdb* with an executable program that can be found in `$PATH` (or a full path):

\$ gdb *application*\

*gdb* automatically tries to download debug information and symbols for packages in the <a href="../../zh-cn/Official_repositories.html" class="mw-redirect" title="Official repositories">official repositories</a>. When *gdb* asks whether [Debuginfod](../../zh-cn/Debuginfod.html "Debuginfod") should be enabled in the debugging session, answer `y`:

This GDB supports auto-downloading debuginfo from the following URLs:\
  \<<a href="https://debuginfod.archlinux.org" class="external free" rel="nofollow">https://debuginfod.archlinux.org</a>\>\
Enable debuginfod for this session? (y or \[n\]) y\
Debuginfod has been enabled.\
To make this setting permanent, add 'set debuginfod enabled on' to .gdbinit.\
Downloading separate debug info for /usr/bin/*application*\
Reading symbols from /home/user/.cache/debuginfod_client/fbaee841e2ed2c11ecbbda26f39eeec1da23d6c3/debuginfo...

Then, within *gdb*, type `run` followed by any arguments you wish the program to start with:

(gdb) run *arguments*\

<div class="archwiki-template-box archwiki-template-box-tip">

**提示：**Alternatively, you can pass arguments when starting *gdb* using `gdb --args `*`application arguments...`* and then use only `run` without arguments within *gdb*. For example, to debug an application written in Python, run `gdb --args /usr/bin/python `*`/path/to/application`*.

</div>

Now do whatever is necessary to evoke the bug. *gdb* will automatically halt the application when it crashes and prompt for commands. In case of freezes or similar issues, press `Ctrl+c` and you will be returned to the command prompt, too.

Then enable logging to a file:

(gdb) set logging enabled on\

<div class="archwiki-template-box archwiki-template-box-tip">

**提示：**The default file name is `gdb.txt`. An alternate file name can be specified with `set logging file `*`trace.log`* within *gdb*.

</div>

And finally have the backtrace written to the specified file in the current working directory:

(gdb) thread apply all backtrace full\

<div class="mw-heading mw-heading3">

### Attaching to an existing process

</div>

If the program you want to debug is already running, you need to first find its process ID. Tools such as <span class="plainlinks archwiki-template-man" title="$ man 1 pidof"><a href="https://man.archlinux.org/man/pidof.1" class="external text" rel="nofollow">pidof(1)</a></span> or <span class="plainlinks archwiki-template-man" title="$ man 1 pgrep"><a href="https://man.archlinux.org/man/pgrep.1" class="external text" rel="nofollow">pgrep(1)</a></span> are available. For example:

\$ pidof python3

907171 491909\

When the output does not give a unique ID, you can try more filtering or look at the output of `ps aux` or `pstree --show-pids`.

Attaching as regular user does not work by default due to restricted <a href="../../zh-cn/%E5%AE%89%E5%85%A8.html#ptrace_scope" class="mw-redirect" title="Security">ptrace scope</a>. The restriction can be lowered temporarily with `echo 0 > /proc/sys/kernel/yama/ptrace_scope` or you can run *gdb* as a privileged user, e.g. using [sudo](../../zh-cn/Sudo.html "Sudo").

Start *gdb* attaching it to the process:

\$ gdb --pid=*PID*\

*gdb* will ask if [Debuginfod](../../zh-cn/Debuginfod.html "Debuginfod") should be enabled in this debugging session, to which you should answer `y`.

Note that attaching to a process has stopped it and it needs to be explicitly continued. This replaces the `run` command from the workflow in the [\#Starting a new instance of a program](#Starting_a_new_instance_of_a_program) section:

(gdb) continue\

Now do whatever is necessary to evoke the bug in the attached process. Then proceed with enabling logging and obtaining the trace same as in [\#Starting a new instance of a program](#Starting_a_new_instance_of_a_program).

<div class="mw-heading mw-heading3">

### Examining a previous crash

</div>

To debug an application that has already crashed, you will want to invoke *gdb* on its *core dump*. See <a href="/wzh/index.php?title=Core_dump&amp;action=edit&amp;redlink=1" class="new" title="Core dump（页面不存在）">Core dump#Analyzing a core dump</a> for details.

If debugging information for the crashed program is not available and a proper backtrace was not obtained, you may need to [rebuild the package](#Rebuilding_packages) and reproduce the crash again.

<div class="mw-heading mw-heading2">

## Manually getting debug info

</div>

<div class="noprint archwiki-template-message">

<span class="mw-default-size" typeof="mw:File"><a href="../../File:Tango-view-refresh-red.png" class="mw-file-description"><img src="../../File:Tango-view-refresh-red.png" class="mw-file-element" decoding="async" width="48" height="48" /></a></span>**本文或本节内容已经过时。**

<div>

**原因：** In the [Debuginfod](../../zh-cn/Debuginfod.html "Debuginfod") era, installing separate debug packages with pacman is not needed for official packages. (在<a href="../../zh-cn/Talk:%E8%B0%83%E8%AF%95/%E8%8E%B7%E5%8F%96%E8%B7%9F%E8%B8%AA%E4%BF%A1%E6%81%AF.html" class="external text" rel="nofollow">Talk:调试/获取跟踪信息</a>讨论)

</div>

</div>

The first thing to do is to obtain the names of the packages which [require rebuilding](#Rebuilding_packages) or the [install of a debug package](#Installing_debug_packages).

\[...\]\
Backtrace was generated from '/usr/bin/epiphany'\
\
**(no debugging symbols found)**\
Using host libthread_db library "**/lib/libthread_db.so.1**".\
**(no debugging symbols found)**\
\[...\]\

For example for the above extract from a trace, the package name for the associated package can be obtained with [pacman](../../zh-cn/Pacman.html "Pacman"):

\$ pacman -Qo /lib/libthread_db.so.1

/lib/libthread_db.so.1 is owned by *glibc* 2.5-8\

The package is called <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=glibc" class="external text" rel="nofollow">glibc</a></span><sup><span class="small">包</span></sup></span> in version 2.5-8. Repeat this step for every package that needs debugging information.

<div class="mw-heading mw-heading3">

### Installing debug packages

</div>

<div class="noprint archwiki-template-message">

<span class="mw-default-size" typeof="mw:File"><a href="../../File:Tango-view-fullscreen.png" class="mw-file-description"><img src="../../File:Tango-view-fullscreen.png" class="mw-file-element" decoding="async" width="48" height="48" /></a></span>**这篇文章的某些内容需要扩充。**

<div>

**原因：**Explain the different scenarios properly. Either you install a debug package or you let [debuginfod](../../zh-cn/Debuginfod.html "Debuginfod") fetch the things it needs? (在 <a href="../../zh-cn/Talk:%E8%B0%83%E8%AF%95/%E8%8E%B7%E5%8F%96%E8%B7%9F%E8%B8%AA%E4%BF%A1%E6%81%AF.html" class="external text" rel="nofollow">Talk:调试/获取跟踪信息</a> 中讨论)

</div>

</div>

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**Debug packages are not archived by Arch Linux on [Arch Linux Archive](../../zh-cn/Arch_Linux_Archive.html "Arch Linux Archive").

</div>

A few mirrors currently distribute debug packages in accessible repositories. These are sponsored mirrors controlled by Arch Linux and are given access to the debug repositories.

- <a href="https://geo.mirror.pkgbuild.com" class="external free" rel="nofollow">https://geo.mirror.pkgbuild.com</a> (GeoDNS mirror)

To install a package you can install it directly from the repository. For example:

\# pacman -U https://geo.mirror.pkgbuild.com/core-debug/os/x86_64/*zstd-debug-1.5.2-2*-x86_64.pkg.tar.zst\

<div class="archwiki-template-box archwiki-template-box-warning">

**警告：**Debug packages from one <a href="/wzh/index.php?title=Mirror&amp;action=edit&amp;redlink=1" class="new" title="Mirror（页面不存在）">mirror</a> are not compatible with regular packages from another mirror, if both mirrors are not in sync, and thus have mismatching builds. In this case, avoid mixing packages from different mirrors (this would result in a <a href="/wzh/index.php?title=Partial_upgrade&amp;action=edit&amp;redlink=1" class="new" title="Partial upgrade（页面不存在）">partial upgrade</a>), but point all repositories to the `debug` mirror.

</div>

<div class="noprint archwiki-template-message">

<span class="mw-default-size" typeof="mw:File"><a href="../../File:Merge-arrows-2.png" class="mw-file-description"><img src="../../File:Merge-arrows-2.png" class="mw-file-element" decoding="async" width="48" height="48" /></a></span>**本文或本章节可能需要合并到<a href="../../zh-cn/Official_repositories.html" class="mw-redirect" title="Official repositories">Official repositories</a>。**

<div>

**附注：** Official repositories have a dedicated page（在 <a href="/wzh/index.php?title=Talk:%E8%B0%83%E8%AF%95/%E8%8E%B7%E5%8F%96%E8%B7%9F%E8%B8%AA%E4%BF%A1%E6%81%AF&amp;action=edit&amp;redlink=1" class="new" title="Talk:调试/获取跟踪信息（页面不存在）">Talk:调试/获取跟踪信息#mirrors distributing debug packages.</a> 中讨论）

</div>

</div>

Another option is to add the repositories to your pacman configuration.

/etc/pacman.conf

\# Testing Repositories\
\
\[core-testing-debug\]\
Include = /etc/pacman.d/mirrorlist\
\
\[extra-testing-debug\]\
Include = /etc/pacman.d/mirrorlist\
\
\[multilib-testing-debug\]\
Include = /etc/pacman.d/mirrorlist\
\
\# Stable repositories\
\
\[core-debug\]\
Include = /etc/pacman.d/mirrorlist\
\
\[extra-debug\]\
Include = /etc/pacman.d/mirrorlist\
\
\[multilib-debug\]\
Include = /etc/pacman.d/mirrorlist

Place a mirror with debug packages as the first one in the mirrorlist file:

/etc/pacman.d/mirrorlist

Server = https://geo.mirror.pkgbuild.com/\$repo/os/\$arch\
...

<div class="mw-heading mw-heading3">

### Rebuilding packages

</div>

If debug information is not exposed through *debuginfod* (for example, when the package originates from the <a href="../../zh-cn/Arch_%E7%94%A8%E6%88%B7%E8%BD%AF%E4%BB%B6%E4%BB%93%E5%BA%93.html" class="mw-redirect" title="AUR">AUR</a>), then it can be rebuilt from source. See <a href="../../zh-cn/Arch_%E6%9E%84%E5%BB%BA%E7%B3%BB%E7%BB%9F.html" class="mw-redirect" title="ABS">ABS</a> for packages in the <a href="../../zh-cn/Official_repositories.html" class="mw-redirect" title="Official repositories">official repositories</a>, or <a href="../../zh-cn/Arch_%E7%94%A8%E6%88%B7%E8%BD%AF%E4%BB%B6%E4%BB%93%E5%BA%93.html#Acquire_build_files" class="mw-redirect" title="AUR">AUR#Acquire build files</a> for packages in the <a href="../../zh-cn/Arch_%E7%94%A8%E6%88%B7%E8%BD%AF%E4%BB%B6%E4%BB%93%E5%BA%93.html" class="mw-redirect" title="AUR">AUR</a>.

To set the required [\#Compilation options](#Compilation_options), you can modify the [makepkg configuration](../../zh-cn/Makepkg.html#Configuration "Makepkg") if you will only use *makepkg* for debug purposes. In other cases, you should modify package's `PKGBUILD` file only for each package you would like to rebuild.

<div class="mw-heading mw-heading4">

#### Compilation options

</div>

As of pacman 4.1, <span class="plainlinks archwiki-template-man" title="$ man 5 makepkg.conf"><a href="https://man.archlinux.org/man/makepkg.conf.5" class="external text" rel="nofollow">makepkg.conf(5)</a></span> has debug compilation flags in `DEBUG_CFLAGS` and `DEBUG_CXXFLAGS`. To use them, enable the `debug` *makepkg* option, and disable `strip`.

These settings will force compilation with debug symbols and will disable their stripping from executables.

/etc/makepkg.conf

OPTIONS+=(debug !strip)

To apply this setting to a single package, modify the `PKGBUILD`:

PKGBUILD

options=(debug !strip)

Alternatively you can put the debug information in a separate package by enabling both `debug` and `strip`, debug symbols will then be stripped from the main package and placed, together with source files to aid in stepping through the debugger, in a separate *`pkgbase`*`-debug` package. This is advantageous if the package contains very large binaries (e.g. over a GB with debug symbols included) as it might cause freezing and other strange, unwanted behavior occurring.

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**It is insufficient to simply install the newly compiled debug package, because the debugger will check that the file containing the debug symbols is from the same build as the associated library and executable. You must install both of the recompiled packages. In Arch, the debug symbol files are installed under `/usr/lib/debug/`, and source files are installed under `/usr/src/debug`. See the <a href="https://sourceware.org/gdb/onlinedocs/gdb/Separate-Debug-Files.html" class="external text" rel="nofollow">GDB documentation</a> for more information about debug packages.

</div>

<div class="mw-heading mw-heading5">

##### glibc

</div>

Certain packages such as *glibc* are stripped regardless. Check the `PKGBUILD` for sections such as:

strip \$STRIP_BINARIES usr/bin/{gencat,getconf,getent,iconv,iconvconfig} \\\
                      usr/bin/{ldconfig,locale,localedef,makedb} \\\
                      usr/bin/{pcprofiledump,pldd,rpcgen,sln,sprof} \\\
                      usr/lib/getconf/\*\
\
strip \$STRIP_STATIC usr/lib/\*.a\
\
strip \$STRIP_SHARED usr/lib/{libanl,libBrokenLocale,libcidn,libcrypt}-\*.so \\\
                    usr/lib/libnss\_{compat,db,dns,files,hesiod,nis,nisplus}-\*.so \\\
                    usr/lib/{libdl,libm,libnsl,libresolv,librt,libutil}-\*.so \\\
                    usr/lib/{libmemusage,libpcprofile,libSegFault}.so \\\
                    usr/lib/{audit,gconv}/\*.so\

And remove them where appropriate.

<div class="mw-heading mw-heading5">

##### Clang

</div>

<div class="noprint archwiki-template-message">

<span class="mw-default-size" typeof="mw:File"><a href="../../File:Tango-view-refresh-red.png" class="mw-file-description"><img src="../../File:Tango-view-refresh-red.png" class="mw-file-element" decoding="async" width="48" height="48" /></a></span>**本文或本节内容已经过时。**

<div>

**原因：** The package that served as a reference is no longer in the repositories, do we have a more recent example? (在<a href="../../zh-cn/Talk:%E8%B0%83%E8%AF%95/%E8%8E%B7%E5%8F%96%E8%B7%9F%E8%B8%AA%E4%BF%A1%E6%81%AF.html" class="external text" rel="nofollow">Talk:调试/获取跟踪信息</a>讨论)

</div>

</div>

Packages using [Clang](../../zh-cn/Clang.html "Clang") as the compiler will not build with the `debug` option due to the debug flag `-fvar-tracking-assignments'` not being handled (e.g. the previous <a href="https://gitlab.archlinux.org/archlinux/packaging/packages/js78/-/blob/main/PKGBUILD" class="external text" rel="nofollow">js78 PKGBUILD</a>).

Add the following at the top of the `build()` function to only remove the flag for the affected package:

build() {\
  CFLAGS=\${CFLAGS/-fvar-tracking-assignments}\
  CXXFLAGS=\${CXXFLAGS/-fvar-tracking-assignments}\
\[...\]

<div class="mw-heading mw-heading5">

##### LTO

</div>

Using <a href="https://en.wikipedia.org/wiki/Interprocedural_optimization#WPO_and_LTO" class="extiw" title="w:Interprocedural optimization">Link-time optimization (LTO)</a> will, both during compiling and in a debugger, use more memory<a href="https://pp.ipd.kit.edu/uploads/publikationen/weinreuter16bachelorarbeit.pdf#section.4.3" class="external autonumber" rel="nofollow">[1]</a><a href="https://sourceware.org/bugzilla/show_bug.cgi?id=23710" class="external autonumber" rel="nofollow">[2]</a>. Depending on the application, especially if it is a large one like Firefox or Qt, it might exceed the available memory. Build the application without LTO if this happens.

All packages in the official repositories are generally built with LTO.

<div class="mw-heading mw-heading4">

#### Building and installing the package

</div>

Build the package from source using `makepkg` while in the `PKGBUILD`'s directory. This could take some time:

\$ makepkg\

Then install the built package:

\# pacman -U glibc-2.26-1-x86_64.pkg.tar.gz\

<div class="mw-heading mw-heading2">

## <span id=".E5.8F.82.E8.A7.81"></span>参见

</div>

- <a href="https://wiki.debian.org/HowToGetABacktrace" class="extiw" title="debian:HowToGetABacktrace">Debian:HowToGetABacktrace</a>
- <a href="https://wiki.gentoo.org/wiki/Project:Quality_Assurance/Backtraces" class="extiw" title="gentoo:Project:Quality Assurance/Backtraces">Gentoo:Project:Quality Assurance/Backtraces</a>
- <a href="https://fedoraproject.org/wiki/StackTraces" class="extiw" title="fedora:StackTraces">Fedora:StackTraces</a>
- <a href="https://wiki.gnome.org/GettingInTouch/Bugzilla/GettingTraces/Details#Obtaining_a_stack_trace_.28the_easy_way.29" class="external text" rel="nofollow">GNOME - Getting Stack Traces</a>
- <a href="https://linux.bytesex.org/gdb.html" class="external text" rel="nofollow">gdb mini intro</a>

</div>
