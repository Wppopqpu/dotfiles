<div class="mw-content-ltr mw-parser-output" lang="zh-Hans-CN" dir="ltr">

<div class="archwiki-template-meta-related-articles-start">

相关文章

- <a href="/wzh/index.php?title=TORQUE&amp;action=edit&amp;redlink=1" class="new" title="TORQUE（页面不存在）">TORQUE</a>
- <a href="/wzh/index.php?title=Slurm&amp;action=edit&amp;redlink=1" class="new" title="Slurm（页面不存在）">Slurm</a>

</div>

<div class="aside archwiki-template-box archwiki-template-box-note noexcerpt">

**翻译状态：**

- 本文（或部分内容）译自 <a href="https://wiki.archlinux.org/title/Distcc" class="extiw" title="arch:Distcc">Distcc</a>，最近一次同步于 2021-04-15，若英文版本有所<a href="https://wiki.archlinux.org/title/Distcc?diff=0&amp;oldid=658186" class="external text" rel="nofollow">更改</a>，则您可以帮助同步与[翻译](../zh-cn/Help:%E7%BF%BB%E8%AF%91.html "Help:翻译")更改的内容。
- 您可以在 <a href="https://wiki.archlinux.org/title/Distcc_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)?action=history" class="external text" rel="nofollow">ArchWiki 的对应页面</a>找到本文翻译的**原始**修订历史。
- 本文可能与英文原文存在出入。

</div>

<a href="https://en.wikipedia.org/wiki/distcc" class="extiw" title="wikipedia:distcc">distcc</a> 是一个将 C、C++、Objective C 或 Objective C++ 等程序的编译任务分发到网络中多个主机的程序。distcc 力求实现和本地编译相同的结果，安装、使用都很方便，而且通常比本地编译快很多。distcc 也可以与 Arch 原生的编译工具，比如 makepkg，很好搭配使用。

<div class="mw-heading mw-heading2">

## <span id=".E5.90.8D.E8.AF.8D.E5.AE.9A.E4.B9.89"></span>名词定义

</div>

客户机  
启动编译的计算机。

志愿机  
接受客户机发送的编译请求的计算机。一个 distcc 编译集群可以包含一台或多台志愿机。

<div class="mw-heading mw-heading2">

## <span id=".E5.BC.80.E5.A7.8B.E4.BD.BF.E7.94.A8"></span>开始使用

</div>

将整个编译集群中的计算机都<a href="../zh-cn/Help:%E9%98%85%E8%AF%BB.html#%E5%AE%89%E8%A3%85%E8%BD%AF%E4%BB%B6%E5%8C%85" class="mw-redirect" title="安装">安装</a>软件包 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=distcc" class="external text" rel="nofollow">distcc</a></span><sup><span class="small">包</span></sup></span>。如果是其他的发行版，甚至包括使用 Cygwin 的 Windows 操作系统,请阅读 <a href="https://distcc.samba.org/doc.html" class="external text" rel="nofollow">distcc 文档</a>或 <span class="plainlinks archwiki-template-man" title="$ man 1 distcc"><a href="https://man.archlinux.org/man/distcc.1" class="external text" rel="nofollow">distcc(1)</a></span> 和 <span class="plainlinks archwiki-template-man" title="$ man 1 distccd"><a href="https://man.archlinux.org/man/distccd.1" class="external text" rel="nofollow">distccd(1)</a></span> 的手册页。请保持 distcc 使用的端口畅通（默认是TCP 3632 端口），参见<a href="../zh-cn/Category:%E9%98%B2%E7%81%AB%E5%A2%99.html" class="mw-redirect" title="Category:Firewalls">Category:Firewalls</a>。

<div class="mw-heading mw-heading2">

## <span id=".E9.85.8D.E7.BD.AE"></span>配置

</div>

<div class="mw-heading mw-heading3">

