<div class="mw-content-ltr mw-parser-output" lang="zh-Hans-CN" dir="ltr">

<div class="aside archwiki-template-box archwiki-template-box-note noexcerpt">

**翻译状态：**

- 本文（或部分内容）译自 <a href="https://wiki.archlinux.org/title/Arch_User_Repository" class="extiw" title="arch:Arch User Repository">Arch User Repository</a>，最近一次同步于 2026-06-25，若英文版本有所<a href="https://wiki.archlinux.org/title/Arch_User_Repository?diff=0&amp;oldid=879441" class="external text" rel="nofollow">更改</a>，则您可以帮助同步与[翻译](../zh-cn/Help:%E7%BF%BB%E8%AF%91.html "Help:翻译")更改的内容。
- 您可以在 <a href="https://wiki.archlinux.org/title/Arch_User_Repository_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)?action=history" class="external text" rel="nofollow">ArchWiki 的对应页面</a>找到本文翻译的**原始**修订历史。
- 本文可能与英文原文存在出入。

</div>

<div class="archwiki-template-meta-related-articles-start">

相关文章

- [AUR 扫除日](../zh-cn/AUR_%E6%89%AB%E9%99%A4%E6%97%A5.html "AUR 扫除日")
- [AUR 助手](../zh-cn/AUR_%E5%8A%A9%E6%89%8B.html "AUR 助手")
- [AUR 提交准则](../zh-cn/AUR_%E6%8F%90%E4%BA%A4%E5%87%86%E5%88%99.html "AUR 提交准则")
- <a href="/wzh/index.php?title=Aurweb_RPC_%E7%95%8C%E9%9D%A2&amp;action=edit&amp;redlink=1" class="new" title="Aurweb RPC 界面（页面不存在）">Aurweb RPC 界面</a>
- [创建软件包](../zh-cn/%E5%88%9B%E5%BB%BA%E8%BD%AF%E4%BB%B6%E5%8C%85.html "创建软件包")
- [官方仓库](../zh-cn/%E5%AE%98%E6%96%B9%E4%BB%93%E5%BA%93.html "官方仓库")
- [软件包维护者指导原则](../zh-cn/%E8%BD%AF%E4%BB%B6%E5%8C%85%E7%BB%B4%E6%8A%A4%E8%80%85%E6%8C%87%E5%AF%BC%E5%8E%9F%E5%88%99.html "软件包维护者指导原则")
- [非官方用户仓库](../zh-cn/%E9%9D%9E%E5%AE%98%E6%96%B9%E7%94%A8%E6%88%B7%E4%BB%93%E5%BA%93.html "非官方用户仓库")
- [.SRCINFO](../zh-cn/.SRCINFO.html ".SRCINFO")

</div>

