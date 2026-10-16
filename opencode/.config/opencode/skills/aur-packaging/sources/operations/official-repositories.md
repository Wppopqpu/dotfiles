<div class="mw-content-ltr mw-parser-output" lang="zh-Hans-CN" dir="ltr">

<div class="aside archwiki-template-box archwiki-template-box-note noexcerpt">

**翻译状态：**

- 本文（或部分内容）译自 <a href="https://wiki.archlinux.org/title/Official_repositories" class="extiw" title="arch:Official repositories">Official repositories</a>，最近一次同步于 2023-05-23，若英文版本有所<a href="https://wiki.archlinux.org/title/Official_repositories?diff=0&amp;oldid=779252" class="external text" rel="nofollow">更改</a>，则您可以帮助同步与[翻译](../zh-cn/Help:%E7%BF%BB%E8%AF%91.html "Help:翻译")更改的内容。
- 您可以在 <a href="https://wiki.archlinux.org/title/Official_repositories_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)?action=history" class="external text" rel="nofollow">ArchWiki 的对应页面</a>找到本文翻译的**原始**修订历史。
- 本文可能与英文原文存在出入。

</div>

<div id="noteTA-7f3f5856" class="noteTA">

<div class="noteTA-group">

<div data-noteta-group-source="module" data-noteta-group="ArchWiki">

</div>

</div>

</div>

<div class="archwiki-template-meta-related-articles-start">

相关文章

- <a href="../zh-cn/Arch_%E7%94%A8%E6%88%B7%E8%BD%AF%E4%BB%B6%E4%BB%93%E5%BA%93_(AUR).html" class="mw-redirect" title="Arch 用户软件仓库 (AUR)">Arch 用户软件仓库 (AUR)</a>
- [Arch 构建系统](../zh-cn/Arch_%E6%9E%84%E5%BB%BA%E7%B3%BB%E7%BB%9F.html "Arch 构建系统")
- [makepkg](../zh-cn/Makepkg.html "Makepkg")
- <a href="../zh-cn/%E9%95%9C%E5%83%8F%E6%BA%90.html" class="mw-redirect" title="Mirrors">Mirrors</a>
- [官方仓库 web 接口](../zh-cn/%E5%AE%98%E6%96%B9%E4%BB%93%E5%BA%93_web_%E6%8E%A5%E5%8F%A3.html "官方仓库 web 接口")
- [pacman](../zh-cn/Pacman.html "Pacman")
- [PKGBUILD](../zh-cn/PKGBUILD.html "PKGBUILD")
- [非官方用户仓库](../zh-cn/%E9%9D%9E%E5%AE%98%E6%96%B9%E7%94%A8%E6%88%B7%E4%BB%93%E5%BA%93.html "非官方用户仓库")

</div>

<a href="https://en.wikipedia.org/wiki/software_repository" class="extiw" title="wikipedia:software repository">软件仓库</a>是获取软件包的地方。

Arch Linux **官方软件仓库**包含着基础的和较为流行的软件。他们可通过[Pacman](../zh-cn/Pacman.html "Pacman")便捷的获取。软件包由<a href="../zh-cn/Arch_terminology.html#%E8%BD%AF%E4%BB%B6%E5%8C%85%E7%BB%B4%E6%8A%A4%E8%80%85" class="mw-redirect" title="Arch terminology">软件包维护者</a>维护。

官方软件仓库中的软件包会持续更新，即老版本将被新版本所替代。Arch 没有主版本的概念：每个软件在上游有新版本时单独更新。每一个软件仓库都是互相联系的，即，软件仓库中的所有软件都是相互兼容的。

<div class="mw-heading mw-heading2">

## <span id=".E7.A8.B3.E5.AE.9A.E4.BB.93.E5.BA.93"></span>稳定仓库

</div>

<div class="mw-heading mw-heading3">

### core

</div>

core 仓库位于<a href="../zh-cn/%E9%95%9C%E5%83%8F%E6%BA%90.html" class="mw-redirect" title="Mirrors">仓库镜像</a>的 `.../core/os/` 目录。