### <span id=".E5.B7.A5.E4.BD.9C.E6.A8.A1.E5.BC.8F"></span>工作模式

</div>

Distcc 可以在普通模式（默认模式）或泵模式下使用。简单来讲，这两个模式的核心区别在于如何处理预处理过的源代码。普通模式会传递预处理器展开过的源代码和编译选项，由客户机负责预处理，而泵模式会把预处理和编译工作全部分发到 distcc 编译集群中，通常会更快、效率更高。更多细节请参见手册页 `man distcc`。

<div class="mw-heading mw-heading3">

### <span id=".E5.BF.97.E6.84.BF.E6.9C.BA.E9.85.8D.E7.BD.AE"></span>志愿机配置

</div>

志愿机的配置文件储存在 `/etc/conf.d/distccd` 处。最简单的例子，是添加 --allow-private 选项，这样就能够覆盖整个 ipv4 局域网的范围。保存日志到文件也是排错时经常需要的：

DISTCC_ARGS="--allow-private --log-file /tmp/distccd.log"\

如果设备有很多网卡，请考虑添加 --listen \<监听地址\>。其它设置请参考 <span class="plainlinks archwiki-template-man" title="$ man 1 distccd"><a href="https://man.archlinux.org/man/distccd.1" class="external text" rel="nofollow">distccd(1)</a></span>。

在所有志愿机上<a href="../zh-cn/Help:%E9%98%85%E8%AF%BB.html#%E6%8E%A7%E5%88%B6_systemd_%E5%8D%95%E5%85%83" class="mw-redirect" title="Start">启动</a>服务 `distccd.service`。要使服务开机自启，请<a href="../zh-cn/Help:%E9%98%85%E8%AF%BB.html#%E6%8E%A7%E5%88%B6_systemd_%E5%8D%95%E5%85%83" class="mw-redirect" title="Enable">启用</a>此服务。

<div class="mw-heading mw-heading3">

### <span id=".E5.AE.A2.E6.88.B7.E6.9C.BA.E9.85.8D.E7.BD.AE"></span>客户机配置

</div>

<div class="mw-heading mw-heading4">

#### <span id="makepkg_.E7.BC.96.E8.AF.91.E9.80.89.E9.A1.B9"></span>makepkg 编译选项

</div>

编辑`/etc/makepkg.conf`的这些部分：

1.  确保 BUILDENV 数组中的 distcc 没有被禁用(即前面没有感叹号)
2.  取消注释并编辑*DISTCC_HOSTS*行 ，加入可以使用的志愿机的 IP 地址或主机名。可以加上一个正斜杠（"/"）以及最大使用线程数。不同 IP 地址用空白隔开，这个清单应该按照处理器性能从高到低排列。
3.  修改 MAKEFLAGS 中的 -jN 为所有使用线程数的和的两倍。在下面的示例为 2x(9+5+5+3)=44。

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**虽然 IP 地址或主机名都可以描述志愿机，但如果使用 devtools 的编译脚本，现在仍然不支持主机名解析，此时请使用 IP 地址代替。另外，每次编译都进行的主机名解析可能会塞满一些DNS设备的日志（比如pi-hole），此时指定 IP 地址就不会有这些麻烦。

</div>

<div class="archwiki-template-box archwiki-template-box-note">

**注意：** `CFLAGS` 和 `CXXFLAGS` 中不能使用 `-march=native` 选项，否则 distccd 不会将编译任务发给其它机器。

</div>

另外，没有一个万能配置能够覆盖全部（尤其是线程数与 MAKEFLAGS 的并行线程数）。请一个一个测试您的参数，并与其他参数的结果做比较，以获取最优的配置。下面是一些例子。

<div class="mw-heading mw-heading5">

##### <span id=".E6.99.AE.E9.80.9A.E6.A8.A1.E5.BC.8F.E4.BE.8B.E5.AD.90"></span>普通模式例子

</div>