<a href="https://aur.archlinux.org" class="external text" rel="nofollow"><em>Arch 用户软件仓库</em></a>（Arch User Repository，AUR）是为 [Arch Linux](../zh-cn/Arch_Linux.html "Arch Linux") 用户而建，由社区主导的软件仓库。AUR 中的软件包以软件包描述文件（[PKGBUILD](../zh-cn/PKGBUILD.html "PKGBUILD")）的形式提供，用户自己通过 [makepkg](../zh-cn/Makepkg.html "Makepkg") 生成包，再由 [pacman](../zh-cn/Pacman.html#%E5%85%B6%E5%AE%83%E5%91%BD%E4%BB%A4 "Pacman") 安装。创建 AUR 的初衷是供社区管理和分享新的软件包，并由官方定期从中挑选软件包进入 <a href="../zh-cn/%E5%AE%98%E6%96%B9%E4%BB%93%E5%BA%93.html" class="mw-redirect" title="Extra">extra</a> 仓库。本文介绍用户访问和使用 AUR 的方法。

许多官方仓库软件包都来自 AUR。通过 AUR，大家可以相互分享新的软件包生成脚本（[PKGBUILD](../zh-cn/PKGBUILD.html "PKGBUILD") 和其他相关文件）。用户还可以为软件包[投票](#%E7%BB%99%E8%BD%AF%E4%BB%B6%E5%8C%85%E6%8A%95%E7%A5%A8)。如果一个软件包投票足够多，没有许可证问题且打包质量好，那么它就很有希望被收录进官方 *extra* 仓库（以后就可以直接通过 [pacman](../zh-cn/Pacman.html "Pacman") 或 [Arch 构建系统](../zh-cn/Arch_%E6%9E%84%E5%BB%BA%E7%B3%BB%E7%BB%9F.html "Arch 构建系统")安装了）。

<div class="archwiki-template-box archwiki-template-box-warning">

**警告：**AUR 中的软件包是由其他用户编写的，这些 `PKGBUILD` 完全是非官方的，未经彻底审查。使用这些文件的风险由您自行承担。

</div>

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**如果你计划要使用 AUR 仓库，**强烈建议**关注 <a href="https://lists.archlinux.org/mailman3/lists/aur-general.lists.archlinux.org/" class="external text" rel="nofollow">AUR 常规邮件列表</a>，该列表被用于发布安全警告。<a href="https://lists.archlinux.org/archives/list/aur-general@lists.archlinux.org/thread/FFCMZGL4UQODYKZGUY7KTN3UBF3XN66P/" class="external autonumber" rel="nofollow">[1]</a> <a href="https://lists.archlinux.org/archives/list/aur-general@lists.archlinux.org/thread/7EZTJXLIAQLARQNTMEW2HBWZYE626IFJ/" class="external autonumber" rel="nofollow">[2]</a> <a href="https://lists.archlinux.org/archives/list/aur-general@lists.archlinux.org/thread/FGXPCB3ZVCJIV7FX323SBAX2JHYB7ZS4/" class="external autonumber" rel="nofollow">[3]</a> <a href="https://archlinux.org/news/active-aur-malicious-packages-incident/" class="external autonumber" rel="nofollow">[4]</a>

</div>

<div class="mw-heading mw-heading2">

## <span id=".E5.85.A5.E9.97.A8"></span>入门

</div>

用户可以从 <a href="https://aur.archlinux.org" class="external text" rel="nofollow">AUR 网站</a>下载 `PKGBUILD` 文件。这些 `PKGBUILD` 可以通过 *makepkg* 生成软件包，最后由 *pacman* 进行安装。

- 确保已经<a href="../zh-cn/Help:%E9%98%85%E8%AF%BB.html#%E5%AE%89%E8%A3%85%E8%BD%AF%E4%BB%B6%E5%8C%85" class="mw-redirect" title="安装">安装</a>了 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=base-devel" class="external text" rel="nofollow">base-devel</a></span><sup><span class="small">包</span></sup></span>。
- 浏览 [\#常见问题](#%E5%B8%B8%E8%A7%81%E9%97%AE%E9%A2%98)一节，以获得对最常见问题的解答。
- 在从 AUR 构建软件包之前，您可能希望调整 `/etc/makepkg.conf` 以优化系统的构建过程。通过调整 `MAKEFLAGS` 变量、使用多核进行压缩或使用不同的压缩算法，可以在多核处理器的系统上显著缩短包构建时间。用户还可以通过 `CFLAGS` 变量启用特定于硬件的编译器优化。详情参见 [makepkg](../zh-cn/Makepkg.html#%E4%BC%98%E5%8C%96 "Makepkg")。

如果您设置了 [AUR SSH 身份验证](../zh-cn/AUR_%E6%8F%90%E4%BA%A4%E5%87%86%E5%88%99.html#%E8%AE%A4%E8%AF%81 "AUR 提交准则")，也可以通过 SSH 连接到 AUR：运行 `ssh aur@aur.archlinux.org help` 以获得可用指令的列表。

<div class="mw-heading mw-heading2">

## <span id=".E5.AE.89.E8.A3.85.E4.B8.8E.E6.9B.B4.E6.96.B0.E8.BD.AF.E4.BB.B6.E5.8C.85"></span>安装与更新软件包

</div>

从 AUR 安装软件包并不困难。基本步骤如下：

1.  [\#获取构建文件](#%E8%8E%B7%E5%8F%96%E6%9E%84%E5%BB%BA%E6%96%87%E4%BB%B6)，包括 `PKGBUILD` 和所需的其他文件，比如 [systemd](../zh-cn/Systemd.html "Systemd") 单元文件和补丁（往往并非软件包的实际代码）。
2.  [\#检验 PKGBUILD](#%E6%A3%80%E9%AA%8C_PKGBUILD)；最重要！检验 `PKGBUILD` 及相关文件，确保其可信、无恶意。
3.  [\#构建软件包](#%E6%9E%84%E5%BB%BA%E8%BD%AF%E4%BB%B6%E5%8C%85)：在保存文件的目录下运行 `makepkg`。这将下载代码，编译并打包。
4.  [\#安装软件包](#%E5%AE%89%E8%A3%85%E8%BD%AF%E4%BB%B6%E5%8C%85)：执行 `pacman -U `*`package_file`* 将软件包安装到系统上。

首先，确保<a href="../zh-cn/Help:%E9%98%85%E8%AF%BB.html#%E5%AE%89%E8%A3%85%E8%BD%AF%E4%BB%B6%E5%8C%85" class="mw-redirect" title="安装">安装</a>了 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=base-devel" class="external text" rel="nofollow">base-devel</a></span><sup><span class="small">包</span></sup></span>，该<a href="../zh-cn/%E5%85%83%E8%BD%AF%E4%BB%B6%E5%8C%85%E5%92%8C%E8%BD%AF%E4%BB%B6%E5%8C%85%E7%BB%84.html" class="mw-redirect" title="元软件包">元软件包</a>提供了 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=make" class="external text" rel="nofollow">make</a></span><sup><span class="small">包</span></sup></span> 等用于从源码进行编译的工具：

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**AUR 中的软件包会假定构建环境里已安装了 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=base-devel" class="external text" rel="nofollow">base-devel</a></span><sup><span class="small">包</span></sup></span>。

</div>

然后，选择一个合适的构建目录。该目录仅用作生成软件包或从源码构建时的工作目录，因此任何空白目录都可以。下面的示例中使用 `~/builds` 作为编译目录。

<div class="mw-heading mw-heading3">

### <span id=".E8.8E.B7.E5.8F.96.E6.9E.84.E5.BB.BA.E6.96.87.E4.BB.B6"></span>获取构建文件

</div>

通过在 <a href="https://aur.archlinux.org/" class="external text" rel="nofollow">AUR 主页</a>中搜索，找到要安装的软件包。点击搜索结果中的软件名称，进入软件包信息页。阅读描述并确认是否为目标软件，并检查软件的更新时间和评论。

确认无误后，有几种方法可以获取包的构建文件：

- 克隆其 [git](../zh-cn/Git.html "Git") 存储库，在其 AUR 页面的“包详细信息”中标记为“Git Clone URL”。这是首选方法，其优点是您可以通过 `git pull` 轻松获取包的更新。

\$ git clone https://aur.archlinux.org/*package_name*.git

- 通过单击其 AUR 页面右侧“Package Actions”下的“Download snapshot”链接或在终端中下载快照：

\$ curl -L -O https://aur.archlinux.org/cgit/aur.git/snapshot/*package_name*.tar.gz

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**快照文件是压缩的，必须解压（最好在为 AUR 构建预留的目录中）：`tar -xvf `*`package_name`*`.tar.gz`

</div>

- 使用 <a href="https://github.com/archlinux/aur" class="external text" rel="nofollow">GitHub 上的 archlinux/aur</a> 只读镜像，每个包都位于一个分支中。建议只克隆一个分支（整个存储库太大，速度会很慢）。您可以使用以下两种方法之一执行此操作：
  - 使用 `git clone --single-branch`：
    \$ git clone --branch *package_name* --single-branch https://github.com/archlinux/aur.git
  - [部分克隆](../zh-cn/Git.html#%E9%83%A8%E5%88%86%E6%8E%A5%E6%94%B6 "Git")这个仓库 (`git clone --depth=1`) 和选择性[添加分支](../zh-cn/Git.html#%E8%8E%B7%E5%8F%96%E5%85%B6%E4%BB%96%E5%88%86%E6%94%AF "Git")：

\$ git clone --depth=1 https://github.com/archlinux/aur.git; cd aur\
\$ git remote set-branches --add origin *package_name*\
\$ git fetch\
\$ git switch *package_name*

<div class="mw-heading mw-heading3">

### <span id=".E6.A3.80.E9.AA.8C_PKGBUILD"></span>检验 PKGBUILD

</div>

切换到含有软件包的 `PKGBUILD` 文件的目录：

\$ cd *package_name*\

<div class="archwiki-template-box archwiki-template-box-warning">

**警告：**请仔细检查 git 代码库中的 `PKGBUILD`、所有 *.install* 文件以及其它文件，确认是否带有恶意或危险命令。如有任何怀疑，请不要构建软件包，并到论坛或邮件列表中[寻求帮助](../zh-cn/%E5%B8%B8%E8%A7%84%E6%95%85%E9%9A%9C%E6%8E%92%E9%99%A4.html#%E9%A2%9D%E5%A4%96%E6%94%AF%E6%8F%B4 "常规故障排除")。过去已经发现数例含恶意代码的软件包。<a href="https://lists.archlinux.org/archives/list/aur-general@lists.archlinux.org/thread/FFCMZGL4UQODYKZGUY7KTN3UBF3XN66P/" class="external autonumber" rel="nofollow">[5]</a> <a href="https://lists.archlinux.org/archives/list/aur-general@lists.archlinux.org/thread/7EZTJXLIAQLARQNTMEW2HBWZYE626IFJ/" class="external autonumber" rel="nofollow">[6]</a> <a href="https://archlinux.org/news/active-aur-malicious-packages-incident/" class="external autonumber" rel="nofollow">[7]</a> <a href="https://lists.archlinux.org/archives/list/aur-general@lists.archlinux.org/thread/FGXPCB3ZVCJIV7FX323SBAX2JHYB7ZS4/" class="external autonumber" rel="nofollow">[8]</a> 一些工具，比如 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://aur.archlinux.org/packages/traur/" class="external text" rel="nofollow">traur</a></span><sup><span class="small">AUR</span></sup></span> 和 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://aur.archlinux.org/packages/ks-aur-scanner/" class="external text" rel="nofollow">ks-aur-scanner</a></span><sup><span class="small">AUR</span></sup></span>，可辅助用户扫描 PKGBUILD 内容；但它们不能取代细致的手动检验。

</div>

查看所有提供的文件中的内容。例如使用 *less* 查看 `PKGBUILD`：

\$ less PKGBUILD\

检查 `PKGBUILD` 源码列中是否存在签名文件（*.sig* 或 *.asc*）。若是，则获取 PKGBUILD 列出的 [validpgpkeys](../zh-cn/PKGBUILD.html#validpgpkeys "PKGBUILD") 公钥之一。更多信息参见 [makepkg#验证签名](../zh-cn/Makepkg.html#%E9%AA%8C%E8%AF%81%E7%AD%BE%E5%90%8D "Makepkg")。

无论什么情况下，必须牢记恶意代码也可能被签名，因此必须仔细检查 `PKGBUILD`，尤其是可能从仓库之外获取软件代码的部分。

<div class="archwiki-template-box archwiki-template-box-tip">

**提示：**如果您正在更新软件包，您可能需要查看最后一次提交以来的变动。

- 您可以使用 `git show` 来查看最后一次提交之后的变动。
- 您也可以使用 *vimdiff*：`git difftool @~..@ --tool=vimdiff`。使用 *vimdiff* 的好处是可以查看到所有文件，以及对出现变更部分的提示。

</div>

<div class="mw-heading mw-heading3">

### <span id=".E6.9E.84.E5.BB.BA.E8.BD.AF.E4.BB.B6.E5.8C.85"></span>构建软件包

</div>

手动检查文件后，以普通用户权限执行 [makepkg](../zh-cn/Makepkg.html "Makepkg") ，下面是一些有用的参数：

- `-s`/`--syncdeps` 会在构建之前使用 [pacman](../zh-cn/Pacman.html "Pacman") 自动解析和安装任何依赖项。如果包依赖于其他 AUR 包，则您应先手动安装它们。
- `-i`/`--install` 会在构建成功后安装软件包。这使您可以跳过通常需手动完成的下一步。
- `-r`/`--rmdeps` 会在构建后删除不需要的构建时依赖项。但是，下次更新包时可能需要重新安装这些依赖项。
- `-c`/`--clean` 会在构建后清理临时构建文件，因为它们不再需要。这些文件通常仅在调试构建过程时才需要。

<div class="archwiki-template-box archwiki-template-box-tip">

**提示：**使用 ` git clean -dfx` 可以删除所有不被 git 跟踪的文件，从而删除所有以前构建的包文件。

</div>

<div class="mw-heading mw-heading3">

### <span id=".E5.AE.89.E8.A3.85.E8.BD.AF.E4.BB.B6.E5.8C.85"></span>安装软件包

</div>

现在可以使用 pacman 安装该软件包：

\# pacman -U *package_name*-*version*-*architecture*.pkg.tar.zst\

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**

- 如果您在 `makepkg.conf` 中更改了 `PKGEXT`，则包文件的名称可能会略有不同。
- 以上示例只是对构建过程的简要总结。**特别**推荐阅读 [makepkg](../zh-cn/Makepkg.html "Makepkg") 和 [Arch 构建系统](../zh-cn/Arch_%E6%9E%84%E5%BB%BA%E7%B3%BB%E7%BB%9F.html "Arch 构建系统")文章以了解更多详情。

</div>

<div class="archwiki-template-box archwiki-template-box-tip">

**提示：**在不进行构建的情况下，您可以用 `makepkg --packagelist` 来获取生成的软件包文件名列表。

</div>

<div class="mw-heading mw-heading3">

### <span id=".E5.8D.87.E7.BA.A7.E8.BD.AF.E4.BB.B6.E5.8C.85"></span>升级软件包

</div>

在包含包的 `PKGBUILD` 的目录中，您必须首先使用命令更新文件：

\$ git pull\

然后按照之前的构建和安装说明进行操作。

<div class="mw-heading mw-heading3">

### <span id=".E6.9B.B4.E6.96.B0.E8.BD.AF.E4.BB.B6.E5.8C.85"></span>更新软件包

</div>

Pacman 不支持 AUR，因此更新您安装的所有包是*您的职责*，而不是 pacman 的。如果官方仓库中的包更新了，您需要重新构建依赖于那些库的 AUR 包。`checkrebuild` 和 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=rebuild-detector" class="external text" rel="nofollow">rebuild-detector</a></span><sup><span class="small">包</span></sup></span> 提供的 `rebuild-detector` [钩子](../zh-cn/Pacman.html#%E9%92%A9%E5%AD%90 "Pacman")可用于查找需重新构建的软件包。

<div class="mw-heading mw-heading2">

## <span id=".E8.B4.A6.E6.88.B7.E7.8A.B6.E6.80.81"></span>账户状态

</div>

<div class="mw-heading mw-heading3">

### <span id=".E5.B0.81.E7.A6.81.EF.BC.88Suspension.EF.BC.89"></span>封禁（Suspension）

</div>

作为[软件包维护者](../zh-cn/%E8%BD%AF%E4%BB%B6%E5%8C%85%E7%BB%B4%E6%8A%A4%E8%80%85.html "软件包维护者")时，可以对用户配置“封禁”字段，从而挂起目标用户。**当用户被封禁时，他们不能：**

- 登录 <a href="https://aur.archlinux.org" class="external free" rel="nofollow">https://aur.archlinux.org</a>
- 接收通知
- 与 git 界面交互

<div class="mw-heading mw-heading3">

### <span id=".E9.9D.9E.E6.B4.BB.E5.8A.A8.EF.BC.88Inactivity.EF.BC.89"></span>非活动（Inactivity）

</div>

当编辑自己的账户或作为*软件包维护者*编辑其他用户的账户时，可以设置“非活动”字段。使用非活动账户有两个原因：

- 在其账户页面上显示某人被标记为非活动的日期
- 根据他们对新提案的不活动情况，生成当前的活跃*软件包维护者*计数

<div class="mw-heading mw-heading2">

## <span id=".E5.8F.8D.E9.A6.88"></span>反馈

</div>

<div class="mw-heading mw-heading3">

### <span id=".E5.9C.A8.E8.BD.AF.E4.BB.B6.E5.8C.85.E4.B8.8A.E6.B7.BB.E5.8A.A0.E8.AF.84.E8.AE.BA"></span>在软件包上添加评论

</div>

<a href="https://aur.archlinux.org" class="external text" rel="nofollow">AUR 网页界面</a>中有一个评论工具，允许用户就改进提出建议和反馈给 `PKGBUILD` 贡献者。

<div class="archwiki-template-box archwiki-template-box-tip">

**提示：**避免将补丁或 `PKGBUILD` 粘贴到评论部分：它们很快就会过时，最终会不必要地占用大量空间。请将这些文件通过电子邮件发送给维护者，甚至可以使用 <a href="../zh-cn/%E5%BA%94%E7%94%A8%E7%A8%8B%E5%BA%8F%E5%88%97%E8%A1%A8.html#Pastebin_%E6%9C%8D%E5%8A%A1" class="mw-redirect" title="Pastebin">pastebin</a>。

</div>

<a href="https://python-markdown.github.io/" class="external text" rel="nofollow">Python-Markdown</a> 提供了基本的 <a href="https://en.wikipedia.org/wiki/Markdown" class="extiw" title="wikipedia:Markdown">Markdown</a> 语法来格式化评论。

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**

- 此实现与官方<a href="https://daringfireball.net/projects/markdown/syntax" class="external text" rel="nofollow">语法规则</a>或许会有一些<a href="https://python-markdown.github.io/#differences" class="external text" rel="nofollow">差异</a>。
- 对软件包 [Git](../zh-cn/Git.html "Git") 存储库的提交哈希值，以及对 [Flyspray](../zh-cn/Flyspray.html "Flyspray") 工单的引用会被自动转换为链接。
- 长评论默认折叠，可按需展开。

</div>

<div class="mw-heading mw-heading3">

### <span id=".E7.BB.99.E8.BD.AF.E4.BB.B6.E5.8C.85.E6.8A.95.E7.A5.A8"></span>给软件包投票

</div>

**所有的** Arch 用户都可以通过 AUR 界面为喜欢的软件包**投票**。所有软件包都有机会被包维护者接手，并收录至 <a href="../zh-cn/%E5%AE%98%E6%96%B9%E4%BB%93%E5%BA%93.html" class="mw-redirect" title="Extra">extra</a> 仓库。投票数是该选拔过程的重要依据之一，因此请尽可能地投票！

注册 <a href="https://aur.archlinux.org/" class="external text" rel="nofollow">AUR 网站</a>账户，在浏览软件包时会看到投票选项。注册后，还可以通过 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://aur.archlinux.org/packages/aur-auto-vote-git/" class="external text" rel="nofollow">aur-auto-vote-git</a></span><sup><span class="small">AUR</span></sup></span> 在命令行中投票。

此外，如果你设置了 [AUR SSH 身份认证](../zh-cn/AUR_%E6%8F%90%E4%BA%A4%E5%87%86%E5%88%99.html#%E8%AE%A4%E8%AF%81 "AUR 提交准则")，可以使用 ssh 密钥直接通过命令行投票，不再需要保存或者输入 AUR 密码：

\$ ssh aur@aur.archlinux.org vote *package_name*\

<div class="mw-heading mw-heading3">

### <span id=".E5.B0.86.E8.BD.AF.E4.BB.B6.E5.8C.85.E6.A0.87.E8.AE.B0.E4.B8.BA.E8.BF.87.E6.9C.9F"></span>将软件包标记为过期

</div>

首先，点击软件包页面的“Flag Out-of-date”（中文版为“标记为过期”），并说明过期的原因，最好包含新版本的发布说明或 [tarball](../zh-cn/%E5%BD%92%E6%A1%A3%E4%B8%8E%E5%8E%8B%E7%BC%A9.html#%E4%BB%85%E5%BD%92%E6%A1%A3 "归档与压缩") 的链接。

可以通过邮件通知维护人员。如果*两周*后还是没有得到答复，可以发出*遗弃*（orphan）请求。更多信息请参考 [AUR 提交准则#请求](../zh-cn/AUR_%E6%8F%90%E4%BA%A4%E5%87%86%E5%88%99.html#%E8%AF%B7%E6%B1%82 "AUR 提交准则")。

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**[VCS 软件包](../zh-cn/VCS_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "VCS 软件打包准则") 在 `pkgver` 变化时并不会过时，所以不要标记它们，且维护者也只会取消标记并无视请求。AUR 维护者不应该仅为升高 `pkgver` 就进行提交。

</div>

<div class="mw-heading mw-heading2">

## <span id=".E8.B0.83.E8.AF.95.E5.8C.85.E6.9E.84.E5.BB.BA.E8.BF.87.E7.A8.8B"></span>调试包构建过程

</div>

1.  在构建任何东西之前，通过[更新](../zh-cn/Pacman.html#%E5%8D%87%E7%BA%A7%E8%BD%AF%E4%BB%B6%E5%8C%85 "Pacman")确保您的构建环境是最新的。
2.  确保您已安装 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=base-devel" class="external text" rel="nofollow">base-devel</a></span><sup><span class="small">包</span></sup></span>。
3.  对 `makepkg` 搭配使用 `-s` 选项，以在开始构建过程之前检查并安装所有依赖项。
4.  试试默认的 <a href="https://gitlab.archlinux.org/archlinux/packaging/packages/pacman/-/blob/main/makepkg.conf" class="external text" rel="nofollow">makepkg 配置</a>。
5.  常见问题请参阅 [Makepkg#问题处理](../zh-cn/Makepkg.html#%E9%97%AE%E9%A2%98%E5%A4%84%E7%90%86 "Makepkg")。

如果您在构建包时遇到问题，请先阅读其 `PKGBUILD` 及其 AUR 页面上的评论。

可能 `PKGBUILD` 本身就有配置问题。如果您无法自行解决，请将其报告给维护者（例如，通过[在 AUR 页面的评论中发布您遇到的错误](#%E5%9C%A8%E8%BD%AF%E4%BB%B6%E5%8C%85%E4%B8%8A%E6%B7%BB%E5%8A%A0%E8%AF%84%E8%AE%BA)）。您也可以在 <a href="https://bbs.archlinux.org/viewforum.php?id=38" class="external text" rel="nofollow">AUR 问题、讨论和 PKGBUILD 请求论坛</a>寻求帮助。

问题原因可能并不简单，可能会涉及自定义到 `CFLAGS`、`LDFLAGS` 和 `MAKEFLAGS`。为排除由您的特定系统配置引起的问题，请在[干净的 chroot](../zh-cn/%E5%88%9B%E5%BB%BA%E4%B8%80%E4%B8%AA%E5%B9%B2%E5%87%80%E7%9A%84_chroot.html "创建一个干净的 chroot") 中构建包。如果在干净的 chroot 下构建仍然失败，则问题很可能出在 `PKGBUILD`。

请参阅[创建软件包#检查包的逻辑性](../zh-cn/%E5%88%9B%E5%BB%BA%E8%BD%AF%E4%BB%B6%E5%8C%85.html#%E6%A3%80%E6%9F%A5%E5%8C%85%E7%9A%84%E9%80%BB%E8%BE%91%E6%80%A7 "创建软件包")以获得关于使用 [namcap](../zh-cn/Namcap.html "Namcap") 的信息。如果您希望审核 `PKGBUILD`，请将其发布到 <a href="https://lists.archlinux.org/mailman3/lists/aur-general.lists.archlinux.org/" class="external text" rel="nofollow">aur-general 邮件列表</a>以获得[软件包维护者](../zh-cn/%E8%BD%AF%E4%BB%B6%E5%8C%85%E7%BB%B4%E6%8A%A4%E8%80%85.html "软件包维护者")和其他 AUR 成员的反馈，或发布到<a href="https://bbs.archlinux.org/viewforum.php?id=4" class="external text" rel="nofollow">创建和修改包论坛</a>。您还可以在 <a href="https://libera.chat" class="external text" rel="nofollow">Libera Chat</a> 上的 <a href="ircs://irc.libera.chat/archlinux-aur" class="external text" rel="nofollow">#archlinux-aur</a> [IRC 频道](../zh-cn/Arch_%E7%9A%84_IRC_%E9%A2%91%E9%81%93.html "Arch 的 IRC 频道")中寻求帮助。

<div class="mw-heading mw-heading2">

## <span id=".E6.8F.90.E4.BA.A4"></span>提交

</div>

用户可以使用 AUR 分享 `PKGBUILD`。参见 [AUR 提交准则](../zh-cn/AUR_%E6%8F%90%E4%BA%A4%E5%87%86%E5%88%99.html "AUR 提交准则")以获得更多细节。

<div class="mw-heading mw-heading2">

## <span id="Web_.E6.8E.A5.E5.8F.A3.E7.BF.BB.E8.AF.91"></span>Web 接口翻译

</div>

参阅 AUR 源码中的 <a href="https://gitlab.archlinux.org/archlinux/aurweb/-/blob/master/doc/i18n.md" class="external text" rel="nofollow">i18n.md</a> 获得关于创建和维护 <a href="https://aur.archlinux.org" class="external text" rel="nofollow">AUR Web 界面</a>翻译的详细信息。

<div class="mw-heading mw-heading2">

## <span id=".E5.8E.86.E5.8F.B2"></span>历史

</div>

最初，人们仅将 `PKGBUILD`、所需的补充文件和构建好的包上传到 `ftp://ftp.archlinux.org/incoming` 服务器。包及相关文件会暂存在此，直至一位“受信用户”（现已更名为[软件包维护者](../zh-cn/%E8%BD%AF%E4%BB%B6%E5%8C%85%E7%BB%B4%E6%8A%A4%E8%80%85.html "软件包维护者")）看到这个程序并接管维护。

然后，受信用户仓库诞生了。社区中，特定的个人被授权托管他们自己的仓库，以供他人使用。在更灵活、更易用的目标下，AUR 在这个基础上扩展壮大。事实上，AUR 维护者曾一直被称作受信用户（Trusted user，TU），直到更名为软件包维护者。

在 2015 年 6 月 8 日到 8 月 8 日期间，AUR 从 3.5.1 版本迭代到 4.0.0，引入了通过 Git 仓库发布 `PKGBUILD` 的功能。 已存在的包会被丢弃，除非维护者手动地将它们移植到新的基础架构上。

<div class="mw-heading mw-heading3">

### <span id="AUR3_.E5.8C.85.E7.9A.84_Git_.E4.BB.93.E5.BA.93"></span>AUR3 包的 Git 仓库

</div>

Github 上的 <a href="https://github.com/aur-archive" class="external text" rel="nofollow">AUR 存档</a>中有一个包含移植时 AUR 3 的所有包的仓库。

或者，采用等价的 <a href="https://github.com/felixonmars/aur3-mirror/" class="external text" rel="nofollow">aur-mirror</a> 仓库。

<div class="mw-heading mw-heading2">

## <span id=".E5.B8.B8.E8.A7.81.E9.97.AE.E9.A2.98"></span>常见问题

</div>

<div class="mw-heading mw-heading3">

### <span id=".E4.BB.80.E4.B9.88.E6.A0.B7.E7.9A.84.E8.BD.AF.E4.BB.B6.E5.8C.85.E8.83.BD.E8.A2.AB.E6.94.BE.E5.88.B0_AUR.EF.BC.9F"></span>什么样的软件包能被放到 AUR？

</div>

AUR 中的软件包仅是编译脚本，即为 [pacman](../zh-cn/Pacman.html "Pacman") 构建二进制文件的蓝图。只要你遵循了打包内容的许可条例，基本上符合[规则](../zh-cn/AUR_%E6%8F%90%E4%BA%A4%E5%87%86%E5%88%99.html#%E6%8F%90%E4%BA%A4%E8%BD%AF%E4%BB%B6%E5%8C%85%E7%9A%84%E8%A7%84%E5%88%99 "AUR 提交准则")的软件包都可以提交。有时候，下载的链接具有 "you may not link" 条款（即不可分发），这时就不能提供下载链接，而是要用程序名称代替，用户需要用其它方式提前获取受限制的源代码。有疑问请及时询问。

<div class="mw-heading mw-heading3">

### <span id=".E6.80.8E.E4.B9.88.E5.8F.AF.E4.BB.A5.E4.B8.BA_AUR_.E4.B8.AD.E7.9A.84.E5.8C.85.E6.8A.95.E7.A5.A8.EF.BC.9F"></span>怎么可以为 AUR 中的包投票？

</div>

见 [\#给软件包投票](#%E7%BB%99%E8%BD%AF%E4%BB%B6%E5%8C%85%E6%8A%95%E7%A5%A8)。

<div class="mw-heading mw-heading3">

### <span id=".E8.BD.AF.E4.BB.B6.E5.8C.85.E7.BB.B4.E6.8A.A4.E8.80.85.E6.98.AF.E4.BB.80.E4.B9.88.EF.BC.9F"></span>软件包维护者是什么？

</div>

参见 [Arch 术语#软件包维护者](../zh-cn/Arch_%E6%9C%AF%E8%AF%AD.html#%E8%BD%AF%E4%BB%B6%E5%8C%85%E7%BB%B4%E6%8A%A4%E8%80%85 "Arch 术语")。

<div class="mw-heading mw-heading3">

### <span id="Arch_User_Repository_.E5.92.8C_extra_.E4.BB.93.E5.BA.93.E6.9C.89.E4.BD.95.E5.8C.BA.E5.88.AB.EF.BC.9F"></span>Arch User Repository 和 extra 仓库有何区别？

</div>

Arch User Repository 是储存所有用户提交的 `PKGBUILD` 的地方，软件包需通过 [makepkg](../zh-cn/Makepkg.html "Makepkg") 手动生成。吸引足够多的社区关注及有软件包维护者支持的 `PKGBUILD` 会被收录进 <a href="../zh-cn/%E5%AE%98%E6%96%B9%E4%BB%93%E5%BA%93.html" class="mw-redirect" title="Extra">extra</a> 仓库（由软件包维护者维护），以二进制软件包形式提供，可以由 [pacman](../zh-cn/Pacman.html "Pacman") 安装。

<div class="mw-heading mw-heading3">

### <span id="AUR_.E4.B8.AD.E7.9A.84.E8.BD.AF.E4.BB.B6.E5.8C.85.E8.BF.87.E6.9C.9F.E4.BA.86.EF.BC.8C.E6.88.91.E8.AF.A5.E6.80.8E.E4.B9.88.E5.81.9A.EF.BC.9F"></span>AUR 中的软件包过期了，我该怎么做？

</div>

参见 [\#将软件包标记为过期](#%E5%B0%86%E8%BD%AF%E4%BB%B6%E5%8C%85%E6%A0%87%E8%AE%B0%E4%B8%BA%E8%BF%87%E6%9C%9F)。

同时，你可以在本地编辑 `PKGBUILD` 来自行更新软件包。有时更新不需要修改构建流程，只用按需更新 `pkgver` 或 `source` 数组即可。

<div class="mw-heading mw-heading3">

### <span id="-.7B.7D-makepkg_.E6.97.A0.E6.B3.95.E6.9E.84.E5.BB.BA.E6.9F.90.E4.B8.AA.E8.BD.AF.E4.BB.B6.E5.8C.85.EF.BC.8C.E6.88.91.E8.AF.A5.E6.80.8E.E4.B9.88.E5.8A.9E.EF.BC.9F"></span>`makepkg` 无法构建某个软件包，我该怎么办？

</div>

您很可能忘了点啥，参见 [\#调试包构建过程](#%E8%B0%83%E8%AF%95%E5%8C%85%E6%9E%84%E5%BB%BA%E8%BF%87%E7%A8%8B)。

<div class="mw-heading mw-heading3">

### <span id="ERROR:_One_or_more_PGP_signatures_could_not_be_verified.21_.E6.88.91.E8.AF.A5.E6.80.8E.E4.B9.88.E5.8A.9E.EF.BC.9F"></span>ERROR: One or more PGP signatures could not be verified! 我该怎么办？

</div>

最有可能的情况是您没有所需的公钥来验证下载的文件。详情参见 [Makepkg#验证签名](../zh-cn/Makepkg.html#%E9%AA%8C%E8%AF%81%E7%AD%BE%E5%90%8D "Makepkg")。

<div class="mw-heading mw-heading3">

### <span id=".E5.A6.82.E4.BD.95.E7.BC.96.E5.86.99_PKGBUILD.EF.BC.9F"></span>如何编写 PKGBUILD？

</div>

查阅 [AUR 提交准则#提交软件包的规则](../zh-cn/AUR_%E6%8F%90%E4%BA%A4%E5%87%86%E5%88%99.html#%E6%8F%90%E4%BA%A4%E8%BD%AF%E4%BB%B6%E5%8C%85%E7%9A%84%E8%A7%84%E5%88%99 "AUR 提交准则") 和 [创建软件包](../zh-cn/%E5%88%9B%E5%BB%BA%E8%BD%AF%E4%BB%B6%E5%8C%85.html "创建软件包")。

<div class="mw-heading mw-heading3">

### <span id=".E6.88.91.E6.83.B3.E6.8F.90.E4.BA.A4.E4.B8.80.E4.B8.AA_PKGBUILD.EF.BC.8C.E5.B8.8C.E6.9C.9B.E5.88.AB.E4.BA.BA.E5.B8.AE.E5.BF.99.E6.A3.80.E6.9F.A5.E9.94.99.E8.AF.AF.E3.80.82"></span>我想提交一个 PKGBUILD，希望别人帮忙检查错误。

</div>

您可以通过多种渠道提交您的材料供审核；请看 [\#调试包构建过程](#%E8%B0%83%E8%AF%95%E5%8C%85%E6%9E%84%E5%BB%BA%E8%BF%87%E7%A8%8B)。

<div class="mw-heading mw-heading3">

### <span id="PKGBUILD.EF.BC.88AUR_.E8.BD.AF.E4.BB.B6.E5.8C.85.EF.BC.89.E6.80.8E.E6.A0.B7.E6.89.8D.E8.83.BD.E8.A2.AB.E6.94.B6.E5.BD.95.E5.88.B0_extra_.E8.BD.AF.E4.BB.B6.E4.BB.93.E5.BA.93.EF.BC.9F"></span>PKGBUILD（AUR 软件包）怎样才能被收录到 extra 软件仓库？

</div>

一般至少需要 10 票，并且要有软件包维护者愿意维护，否则即便有上千票也不会收录。当然，如果某个软件包维护者愿意维护一个软件包的话，投票数往往不是决定因素。

一些流行的软件包未被收录的原因一般是：

- Arch Linux 的软件仓库中已经有了别的版本。
- 没有再发布的授权许可。
- 那个软件包的功能只和 AUR 相关（例如，是个 <a href="../zh-cn/AUR_helper.html" class="mw-redirect" title="AUR helper">AUR helper</a>）

另见[包进入 extra 仓库的规则](../zh-cn/%E8%BD%AF%E4%BB%B6%E5%8C%85%E7%BB%B4%E6%8A%A4%E8%80%85%E6%8C%87%E5%AF%BC%E5%8E%9F%E5%88%99.html#%E8%BD%AF%E4%BB%B6%E5%8C%85%E8%BF%9B%E5%85%A5_extra_%E4%BB%93%E5%BA%93%E7%9A%84%E8%A7%84%E5%88%99 "软件包维护者指导原则")。

<div class="mw-heading mw-heading3">

### <span id=".E5.A6.82.E4.BD.95.E5.8A.A0.E9.80.9F.E7.BC.96.E8.AF.91.EF.BC.9F"></span>如何加速编译？

</div>

参见 [Makepkg#减少编译时间](../zh-cn/Makepkg.html#%E5%87%8F%E5%B0%91%E7%BC%96%E8%AF%91%E6%97%B6%E9%97%B4 "Makepkg")。

<div class="mw-heading mw-heading3">

### <span id="foo_.E5.92.8C_foo-git_.E7.9A.84.E5.8C.BA.E5.88.AB.E6.98.AF.E4.BB.80.E4.B9.88.EF.BC.9F"></span>foo 和 foo-git 的区别是什么？

</div>

很多 AUR 软件包都包含稳定版本和开发版本。开发版本一般都会有代表<a href="../zh-cn/Category:%E7%89%88%E6%9C%AC%E6%8E%A7%E5%88%B6%E7%B3%BB%E7%BB%9F.html" class="mw-redirect" title="版本控制系统">版本控制系统</a>的[后缀](../zh-cn/VCS_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html#%E5%8C%85%E5%90%8D "VCS 软件打包准则")。开发版本并不是为日常使用而设计的，不过可能包含新功能或者 bug 修复。由于执行 `makepkg` 时会从软件源获取最新的代码，因此 AUR 上的 `pkgver()` 并不代表上游的最新更改。这些软件包很可能会跳过对 [VCS 源代码](../zh-cn/VCS_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html#VCS_%E6%BA%90%E4%BB%A3%E7%A0%81 "VCS 软件打包准则")的完整性效验。

同时请参阅 [系统维护#使用经测试的软件包](../zh-cn/%E7%B3%BB%E7%BB%9F%E7%BB%B4%E6%8A%A4.html#%E4%BD%BF%E7%94%A8%E7%BB%8F%E6%B5%8B%E8%AF%95%E7%9A%84%E8%BD%AF%E4%BB%B6%E5%8C%85 "系统维护")。

<div class="mw-heading mw-heading3">

### <span id=".E4.B8.BA.E5.95.A5.E6.9F.90.E4.B8.AA.E8.BD.AF.E4.BB.B6.E5.8C.85.E4.BB.8E_AUR_.E6.B6.88.E5.A4.B1.E4.BA.86.EF.BC.9F"></span>为啥某个软件包从 AUR 消失了？

</div>

可能是有软件包维护者认领了这个软件包，并把它收入到 <a href="../zh-cn/%E5%AE%98%E6%96%B9%E4%BB%93%E5%BA%93.html" class="mw-redirect" title="Extra">extra</a> 仓库中了。

软件包也可能因为不满足[提交软件包的规则](../zh-cn/AUR_%E6%8F%90%E4%BA%A4%E5%87%86%E5%88%99.html#%E6%8F%90%E4%BA%A4%E8%BD%AF%E4%BB%B6%E5%8C%85%E7%9A%84%E8%A7%84%E5%88%99 "AUR 提交准则")而被删除，您可以在 <a href="https://lists.archlinux.org/archives/list/aur-requests@lists.archlinux.org/" class="external text" rel="nofollow">aur-requests 存档</a>中找到删除原因。

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**通常被删除软件包的 git 仓库仍被保留，细节请参考 [AUR 提交准则#请求](../zh-cn/AUR_%E6%8F%90%E4%BA%A4%E5%87%86%E5%88%99.html#%E8%AF%B7%E6%B1%82 "AUR 提交准则")。

</div>

<div class="mw-heading mw-heading3">

### <span id=".E6.88.91.E8.A6.81.E6.80.8E.E4.B9.88.E6.89.BE.E5.87.BA.E4.BB.8E_AUR_.E9.87.8C.E6.B6.88.E5.A4.B1.E7.9A.84.E8.BD.AF.E4.BB.B6.E5.8C.85.EF.BC.9F"></span>我要怎么找出从 AUR 里消失的软件包？

</div>

最简单的办法是检查软件包 AUR 页面的 HTTP 状态：

\$ comm -23 \<(pacman -Qqm \| sort) \<(curl <a href="https://aur.archlinux.org/packages.gz" class="external free" rel="nofollow">https://aur.archlinux.org/packages.gz</a> \| gzip -cd \| sort)\

<div class="mw-heading mw-heading3">

### <span id=".E5.A6.82.E4.BD.95.E5.BE.97.E5.88.B0.E5.8C.85.E5.90.AB.E6.89.80.E6.9C.89_AUR_.E5.8C.85.E7.9A.84.E5.88.97.E8.A1.A8.EF.BC.9F"></span>如何得到包含所有 AUR 包的列表？

</div>

- <a href="https://aur.archlinux.org/packages.gz" class="external free" rel="nofollow">https://aur.archlinux.org/packages.gz</a>
- 使用来自 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://aur.archlinux.org/packages/python3-aur/" class="external text" rel="nofollow">python3-aur</a></span><sup><span class="small">AUR</span></sup></span> 的 `aurpkglist`。
- <a href="https://lists.archlinux.org/archives/list/aur-general@lists.archlinux.org/thread/D4YC6Y7L4T5VSEONUCLHOX2R4NJKNIDP/" class="external text" rel="nofollow">新的 AUR 元数据存档</a>

<div class="mw-heading mw-heading2">

## <span id=".E5.8F.A6.E8.AF.B7.E5.8F.82.E9.98.85"></span>另请参阅

</div>

- <a href="https://aur.archlinux.org" class="external text" rel="nofollow">AUR 网页界面</a>
- <a href="https://lists.archlinux.org/mailman3/lists/aur-general.lists.archlinux.org/" class="external text" rel="nofollow">AUR 邮件列表</a>

</div>