**core**仓库包含着用于以下用途的软件包:

- 启动 Arch 系统。
- [连接网络](../zh-cn/%E7%BD%91%E7%BB%9C%E9%85%8D%E7%BD%AE.html "网络配置")
- [创建软件包](../zh-cn/%E5%88%9B%E5%BB%BA%E8%BD%AF%E4%BB%B6%E5%8C%85.html "创建软件包")
- 检查、管理和修复所支持的<a href="../zh-cn/File_systems.html" class="mw-redirect" title="File systems">文件系统</a>
- 系统安装（例如<span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=openssh" class="external text" rel="nofollow">openssh</a></span><sup><span class="small">包</span></sup></span>）。

以及上述软件包的依赖（不包括[构建软件包所需的依赖](../zh-cn/PKGBUILD.html#makedepends "PKGBUILD")），以及 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=base" class="external text" rel="nofollow">base</a></span><sup><span class="small">包</span></sup></span> <a href="../zh-cn/Meta_package_and_package_group.html" class="mw-redirect" title="Meta package and package group">元软件包</a>。

*core* 仓库对包有着相当严格的质量要求。软件包的更新需要经过开发者和用户的审察批准。对于低使用率的软件，适当的审核足矣：发布关于更新的通知，请求审核，根据更新的重要性在 [core-testing](#core-testing) 仓库暂留至多一周，并在确保无未解决bug报告后，由<a href="../zh-cn/Arch_terminology.html#%E8%BD%AF%E4%BB%B6%E5%8C%85%E7%BB%B4%E6%8A%A4%E8%80%85" class="mw-redirect" title="Arch terminology">软件包维护者</a>审核通过。

<div class="archwiki-template-box archwiki-template-box-tip">

**提示：**如需在没有网络连接的情况下从 *core* （或其他软件仓库）创建本地软件仓库，见 <a href="../zh-cn/Pacman/Tips_and_tricks.html#Installing_packages_from_a_CD/DVD_or_USB_stick" class="mw-redirect" title="Pacman/Tips and tricks">Pacman/Tips and tricks#Installing packages from a CD/DVD or USB stick</a>

</div>

<div class="mw-heading mw-heading3">

### extra

</div>

*extra* 仓库位于您最喜欢的仓库镜像的 `.../extra/os/` 目录。

*extra*包含不适合在*core*仓库的所有软件包，由 <a href="../zh-cn/Trusted_Users.html" class="mw-redirect" title="Trusted Users">Trusted Users</a> 和 Arch 开发者共同维护。 比如：[Xorg](../zh-cn/Xorg.html "Xorg")，[窗口管理器](../zh-cn/%E7%AA%97%E5%8F%A3%E7%AE%A1%E7%90%86%E5%99%A8.html "窗口管理器")，<a href="../zh-cn/List_of_applications/Internet.html#Web_browsers" class="mw-redirect" title="List of applications/Internet">网络浏览器</a>，<a href="../zh-cn/List_of_applications/Multimedia.html" class="mw-redirect" title="List of applications/Multimedia">媒体播放器</a>，程序语言支持[Python](../zh-cn/Python.html "Python")和[Ruby](../zh-cn/Ruby.html "Ruby")等等。

<div class="mw-heading mw-heading3">

### multilib

</div>

*multilib* 仓库位于您最喜欢的仓库镜像的 `.../multilib/os/` 目录。

*multilib* 包含着32位的软件和链接库，可以用于在64位系统上运行和构建32位软件，例如 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=wine" class="external text" rel="nofollow">wine</a></span><sup><span class="small">包</span></sup></span> <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=steam" class="external text" rel="nofollow">steam</a></span><sup><span class="small">包</span></sup></span> 等。

<div class="mw-heading mw-heading4">

#### <span id=".E5.90.AF.E7.94.A8multilib"></span>启用multilib

</div>

想使用 multilib 仓库，请在`/etc/pacman.conf`文件中取消 `[multilib]` 段落的注释：

/etc/pacman.conf

\[multilib\]\
Include = /etc/pacman.d/mirrorlist

然后<a href="../zh-cn/System_maintenance.html#%E6%9B%B4%E6%96%B0%E7%B3%BB%E7%BB%9F" class="mw-redirect" title="System maintenance">更新系统</a>

<div class="archwiki-template-box archwiki-template-box-tip">

**提示：**运行 `pacman -Sl multilib` 来列出在*multilib*仓库里的所有软件包，32位链接库的软件包以 `lib32-` 开头

</div>

<div class="mw-heading mw-heading4">

#### <span id=".E7.A6.81.E7.94.A8multilib"></span>禁用multilib

</div>

运行下面命令可以删除所有从 *multilib* 安装的软件:

\# pacman -R \$(comm -12 \<(pacman -Qq \| sort) \<(pacman -Slq multilib \| sort))\

如果有 gcc-libs 冲突，请重新安装 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=gcc-libs" class="external text" rel="nofollow">gcc-libs</a></span><sup><span class="small">包</span></sup></span>和<span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=base-devel" class="external text" rel="nofollow">base-devel</a></span><sup><span class="small">包</span></sup></span>的依赖：

在 `/etc/pacman.conf` 中注释掉 `[multilib]` 段落：

/etc/pacman.conf

\#\[multilib\]\
\#Include = /etc/pacman.d/mirrorlist

然后<a href="../zh-cn/System_maintenance.html#%E6%9B%B4%E6%96%B0%E7%B3%BB%E7%BB%9F" class="mw-redirect" title="System maintenance">更新系统</a>

<div class="mw-heading mw-heading2">

## <span id="testing_.E4.BB.93.E5.BA.93"></span>testing 仓库

</div>

*testing* 仓库的目的是提供一个即将被放入主软件仓库的软件包的集散地。软件包维护者（和普通用户）可以访问并测试这些软件包以确保软件包没有问题。当位于 *testing* 仓库的软件包被测试无问题后，即可被移入主仓库。

不是所有的包都需要经过如此的测试过程，满足如下条件的软件包会进测试仓库：

- 一切需要进入 *core* 仓库的软件包都需要先经过 *core-testing* 仓库
- 更新该软件包可能损坏系统，需要进行测试。
- 会影响到大量其它的软件包，例如 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=perl" class="external text" rel="nofollow">perl</a></span><sup><span class="small">包</span></sup></span> 或者 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=python" class="external text" rel="nofollow">python</a></span><sup><span class="small">包</span></sup></span>。

大的软件集合，如[GNOME](../zh-cn/GNOME.html "GNOME") 或 [KDE](../zh-cn/KDE.html "KDE") 更新时会更新大批软件包，也需要进行测试。

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**testing 库并不是“最新”软件包的仓库。它的目的是存放一些由于是\[core\]软件集合的一部分或者由于其它方面的问题，可能引起**系统崩溃**的软件包更新。我们**强烈建议**使用 testing 库的用户订阅<a href="https://lists.archlinux.org/mailman3/lists/arch-dev-public.lists.archlinux.org/" class="external text" rel="nofollow">arch-dev-public</a>邮件列表，监视<a href="https://bbs.archlinux.org/viewforum.php?id=49" class="external text" rel="nofollow">testing 仓库论坛</a>，并<a href="../zh-cn/Reporting_bug_guidelines.html" class="mw-redirect" title="Reporting bug guidelines">报告bug</a>。你也应该考虑加入<a href="../zh-cn/Arch_Testing_Team.html" class="mw-redirect" title="Arch Testing Team">Arch测试团队</a>

</div>

<div class="archwiki-template-box archwiki-template-box-warning">

**警告：**

- 谨慎启用 *core-testing* 仓库，其中的软件包可能损坏系统。只有有足够的经验且知道如何应对问题的用户才可以启用。
- 请同时启用 *core-testing* 仓库和 *extra-testing* 仓库。如果启用了下文的其他 *testing* 仓库，也需要启用 *core-testing* 和 *extra-testing* 仓库
- 由于并不是所有的主仓库软件包都在测试仓库中有相应的版本，core 和 extra 主仓库应该保留，并保证相应的测试仓库在主仓库的前面

</div>

<div class="mw-heading mw-heading3">

### core-testing

</div>

位于镜像的 `.../core-testing/os/` 目录。

*core-testing* 包含要进入 *core* 仓库的候选软件包。

core-testing 库是唯一可以与其它官方软件仓库有名称冲突的仓库。如果要启用，应该在 `pacman.conf` 文件里把它设置为第一个仓库。

<div class="mw-heading mw-heading3">

### extra-testing

</div>

*extra-testing*库的功能类似 *core-testing* ，不过是为 *extra* 库服务的测试仓库。

<div class="mw-heading mw-heading3">

### multilib-testing

</div>

*multilib-testing* 库的功能类似 *core-testing* ,不过是为 *multilib-testing* 库服务的测试仓库。

<div class="mw-heading mw-heading3">

### gnome-unstable

</div>

[GNOME](../zh-cn/GNOME.html "GNOME") 桌面环境的下一个稳定版本，在进入主 *extra-testing* 仓库前，会先放到 *gnome-unstable*.

要启用它，在 `/etc/pacman.conf` 中加入:

/etc/pacman.conf

\[gnome-unstable\]\
Include = /etc/pacman.d/mirrorlist

*gnome-unstable* 项需要在所有仓库的最上面（保证在 *core-testing* 上面），即：

/etc/pacman.conf

\[gnome-unstable\]\
\[core-testing\]\
\[core\]\
\[extra-testing\]\
\[extra\]

如果有软件包相关的问题，请在 <a href="https://bugs.archlinux.org/" class="external text" rel="nofollow">Arch bug tracker</a> 汇报，其它问题请<a href="https://gitlab.gnome.org" class="external text" rel="nofollow">上游的 GNOME Gitlab</a>汇报。

<div class="mw-heading mw-heading3">

### kde-unstable

</div>

包含 [KDE](../zh-cn/KDE.html "KDE") Plasma 和应用程序的 *beta* 或*候选发行版本*.

要启用它，将下面内容加入 `/etc/pacman.conf`:

/etc/pacman.conf

\[kde-unstable\]\
Include = /etc/pacman.d/mirrorlist

同样地，*kde-unstable* 项需要在所有仓库的最上面（保证在 *core-testing* 上面）。

请<a href="../zh-cn/Reporting_bug_guidelines.html" class="mw-redirect" title="Reporting bug guidelines">报告</a>遇到的问题。

<div class="mw-heading mw-heading3">

### <span id=".E7.A6.81.E7.94.A8.E6.B5.8B.E8.AF.95.E4.BB.93.E5.BA.93"></span>禁用测试仓库

</div>

如果要禁用之前启用的测试仓库，应该：

1.  从 `/etc/pacman.conf` 中删除(注释）掉配置
2.  执行 `pacman -Syuu` 将从这些仓库安装的软件还原到主仓库版本。

第二条为可选操作，如果在第一步后碰到任何问题，请先执行此操作。

<div class="mw-heading mw-heading2">

## staging repositories

</div>

<div class="archwiki-template-box archwiki-template-box-warning">

**警告：**不要因为任何原因启用 *staging* 仓库，因为你的系统一定会在更新后损坏。这个仓库仅为后端开发人员使用

</div>

该存储库包含损坏的包，并且在一次重建多个包时仅供开发人员使用。 例如，为了重建依赖于新共享库的包，必须首先构建共享库本身并将其上传到临时存储库，以便其他开发人员可以使用。 一旦所有依赖包都被重建，这组包就会被转移到测试或主存储库，以更合适的方式.

详情请见 <a href="https://lists.archlinux.org/archives/list/arch-dev-public@lists.archlinux.org/thread/7RNII5TUKV3BJPGGBYKB7DNUK3WI26GZ/" class="external text" rel="nofollow">staging 仓库发布通知</a>。

<div class="mw-heading mw-heading2">

## <span id=".E5.8E.86.E5.8F.B2.E8.83.8C.E6.99.AF"></span>历史背景

</div>

大部分仓库是因为历史原因分开的。原本，当这个发行版只有一小部分用户时，是只有一个软件仓库的，它就是现在的 **core** ──那时候它叫做 **official** 。这个仓库主要存放了Judd Vinet选定的应用程序，当然现在已经不是这样了：它被设计为只包含“每种类型”程序中的一个 ── 一个桌面环境、一个主浏览器等等。

后来有用户不满Judd的选择，由于<a href="../zh-cn/Arch_Build_System.html" class="mw-redirect" title="Arch Build System">ABS系统</a>使用简单，所以他们就用ABS来创建自己的软件包。这些软件包被放入一个名为**unofficial**的软件仓库，而这个仓库由除Judd以外的开发人员维护。最终，新仓库获得开发人员同样的支持，所以就不再使用 official 和 unofficial 这两个名称了。大约在0.5版本的时候，两个仓库更名为 **current** 和 **extra** 。

在2007.8.1版本发布之后， current 更名为 core ，以免让人误解它包含的内容。如今，这两个仓库在开发人员和社区眼中都是相同分量的。不过 core 还是有些不同的，主要区别在于安装光盘和发布的快照中的软件包都只在 core 当中。这个仓库可以实现一个完整的Linux系统，但并不一定是你想要的Linux系统。

在0.5或者0.6版本的时候，仓库里有大量的软件包没有开发者愿意去维护。于是一位开发人员（Xentac）创建了“受信用户仓库”（Trusted User Repositories），作为存放被信任的用户（TU）自行创建的软件包的仓库。**staging**仓库里的软件包可以被Arch Linux的开发人员选拔入官方仓库，不过除此之外，开发人员和受信用户或多或少还是有所不同的。

就这样过了一段时间，逐渐的受信用户对他们的软件仓库感到厌倦，而非受信用户又期望可以将自己的软件包与大家分享。这导致了<a href="../zh-cn/Arch_%E7%94%A8%E6%88%B7%E8%BD%AF%E4%BB%B6%E4%BB%93%E5%BA%93.html" class="mw-redirect" title="AUR">AUR</a>的出现。慢慢的TU们形成更为严密的组织，如今他们共同维护**community**软件仓库。TU是一个独立于Arch Linux开发人员之外的组织，两者并没太多交流。不过，热门的软件包仍然会偶尔从 community 选拔入 **extra** 。<a href="https://aur.archlinux.org/" class="external text" rel="nofollow">AUR</a>也允许非受信用户提交PKGBUILD给其他用户自愿使用。

在2006年，**core**仓库里未被正确编译的内核<a href="https://archlinux.org/news/please-avoid-kernel-261614-1/" class="external text" rel="nofollow">导致许多用户系统崩溃</a>。之后，“core仓库审核机制”引入：所有\[core\]仓库软件包更新前，必须先在一个叫做 **core-testing** 的仓库进行测试，必须在其他开发者或 <a href="../zh-cn/Arch_Testing_Team.html" class="mw-redirect" title="Arch Testing Team">Arch Testing Team</a> 成员同意后，软件包才能正式移入 core 。后来， core 中出现一些低使用率的软件，审核机制对它们有所宽松。

2009年末至2010年初，出现了一些新的文件系统，人们希望在安装系统时就使用它们（即纳入 core ）。鉴于 core 从来没有给出明确的界定（只是重要的包，由开发者亲自挑选的）它有了一个更为明确的定义。

2023 年，经过几年的准备工作，Arch 将<a href="https://lists.archlinux.org/archives/list/arch-dev-public@lists.archlinux.org/thread/SHCCCKHLIWPXPOIR5ARNJKSVWL2SSUO7/" class="external text" rel="nofollow">后端服务迁移到了 git</a>，并同时启用了新的仓库布局。在新的布局中，*extra* 包含了之前 *community* 仓库的软件包，testing 仓库分成了 *core-testing* 和 *extra-testing*, *community-testing* 被删除。 <a href="../zh-cn/Trusted_Users.html" class="mw-redirect" title="Trusted Users">Trusted Users</a> 也有了推送软件包到 *extra* 的权限。

</div>