BUILDENV=(distcc fakeroot color !ccache check !sign)\
MAKEFLAGS="-j44"\
DISTCC_HOSTS="localhost/9 192.168.10.2/5 192.168.10.3/5 192.168.10.4/3"\

<div class="mw-heading mw-heading5">

##### <span id=".E6.B3.B5.E6.A8.A1.E5.BC.8F.E4.BE.8B.E5.AD.90"></span>泵模式例子

</div>

BUILDENV=(distcc fakeroot color !ccache check !sign)\
MAKEFLAGS="-j70"\
DISTCC_HOSTS="localhost/9 192.168.10.2,cpp,lzo 192.168.10.3,cpp,lzo 192.168.10.4,cpp,lzo"\

请注意以下事项：

- 并行数高的话，泵模式的表现通常更好。
- 在泵模式下，IP 地址或主机名会跟上指示泵模式所需要的",cpp,lzo"的后缀。此处的本机localhost没有加上这个后缀，这意味着，distcc会按照普通模式严格向localhost安排9个任务，并激进地以泵模式向志愿机分发其他任务，这是一个大集群中的通常实践：客户机通常不希望编译任务阻塞他们，以此限制客户机的任务数。如果您一视同仁，也可以加上这个后缀。
- 正如提到的那样，没有一个万能配置能够覆盖全部情况。如何选择一个最优的设置通常需要一些经验。

<div class="mw-heading mw-heading4">

#### <span id=".E9.9D.9E_makepkg_.E7.BC.96.E8.AF.91.E9.80.89.E9.A1.B9"></span>非 makepkg 编译选项

</div>

<div class="mw-heading mw-heading5">

##### <span id=".E6.99.AE.E9.80.9A.E6.A8.A1.E5.BC.8F.E4.BE.8B.E5.AD.90_2"></span>普通模式例子

</div>

下面的最小 distcc 客户机配置包括了志愿者设置，并将他们附加到PATH环境变量上。

\$ export PATH="/usr/lib/distcc/bin:\$PATH"\
\$ export DISTCC_HOSTS="localhost/9 192.168.10.2/5 192.168.10.3/5 192.168.10.4/3"\

<div class="mw-heading mw-heading5">

##### <span id=".E6.B3.B5.E6.A8.A1.E5.BC.8F.E4.BE.8B.E5.AD.90_2"></span>泵模式例子

</div>

\$ export PATH="/usr/lib/distcc/bin:\$PATH"\
\$ export DISTCC_HOSTS="localhost/9 192.168.10.2,cpp,lzo 192.168.10.3,cpp,lzo 192.168.10.4,cpp,lzo"\

<div class="mw-heading mw-heading2">

## <span id=".E7.BC.96.E8.AF.91"></span>编译

</div>

<div class="mw-heading mw-heading3">

### <span id="makepkg_.E7.BC.96.E8.AF.91"></span>makepkg 编译

</div>

<div class="mw-heading mw-heading4">

#### <span id=".E6.99.AE.E9.80.9A.E6.A8.A1.E5.BC.8F"></span>普通模式

</div>

只要按照上面的过程配置好 `/etc/makepkg.conf` 就可以了。正常运行 makepkg 即可。

<div class="mw-heading mw-heading4">

#### <span id=".E6.B3.B5.E6.A8.A1.E5.BC.8F"></span>泵模式

</div>

用户必须在编译前启动分发泵。因为分发泵pump程序会在启动时检查DISTCC_HOSTS是否正确配置，因此我们需要先定义一个 DISTCC_HOSTS 搪塞过去。makepkg 会使用 `/etc/makepkg.conf` 里定义的变量，因此不会影响。

\$ export DISTCC_HOSTS="localhost,cpp,lzo"\
\$ eval \`pump --startup\`\

然后正常运行 makepkg 即可。

结束时，执行以下指令把分发泵关掉：

\$ pump --shutdown\

<div class="mw-heading mw-heading3">

### <span id=".E9.9D.9E_makepkg_.E7.BC.96.E8.AF.91"></span>非 makepkg 编译

</div>

<div class="mw-heading mw-heading4">

#### <span id=".E6.99.AE.E9.80.9A.E6.A8.A1.E5.BC.8F_2"></span>普通模式

</div>

按照[\#非 makepkg 编译选项](#%E9%9D%9E_makepkg_%E7%BC%96%E8%AF%91%E9%80%89%E9%A1%B9)章节配置好需要的变量后，直接调用编译器即可：

\$ make -j44\

有些程序可能需要定义CC 和/或 CXX 变量才能正常工作：

 \$ make -j44 CC=distcc CXX=distcc\

<div class="mw-heading mw-heading4">

#### <span id=".E6.B3.B5.E6.A8.A1.E5.BC.8F_2"></span>泵模式

</div>

按照上面一节方法操作分发泵。其他内容和普通模式相同。

<div class="mw-heading mw-heading3">

### <span id="CMake_.E7.BC.96.E8.AF.91"></span>CMake 编译

</div>

使用以下 CMake 选项来使用 distcc 编译一个使用 CMake 管理的项目：

\$ cmake -DCMAKE_C_COMPILER_LAUNCHER=distcc -DCMAKE_CXX_COMPILER_LAUNCHER=distcc ...\

<div class="mw-heading mw-heading2">

## <span id=".E7.9B.91.E8.A7.86.E8.BF.9B.E5.BA.A6"></span>监视进度

</div>

软件包 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=distcc" class="external text" rel="nofollow">distcc</a></span><sup><span class="small">包</span></sup></span> 提供了一个命令行界面的监视器 `distccmon-text` 来检查编译进度。

如果在调用这个命令行界面监视器加上一个空格和一个等待秒数，就可以按照秒数不断更新显示。

\$ distccmon-text 3\
29291 Preprocess  probe_64.c                                 192.168.10.2\[0\]\
30954 Compile     apic_noop.c                                192.168.10.2\[0\]\
30932 Preprocess  kfifo.c                                    192.168.10.2\[0\]\
30919 Compile     blk-core.c                                 192.168.10.2\[1\]\
30969 Compile     i915_gem_debug.c                           192.168.10.2\[3\]\
30444 Compile     block_dev.c                                192.168.10.3\[1\]\
30904 Compile     compat.c                                   192.168.10.3\[2\]\
30891 Compile     hugetlb.c                                  192.168.10.3\[3\]\
30458 Compile     catalog.c                                  192.168.10.4\[0\]\
30496 Compile     ulpqueue.c                                 192.168.10.4\[2\]\
30506 Compile     alloc.c                                    192.168.10.4\[0\]\

<div class="mw-heading mw-heading2">

## <span id=".E4.BD.BF.E7.94.A8_distcc_.E4.BA.A4.E5.8F.89.E7.BC.96.E8.AF.91"></span>使用 distcc 交叉编译

</div>

交叉编译也可使用 distcc 助力。

- 客户机必须运行在目标架构上。
- 其他架构的志愿机可以协助编译，但必须安装对应的工具链，并配置 distcc。

<div class="mw-heading mw-heading3">

### <span id="ARM_.E6.9E.B6.E6.9E.84_Arch_Linux_.E5.AE.A2.E6.88.B7.E6.9C.BA.E4.B8.8E_x86_64_.E6.9E.B6.E6.9E.84.E7.9A.84.E5.BF.97.E6.84.BF.E6.9C.BA"></span>ARM 架构 Arch Linux 客户机与 x86_64 架构的志愿机

</div>

下面一节介绍了如何使用 x86_64 架构的志愿机来帮助 Arch Linux ARM 架构设备编译。只需要一台 x86_64 架构的志愿机就能够加快 2 到 4 倍的编译速度，具体可以参见<a href="https://github.com/graysky2/distccd-alarm" class="external text" rel="nofollow">这些测试</a>。

<div class="mw-heading mw-heading4">

#### <span id=".E5.BF.97.E6.84.BF.E6.9C.BA"></span>志愿机

</div>

Arch ARM 开发者*强烈*推荐使用并在 x86_64 架构的志愿机上安装官方的<a href="https://archlinuxarm.org/wiki/Distcc_Cross-Compiling" class="external text" rel="nofollow">工具链</a>。与其手动配置，<a href="../zh-cn/Arch_%E7%94%A8%E6%88%B7%E8%BD%AF%E4%BB%B6%E4%BB%93%E5%BA%93.html" class="mw-redirect" title="AUR">AUR</a>提供了所有的工具链、配置文件，和系统服务：

- <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://aur.archlinux.org/packages/distccd-alarm-armv7h/" class="external text" rel="nofollow">distccd-alarm-armv7h</a></span><sup><span class="small">AUR</span></sup></span>
- <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://aur.archlinux.org/packages/distccd-alarm-armv8/" class="external text" rel="nofollow">distccd-alarm-armv8</a></span><sup><span class="small">AUR</span></sup></span>

这些工具链的配置过程和[\#志愿机配置](#%E5%BF%97%E6%84%BF%E6%9C%BA%E9%85%8D%E7%BD%AE)一节完全相似，除了配置文件和系统服务文件对应包名有所更改。比如 **armv7h** 的配置文件是 `/etc/conf.d/distccd-`**`armv7h`**，systemd 服务文件是 `distccd-`**`armv7h`**`.service`。

注意这些工具链的端口都不同，使得他们可以共存而不冲突。请一定保持他们使用的端口畅通。（参见<a href="../zh-cn/Category:%E9%98%B2%E7%81%AB%E5%A2%99.html" class="mw-redirect" title="Category:Firewalls">Category:Firewalls</a> 和手册页 <span class="plainlinks archwiki-template-man" title="$ man 1 distcc"><a href="https://man.archlinux.org/man/distcc.1" class="external text" rel="nofollow">distcc(1)</a></span>）

|                  |             |
|------------------|-------------|
| 目标架构         | distcc 端口 |
| *armv7h*         | 3635        |
| *armv8h/aarch64* | 3636        |

<div class="mw-heading mw-heading4">

#### <span id=".E5.AE.A2.E6.88.B7.E6.9C.BA"></span>客户机

</div>

配置 Arch ARM 客户机的最简单办法是使用<span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://aur.archlinux.org/packages/distccd-arch-arm/" class="external text" rel="nofollow">distccd-arch-arm</a></span><sup><span class="small">AUR</span></sup></span>包。这个包提供了针对Arch ARM架构的所有四个配置文件和系统服务配置文件。比如说如果运行的是**armv7h**固件，只需要配置 `/etc/conf.d/distccd-`**`armv7h`** 文件并按照上述内容编辑默认值。再启动 `distccd-`**`armv7h`**`.service` 服务以编译。

更详细的介绍，请参见<a href="https://github.com/graysky2/distccd-arch-arm#usage-examples" class="external text" rel="nofollow">使用示例</a>。

如果希望不使用AUR包而手动配置客户机，可以按照通用的方法配置客户机，但需要更改如下两个内容来更改默认端口。例如（端口假设是按照上面的表格）：

1.  `/etc/conf.d/distcc`: armv7h 示例： `DISTCC_ARGS="--allow-private --log-level info --log-file /tmp/distccd-armv7h.log --port 3635"`
2.  `/etc/makepkg.conf`: armv7h 示例： `DISTCC_HOSTS="192.168.10.2/5:3635 192.168.10.3/5:3635"`

<div class="mw-heading mw-heading3">

### <span id="x86_64_.E6.9E.B6.E6.9E.84.E7.9A.84_Arch_Linux_.E5.AE.A2.E6.88.B7.E6.9C.BA.E4.B8.8E_ARM_.E6.9E.B6.E6.9E.84.E5.BF.97.E6.84.BF.E6.9C.BA"></span>x86_64 架构的 Arch Linux 客户机与 ARM 架构志愿机

</div>

下面一节介绍了如何使用 ARM 架构的志愿机来帮助x86_64 架构客户机编译。只需要一台 x86_64 架构的志愿机就能够显著加快编译速度，两台设备就能翻倍。具体可以参见<a href="https://github.com/graysky2/crosstool-ng_for_distcc#real-speed-gains-compiling-x86-64-can-be-realized-with-arm-volunteers" class="external text" rel="nofollow">这些测试</a>。

<div class="mw-heading mw-heading4">

#### <span id=".E5.AE.A2.E6.88.B7.E6.9C.BA_2"></span>客户机

</div>

可以按照通用的方法配置客户机，其对应的标准端口是 3632。

<div class="mw-heading mw-heading4">

#### <span id=".E5.BF.97.E6.84.BF.E6.9C.BA_2"></span>志愿机

</div>

<span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://aur.archlinux.org/packages/distccd-x86_64/" class="external text" rel="nofollow">distccd-x86_64</a></span><sup><span class="small">AUR</span></sup></span> 提供了装在 Arch ARM 设备上的交叉编译工具。

<div class="mw-heading mw-heading3">

### <span id=".E9.99.84.E5.8A.A0.E5.B7.A5.E5.85.B7.E9.93.BE"></span>附加工具链

</div>

- <a href="https://embtoolkit.org/" class="external text" rel="nofollow">EmbToolkit</a>： 创建交叉编译工具链的工具；支持 ARM 和 MIPS 架构；支持创建LLVM工具链
- <a href="http://crosstool-ng.org/" class="external text" rel="nofollow">crosstool-ng</a>：和EmbToolkit相似，支持更多架构（更多信息参见其网站）
- <a href="https://www.linaro.org/downloads/" class="external text" rel="nofollow">Linaro</a>：提供了ARM开发的工具链

`EmbToolkit` 有一个很好看的配置工具链的图形配置菜单（`make xconfig`）。

<div class="mw-heading mw-heading2">

## <span id=".E6.95.85.E9.9A.9C.E6.8E.92.E9.99.A4"></span>故障排除

</div>

<div class="mw-heading mw-heading3">

### <span id=".E7.BC.96.E8.AF.91_Arch_Linux_.E5.86.85.E6.A0.B8.E5.8C.85.E6.97.B6.E7.9A.84.E5.A5.87.E6.80.AA.E7.8E.B0.E8.B1.A1"></span>编译 Arch Linux 内核包时的奇怪现象

</div>

如果使用官方的PKGBUILD来编译内核，distcc 将无法工作，因为内核硬编码使用了一些GCC插件，因为一些技术原因distccd不能够支持他们。

可以通过编辑内核、删掉这些对 GCC 插件的要求来迂回。可以在编译前在 PKGBUILD 中用一行 sed 命令搞定：

sed -i '/HAVE_GCC_PLUGINS/d' arch/x86/Kconfig\

如果不这样就无法编译。参见 <a href="https://bugs.archlinux.org/task/64275" class="external text" rel="nofollow">FS#64275</a>。

另一种办法是编译时传递 CC=distcc 和 CXX=distcc 变量：

make all CC=distcc CXX=distcc\

<div class="mw-heading mw-heading3">

### <span id=".E7.BC.96.E8.AF.91_chromium_.E5.8C.85.E6.97.B6.E7.9A.84.E5.A5.87.E6.80.AA.E7.8E.B0.E8.B1.A1"></span>编译 chromium 包时的奇怪现象

</div>

编译 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=chromium" class="external text" rel="nofollow">chromium</a></span><sup><span class="small">包</span></sup></span> 会使用 clang，目前受到<a href="https://github.com/distcc/distcc/issues/368" class="external text" rel="nofollow">issue#386</a>的影响。规避这个bug可以在PKGBUILD的`_flags`数组中添加这些：

'is_cfi=false'\
'use_gold=false'\
'clang_use_default_sample_profile=false'\
'chrome_pgo_phase=0'\

<div class="mw-heading mw-heading3">

### Journalctl

</div>

使用 `journalctl` 查看什么地方出错了：

\# journalctl \$(which distccd) -e --since "5 min ago"\

<div class="mw-heading mw-heading3">

### <span id=".E8.B0.83.E6.95.B4.E6.97.A5.E5.BF.97.E8.AE.B0.E5.BD.95.E7.AD.89.E7.BA.A7"></span>调整日志记录等级

</div>

通常来说，distcc会把log写到 `/var/log/messages.log` 里。一个技巧（这个是distccd的手册页推荐的）是写到其他文件里面，比如写到内存（通过 /tmp）里去。另一个技巧是提高日志记录等级，只记录错误信息。这个等级可以是任何标准系统日志等级，即critical、error、warning、notice、info，或者debug。

在客户机上按照这些参数启动distcc，或修改志愿机的`/etc/conf.d/distccd`文件的DISTCC_ARGS参数：

DISTCC_ARGS="--allow 192.168.10.0/24 --log-level error --log-file /tmp/distccd.log"\

<div class="mw-heading mw-heading3">

### <span id=".E4.BF.AE.E6.94.B9_.24HOME.2F.distcc_.E6.96.87.E4.BB.B6.E5.A4.B9.E4.BD.8D.E7.BD.AE.E4.BB.A5.E5.87.8F.E5.B0.91.E7.A1.AC.E7.9B.98.E8.AF.BB.E5.86.99"></span>修改 \$HOME/.distcc 文件夹位置以减少硬盘读写

</div>

distcc 默认会创建 `$HOME/.distcc` 文件夹来暂时保存节点编译相关的信息。下面的命令可以减少不必要的硬盘读写，尤其对 SSD 友好：

\$ export DISTCC_DIR=/tmp/distcc\

<div class="mw-heading mw-heading3">

### <span id="distccd-alarm_.E7.9B.B8.E5.85.B3"></span>distccd-alarm 相关

</div>

<div class="mw-heading mw-heading4">

#### <span id=".E6.B2.A1.E6.9C.89.E9.82.A3.E4.B8.AA.E6.96.87.E4.BB.B6.E6.88.96.E7.9B.AE.E5.BD.95"></span>没有那个文件或目录

</div>

与下例类似的错误表明用户错误地启动了 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=distcc" class="external text" rel="nofollow">distcc</a></span><sup><span class="small">包</span></sup></span> 而不是 distccd-alarm 包（即<span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://aur.archlinux.org/packages/distccd-alarm-armv7h/" class="external text" rel="nofollow">distccd-alarm-armv7h</a></span><sup><span class="small">AUR</span></sup></span>，或 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://aur.archlinux.org/packages/distccd-alarm-armv8/" class="external text" rel="nofollow">distccd-alarm-armv8</a></span><sup><span class="small">AUR</span></sup></span>）提供的distccd。

请一定针对目标架构启动正确的服务。

distcc\[25479\] (dcc_execvp) ERROR: failed to exec armv7l-unknown-linux-gnueabihf-g++: No such file or directory\

<div class="mw-heading mw-heading2">

## <span id=".E5.8F.A6.E8.AF.B7.E5.8F.82.E8.A7.81"></span>另请参见

</div>

- <a href="https://github.com/distcc/distcc" class="external free" rel="nofollow">https://github.com/distcc/distcc</a>

<!-- -->

- <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://aur.archlinux.org/packages/icecream/" class="external text" rel="nofollow">icecream</a></span><sup><span class="small">AUR</span></sup></span> - 一个更好配置的 distcc 分支。

</div>
