<div class="mw-content-ltr mw-parser-output" lang="zh-Hans-CN" dir="ltr">

<div class="aside archwiki-template-box archwiki-template-box-note noexcerpt">

**翻译状态：**

- 本文（或部分内容）译自 <a href="https://wiki.archlinux.org/title/Package_Maintainer_guidelines" class="extiw" title="arch:Package Maintainer guidelines">Package Maintainer guidelines</a>，最近一次同步于 2025-01-30，若英文版本有所<a href="https://wiki.archlinux.org/title/Package_Maintainer_guidelines?diff=0&amp;oldid=822754" class="external text" rel="nofollow">更改</a>，则您可以帮助同步与[翻译](../zh-cn/Help:%E7%BF%BB%E8%AF%91.html "Help:翻译")更改的内容。
- 您可以在 <a href="https://wiki.archlinux.org/title/Package_Maintainer_guidelines_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)?action=history" class="external text" rel="nofollow">ArchWiki 的对应页面</a>找到本文翻译的**原始**修订历史。
- 本文可能与英文原文存在出入。

</div>

<div class="archwiki-template-meta-related-articles-start">

相关文章

- <a href="../zh-cn/Arch_%E7%94%A8%E6%88%B7%E8%BD%AF%E4%BB%B6%E4%BB%93%E5%BA%93.html" class="mw-redirect" title="AUR">AUR</a>
- <a href="https://wiki.archlinux.org/title/DeveloperWiki:How_to_be_a_packager" class="extiw" title="arch:DeveloperWiki:How to be a packager">arch:DeveloperWiki:How to be a packager</a>
- <a href="https://wiki.archlinux.org/title/DeveloperWiki:Building_in_a_clean_chroot" class="extiw" title="arch:DeveloperWiki:Building in a clean chroot">arch:DeveloperWiki:Building in a clean chroot</a>
- [GnuPG](../zh-cn/GnuPG.html "GnuPG")
- <a href="/wzh/index.php?title=OpenPGP&amp;action=edit&amp;redlink=1" class="new" title="OpenPGP（页面不存在）">OpenPGP</a>

</div>

[软件包维护者](../zh-cn/%E8%BD%AF%E4%BB%B6%E5%8C%85%E7%BB%B4%E6%8A%A4%E8%80%85.html "软件包维护者")是负责使 AUR 正常工作的 Arch Linux 工作人员。他们负责维护热门软件包（<a href="https://lists.archlinux.org/archives/list/aur-general@lists.archlinux.org/message/SI2IZPY4YVB3ACEVJWFR3NCOZSM4HSEV/" class="external text" rel="nofollow">并在必要时与上游项目沟通或者向上游项目提交补丁</a>），并且参与管理事务的表决。新的软件包维护者由现任包维护者从活跃的社区成员中民主选举产生，包维护者是唯一有权决定 AUR 发展方向的成员群体。

软件包维护者们根据<a href="https://package-maintainer-bylaws.aur.archlinux.org/" class="external text" rel="nofollow">软件包维护者细则</a>来管理社区。

<div class="mw-heading mw-heading2">

## <span id=".E6.96.B0.E8.BD.AF.E4.BB.B6.E5.8C.85.E7.BB.B4.E6.8A.A4.E8.80.85.E7.9A.84_TODO_.E5.88.97.E8.A1.A8"></span>新软件包维护者的 TODO 列表

</div>

1.  仔细阅读本页面
2.  阅读<a href="https://package-maintainer-bylaws.aur.archlinux.org/" class="external text" rel="nofollow">软件包维护者细则</a>
3.  确认自己在 <a href="../zh-cn/Arch_%E7%94%A8%E6%88%B7%E8%BD%AF%E4%BB%B6%E4%BB%93%E5%BA%93.html" class="mw-redirect" title="AUR">AUR</a> 的账户信息是最新的
4.  让一个推荐人在 AUR 中给您软件包维护者状态
5.  提醒 <a href="https://wiki.archlinux.org/title/ArchWiki:Access_levels_and_roles#Access_levels" class="extiw" title="arch:ArchWiki:Access levels and roles">bureaucrat</a> 将你的维基账号添加到 ⧼group-archpackager⧽ 组
6.  提醒 <a href="https://bbs.archlinux.org/userlist.php?username=&amp;show_group=1&amp;sort_by=username&amp;sort_dir=ASC&amp;search=Submit" class="external text" rel="nofollow">BBS 管理员</a>更改你在论坛上的账户
7.  让推荐人提供 <a href="ircs://irc.libera.chat/archlinux-staff" class="external text" rel="nofollow">#archlinux-staff</a> 和 <a href="ircs://irc.libera.chat/archlinux-packaging" class="external text" rel="nofollow">#archlinux-packaging</a> 密码，并加入频道（非必须，但有助于团队成员相互认识并合作）
    - 如果需要 bouncer，请找 heftig 申请加入 [Matrix](../zh-cn/Matrix.html "Matrix")
    - 如果需要 `@archlinux/trusteduser/`*`username`*，请连续群组联络人 <a href="../zh-cn/Arch_IRC_channels.html#Libera_Chat_group_contacts" class="mw-redirect" title="Arch IRC channels">group contacts</a>
    - 如果想要 `@archlinux/package-maintainer/`*`username`* cloak，请找<a href="../zh-cn/Arch_IRC_channels.html#Libera_Chat_group_contacts" class="mw-redirect" title="Arch IRC channels">群组联系人</a>进行协助
8.  让一个赞助者在<a href="https://gitlab.archlinux.org/archlinux/infrastructure/-/issues" class="external text" rel="nofollow">基础设施仓库问题追踪</a>中使用 `Onboarding` 模板创建工单，并提供如下信息：
    - 一个 SSH 公钥，如果还没有，参考 [SSH 密钥#生成密钥对](../zh-cn/SSH_%E5%AF%86%E9%92%A5.html#%E7%94%9F%E6%88%90%E5%AF%86%E9%92%A5%E5%AF%B9 "SSH 密钥")生成一个。
    - SSO 帐号要使用的用户名，此名称也会用来创建 `@archlinux.org` 邮箱地址。
    - 全名
    - 个人邮箱地址和对应的有效 PGP 公钥 ID，该信息将用于提供链接到 SSO 账户的开发者界面（archweb）初始密码
    - 是否将你的私人或（尚未创建的）*`username`*`@archlinux.org` 邮箱地址用在非公开邮件清单，并允许发布到 <a href="https://lists.archlinux.org/mailman3/lists/arch-dev-public.lists.archlinux.org/" class="external text" rel="nofollow">arch-dev-public</a> 邮件清单
9.  按照 <a href="https://wiki.archlinux.org/title/DeveloperWiki:Staff_Services#Email" class="extiw" title="arch:DeveloperWiki:Staff Services">arch:DeveloperWiki:Staff Services#Email</a> 配置 `@archlinux.org` 邮箱的密码
10. 参考<a href="https://md.archlinux.org/1bUNqnNsRCCM4wSc35uQdw#" class="external text" rel="nofollow">添加新打包人密钥的流程</a>创建用于<a href="/wzh/index.php?title=Package_signing&amp;action=edit&amp;redlink=1" class="new" title="Package signing（页面不存在）">软件包签名</a>的新 PGP 密钥对（使用新的 *`username`*`@archlinux.org` 邮箱地址作为 uid）
11. 让一位推荐人在 <a href="https://gitlab.archlinux.org/archlinux/archlinux-keyring/-/issues" class="external text" rel="nofollow">archlinux-keyring 代码库问题追踪页</a>使用 `New Packager Key` 模板创建工单，以使你的 PGP 密钥受至少三个主密钥持有者签名
12. 安装 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=devtools" class="external text" rel="nofollow">devtools</a></span><sup><span class="small">包</span></sup></span> 软件包
13. 为 `repos.archlinux.org` [配置你的 ssh 私钥](../zh-cn/AUR_%E6%8F%90%E4%BA%A4%E5%87%86%E5%88%99.html#%E8%AE%A4%E8%AF%81 "AUR 提交准则")
14. 获得权限后，ssh 到 *`yourname`*`@repos.archlinux.org`
15. 开始你的贡献吧！

<div class="mw-heading mw-heading3">

### <span id=".E5.88.9D.E7.BA.A7.E7.BB.B4.E6.8A.A4.E8.80.85"></span>初级维护者

</div>

Since the ratification of <a href="https://rfc.archlinux.page/0014-merge-package-repos/" class="external text" rel="nofollow">RFC 0014</a>, new Package Maintainers will be marked as "junior" for their first two months of packaging. During this time, the new Package Maintainer may only push to the *extra-testing* repository. Your sponsors can review your packages as-needed and move them to *extra*.

<div class="mw-heading mw-heading2">

## <span id=".E8.BD.AF.E4.BB.B6.E5.8C.85.E7.BB.B4.E6.8A.A4.E8.80.85.E4.B8.8E_AUR"></span>软件包维护者与 AUR

</div>

软件包维护者应检查被提交到 <a href="../zh-cn/Arch_%E7%94%A8%E6%88%B7%E8%BD%AF%E4%BB%B6%E4%BB%93%E5%BA%93.html" class="mw-redirect" title="AUR">AUR</a> 中的软件包是否含有恶意代码，以及 PKGBUILD 是否符合标准。80% 左右的 PKGBUILD 都非常简单，包维护者团队可以很快地检查其可用性以及安全性。

软件包维护者也应该检查 PKGBUILD 的一些小错误，提出修正和改进建议。软件包维护者应该努力确认所有的软件包是否遵循了 Arch 打包指导准则/标准，并与其他打包者分享他们的技能和经验来提升 archlinux 的总体软件打包质量。

另外，也建议软件包维护者撰写文档来记录一些推荐做法。

<div class="mw-heading mw-heading3">

### Rewriting git history

</div>

In some cases rewriting the history of an AUR repository is required, for example when a user inadvertently uses their legal name in a published commit. This can be automated with <span class="plainlinks archwiki-template-man" title="$ man 1 git-filter-branch"><a href="https://man.archlinux.org/man/git-filter-branch.1" class="external text" rel="nofollow">git-filter-branch(1)</a></span>.

To force push the new history, forward the `AUR_OVERWRITE=1` environment variable to <span class="plainlinks archwiki-template-man" title="$ man 1 git-push"><a href="https://man.archlinux.org/man/git-push.1" class="external text" rel="nofollow">git-push(1)</a></span>.

In detail this includes adding `SendEnv AUR_OVERWRITE` to your AUR SSH config and setting the env var on your push command: `AUR_OVERWRITE=1 git push --force`. See <a href="https://gitlab.archlinux.org/archlinux/aurweb/-/commit/c5302d3a33028f483cc2e01225226d4ae047dd4a" class="external autonumber" rel="nofollow">[1]</a> for details.

<div class="archwiki-template-box archwiki-template-box-warning">

**警告：**It is recommended to create a backup of the repository before rewriting history.

</div>

Modify committer or author identity

Install <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=git-filter-repo" class="external text" rel="nofollow">git-filter-repo</a></span><sup><span class="small">包</span></sup></span> and run:

\$ git-filter-repo --name-callback 'return name.replace(b"*Old name*", b"*New name*")' --email-callback 'return email.replace(b"*old@email.com*", b"*new@email.com*")'\

<div class="archwiki-template-box archwiki-template-box-tip">

**提示：**If the username contains special characters you may need to encode the strings `name.replace("Bás Ssze".encode("utf-8"), b"newname")'`

</div>

Alternatively, use `git filter-branch --env-filter` with the `GIT_AUTHOR_NAME`, `GIT_AUTHOR_EMAIL`, `GIT_COMMITTER_NAME` and `GIT_COMMITTER_EMAIL` <a href="../zh-cn/Environment_variables.html" class="mw-redirect" title="Environment variables">environment variables</a>. For example:

git filter-branch --env-filter '\
if test "\$GIT_AUTHOR_EMAIL" = "lepetit@prince.com"; then\
  GIT_AUTHOR_EMAIL=user@users.noreply.github.com\
fi\
if test "\$GIT_AUTHOR_NAME" = "Antoine de Saint-Exupéry"; then\
  GIT_AUTHOR_NAME=user\
fi'

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**<span class="plainlinks archwiki-template-man" title="$ man 1 git-log"><a href="https://man.archlinux.org/man/git-log.1" class="external text" rel="nofollow">git-log(1)</a></span> only displays the git *author* by default. Use `git log --pretty=fuller` to display the *author* and *committer*.

</div>

<div class="mw-heading mw-heading3">

### Handling AUR requests

</div>

<div class="noprint archwiki-template-message">

<span class="mw-default-size" typeof="mw:File"><a href="../File:Tango-view-fullscreen.png" class="mw-file-description"><img src="../File:Tango-view-fullscreen.png" class="mw-file-element" decoding="async" width="48" height="48" /></a></span>**这篇文章的某些内容需要扩充。**

<div>

**原因：**This list is incomplete for now and should be expanded. (在 <a href="../zh-cn/Talk:%E8%BD%AF%E4%BB%B6%E5%8C%85%E7%BB%B4%E6%8A%A4%E8%80%85%E6%8C%87%E5%AF%BC%E5%8E%9F%E5%88%99.html" class="external text" rel="nofollow">Talk:软件包维护者指导原则</a> 中讨论)

</div>

</div>

Package Maintainers should periodically check the <a href="https://aur.archlinux.org/requests" class="external text" rel="nofollow">requests</a> filed on the AUR. For that there are some generic rules what to check for each request type:

Orphan request

- check if the request is older then 14 days (the date column turns red in the overview) (you cannot accept it before that anyway)
- check if there was no update to the package itself (commit or release) done in the past 14 days
- check if there was no comment from the AUR package maintainer done in the past 14 days

If all of the above points are true then you can accept the Orphan Request.

<div class="mw-heading mw-heading2">

## <span id=".E8.BD.AF.E4.BB.B6.E5.8C.85.E7.BB.B4.E6.8A.A4.E8.80.85.E4.B8.8E_extra.EF.BC.8C.E8.BD.AF.E4.BB.B6.E5.8C.85.E7.BB.B4.E6.8A.A4.E5.87.86.E5.88.99"></span>软件包维护者与 extra，软件包维护准则

</div>

<div class="mw-heading mw-heading3">

### <span id=".E8.BD.AF.E4.BB.B6.E5.8C.85.E8.BF.9B.E5.85.A5_.5Bextra.5D_.E4.BB.93.E5.BA.93.E7.9A.84.E8.A7.84.E5.88.99"></span>软件包进入 \[extra\] 仓库的规则

</div>

- 软件包不能存在于任何 Arch Linux 仓库中。你还需要确保没有其他打包者同时提交该软件包。检查 AUR 的包评论，阅读 <a href="https://lists.archlinux.org/mailman3/lists/aur-general.lists.archlinux.org/" class="external text" rel="nofollow">aur-general</a> 中新文章的标题，<a href="https://en.wikipedia.org/wiki/Grep" class="extiw" title="wikipedia:Grep">grep</a> <span class="plainlinks archwiki-template-man" title="$ man 1 git-log"><a href="https://man.archlinux.org/man/git-log.1" class="external text" rel="nofollow">git-log(1)</a></span> 日志，并向私密打包 <a href="../zh-cn/IRC_channel.html" class="mw-redirect" title="IRC channel">IRC 频道</a>发送消息。
- [Pacman 封装](../zh-cn/AUR_%E5%8A%A9%E6%89%8B.html#Pacman_%E5%B0%81%E8%A3%85 "AUR 助手")是一个特例，不管投票数有多高，都不会被批准进入。如果是 [AUR 助手](../zh-cn/AUR_%E5%8A%A9%E6%89%8B.html "AUR 助手")，可以写封邮件到 `arch-dev-public` 进行提议，并尊重团队成员提出的反对意见。

<div class="noprint archwiki-template-message">

<span class="mw-default-size" typeof="mw:File"><a href="../File:Tango-inaccurate.png" class="mw-file-description"><img src="../File:Tango-inaccurate.png" class="mw-file-element" decoding="async" width="48" height="48" /></a></span>**本文或本章节的事实准确性存在争议。**

<div>

**原因：** The following rule is arbitrary and not enforced in practice. The next two points need to be adjusted as well.（在 <a href="../zh-cn/Talk:%E8%BD%AF%E4%BB%B6%E5%8C%85%E7%BB%B4%E6%8A%A4%E8%80%85%E6%8C%87%E5%AF%BC%E5%8E%9F%E5%88%99.html" class="external text" rel="nofollow">Talk:软件包维护者指导原则</a> 中讨论）

</div>

</div>

- 只有“流行”的软件包才能进入仓库（指 <a href="https://pkgstats.archlinux.de/packages" class="external text" rel="nofollow">pkgstats</a> 有 1% 使用数或者 AUR 中 10 票以上
- 自动略过该规则的软件包有：
  - i18n 包
  - 辅助功能软件包
  - 驱动程序
  - 满足“流行”定义的软件包的依赖包，包括 makedeps 和 optdeps
  - 属于同一集合并一起发布的软件包，前提是这一集合的某些软件包满足“流行”定义
- 任何不属于上述例外的其它软件包都需首先在 aur-general 邮件列表中提出申请，并解释成为例外的原因（例如重命名的软件包、新软件包等）。软件包进入 *extra* 仓库需要其他三名软件包维护者同意。维护大量“不流行”软件包的软件包维护者的申请更有可能被拒绝。
- 强烈建议软件包维护者移除 *extra* 仓库中他们维护的低使用率软件包。该项非强制，但在有人接手前离职维护者的软件包有可能会被过滤掉
- 软件包从 AUR 提升到其它仓库时，应该将 **pkgrel** 的数值加 *1*（即设为 *n + 1*），这样已安装软件包的用户可以从官方仓库继续收到自动更新。还有一个好处就是避免 **pkgrel** 重置为 *1* 时用户收到本地软件包比仓库更新的警告
- 所有官方软件包的构建脚本都以 0BSD 许可证<a href="https://rfc.archlinux.page/0040-license-package-sources/" class="external autonumber" rel="nofollow">[2]</a>提供。如果 AUR 包的构建脚本没有显式[以 0BSD 进行许可](../zh-cn/AUR_%E6%8F%90%E4%BA%A4%E5%87%86%E5%88%99.html#%E6%8F%90%E4%BA%A4%E8%BD%AF%E4%BB%B6%E5%8C%85%E7%9A%84%E8%A7%84%E5%88%99 "AUR 提交准则")，则需要进行重写

<div class="mw-heading mw-heading3">

### <span id=".E8.AE.BF.E9.97.AE.E5.B9.B6.E6.9B.B4.E6.96.B0.E4.BB.93.E5.BA.93"></span>访问并更新仓库

</div>

参考<a href="https://wiki.archlinux.org/title/DeveloperWiki:HOWTO_Be_A_Packager" class="extiw" title="arch:DeveloperWiki:HOWTO Be A Packager">软件包维护者指引</a>。

<div class="mw-heading mw-heading3">

### <span id=".E5.81.9C.E6.AD.A2.E7.BB.B4.E6.8A.A4.E8.BD.AF.E4.BB.B6.E5.8C.85"></span>停止维护软件包

</div>

如果一个软件包维护者不想再维护一个软件包了，需要在 AUR 邮件列表中发出一个通知，以便其他的软件包维护者可以接手。即使没有人接手，软件包维护者也可以停止维护，但应避免放弃大量软件包（即不应接手超出能力范围的包数量）。如果一个软件包已经过时或不再被使用，那么可以将其完全移除。

如果一个软件包已经被完全移除，可以将其重新上传到 AUR，使得普通用户可以替软件包维护者进行维护。

<div class="mw-heading mw-heading3">

### <span id=".E5.B0.86.E8.BD.AF.E4.BB.B6.E5.8C.85.E4.BB.8E_AUR_.E7.A7.BB.E5.88.B0_extra"></span>将软件包从 AUR 移到 extra

</div>

遵循<a href="https://wiki.archlinux.org/title/DeveloperWiki:HOWTO_Be_A_Packager#Adding_a_new_package" class="extiw" title="arch:DeveloperWiki:HOWTO Be A Packager">打包者指引</a>中将软件包添加到 *extra* 的正常步骤即可，但记得将对应的包从 AUR 中移除！

<div class="mw-heading mw-heading3">

### <span id=".E5.B0.86.E8.BD.AF.E4.BB.B6.E5.8C.85.E4.BB.8E_extra_.E7.A7.BB.E8.87.B3_AUR"></span>将软件包从 extra 移至 AUR

</div>

按照<a href="https://wiki.archlinux.org/title/DeveloperWiki:HOWTO_Be_A_Packager#Removing_a_package" class="extiw" title="arch:DeveloperWiki:HOWTO Be A Packager">打包者指引</a>移除软件包，并将源代码上传到 AUR 即可。

<div class="mw-heading mw-heading3">

### <span id=".E5.B0.86.E8.BD.AF.E4.BB.B6.E5.8C.85.E4.BB.8E_extra-testing_.E7.A7.BB.E8.87.B3_extra"></span>将软件包从 extra-testing 移至 extra

</div>

Move the package from the *extra-testing* to the *extra* repository using the instructions in the <a href="https://wiki.archlinux.org/title/DeveloperWiki:HOWTO_Be_A_Packager#Moving_a_package_between_repositories" class="extiw" title="arch:DeveloperWiki:HOWTO Be A Packager">packager guide</a>.

<div class="mw-heading mw-heading3">

### <span id=".E5.9C.A8_build.archlinux.org_.E4.B8.8A.E8.BF.9C.E7.A8.8B.E7.BC.96.E8.AF.91"></span>在 build.archlinux.org 上远程编译

</div>

<div class="archwiki-template-box archwiki-template-box-warning">

**警告：**The following procedures defeats the Web Of Trust model: a user with root access to PKGBUILD.com could alter the package and/or the signature before it gets published.

</div>

软件包维护者和开发者可以 SSH 到 build.archlinux.org，并使用 devtools 编译软件包。 和本地编译相比，这样做有如下好处：

- 编译快，网速快
- 环境仅需要配置一次
- 本地系统可以不是 Arch Linux

The process is similar to that of a local setup with devtools. Your GnuPG private is required for signing but you do not want to upload it for obvious security reasons. As such, you will need to forward the GnuPG agent socket from your local machine to the server: this will allow you to sign packages on the build server without communicating your key. This also means that we need to disable the agent on the server before we can run anything.

First, connect to build.archlinux.org and disable

\$ ssh build.archlinux.org\
\$ systemctl --user mask gpg-agent.service\

Make sure gpg-agent is not running (`systemctl --user stop gpg-agent.service`). At this point, make sure that no sockets exist in the folder pointed by `gpgconf --list-dir socketdir`. If they do, remove them or log out and in again. If you have a custom \$GNUPGHOME (eg. to move it to `~/.config/gnupg`), you will need to unset that, as it is not possible in gnupg to set the homedir without setting the socketdir. On build.archlinux.org, `StreamLocalBindUnlink yes` is set in `sshd_config`, therefore removing the sockets manually on logout is not necessary.

While the PGP private keys remain on your local machine, the public keys **must** be on the build server. Export your public ring to the build server, e.g. from you local machine

\$ scp ~/.gnupg/pubring.gpg build.archlinux.org:~/.gnupg/pubring.gpg\

SSH is required to checkout and commit to the Git repository. You can either set up a new SSH key pair on the server (it is highly discouraged to put your local private key on a server for security reasons) or reuse your local keys via socket forwarding. If you opt for the latter, make sure to disable ssh-agent on the build server if you had enabled it previously (it is not running by default).

Configure you build environment on the build server:

~/.makepkg.conf

PACKAGER="John Doe \<john@doe.example\>"\
\## Optional\
PKGDEST="/home/johndoe/packages"\
SRCDEST="/home/johndoe/sources"\
SRCPKGDEST="/home/johndoe/srcpackages"\
LOGDEST="/home/johndoe/logs"\
\## If your PGP key is not the default, specify the right fingerprint:\
GPGKEY="ABCD1234..."

<div class="archwiki-template-box archwiki-template-box-warning">

**警告：**Forwarding your gpg-agent socket to a remote machine makes it possible for anyone with root access to that system to use your unlocked GPG credentials. To circumvent this issue, we need to disable passphrase caching.

</div>

Disable passphrase caching with the following settings:

gpg-agent.conf

default-cache-ttl 0\
max-cache-ttl 0\

Because we will want to keep our usual GPG agent running with its current settings, we are going to run another GPG agent dedicated to the task at hand. Create a `~/.gnupg-archlinux` folder and symlink everything from `~/.gnupg` there, except `~/.gnupg/gpg-agent.conf`. Configure the new GPG agent:

~/.gnupg-archlinux

extra-socket /home/doe/.gnupg-archlinux/S.gpg-agent.extra\
default-cache-ttl 0\
max-cache-ttl 0\
pinentry-program /usr/bin/pinentry-gtk-2\

The `gpg-agent-extra.socket` will be forwarded to build.archlinux.org.

Start the dedicated agent with

\$ gpg-agent --homedir ~/.gnupg-archlinux --daemon\

Connect with:

\$ ssh -R *REMOTE_SSH_AUTH_SOCK*:\$SSH_AUTH_SOCK -R /run/user/*REMOTE_UID*/gnupg/S.gpg-agent:/home/doe/.gnupg-archlinux/S.gpg-agent.extra build.archlinux.org\

or, if using GnuPG as your SSH agent:

\$ ssh -R /run/user/*REMOTE_UID*/gnupg/S.gpg-agent.ssh:/run/user/*LOCAL_UID*/gnupg/S.gpg-agent.ssh -R /run/user/*REMOTE_UID*/gnupg/S.gpg-agent:/home/doe/.gnupg-archlinux/S.gpg-agent.extra build.archlinux.org\

Replace *`REMOTE_UID`* and *`LOCAL_UID`* by your user identifier as returned by `id -u` on the build server and locally, respectively. If using ssh-agent, replace *`REMOTE_SSH_AUTH_SOCK`* by the path to the SSH socket on the remote host (it can be anything).

You can make the forwarding permanent for that host. For instance with gpg-agent.ssh:

~/.ssh/config

Host build.archlinux.org\
  RemoteForward /run/user/*REMOTE_UID*/gnupg/S.gpg-agent /run/user/%i/gnupg/S.gpg-agent.extra\
  RemoteForward /run/user/*REMOTE_UID*/gnupg/S.gpg-agent.ssh /run/user/%i/gnupg/S.gpg-agent.ssh\

Again, replace *`REMOTE_UID`* with the user UID on the build server.

From then on, the procedure should be exactly the same as a local build:

\$ ssh build.archlinux.org\
\$ pkgctl repo clone existing-package\
\$ ...\

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**pinentry-curses might not work with socket forwarding. If it fails for you, try using a different pinentry.

</div>

<div class="mw-heading mw-heading2">

## <span id=".E8.BD.AF.E4.BB.B6.E5.8C.85.E7.BB.B4.E6.8A.A4.E8.80.85.E8.BE.9E.E8.81.8C.E9.9C.80.E8.A6.81.E5.AE.8C.E6.88.90.E7.9A.84.E4.BA.8B.E9.A1.B9"></span>软件包维护者辞职需要完成的事项

</div>

当一个软件包维护者辞去自己的职务时，需要完成以下清单。如果仅辞去软件包维护者，但仍是开发者，就不适用以下步骤。

1.  此软件包维护者的所有包都需要被重新签名（重新打包）。软件包维护者编译的软件包可以通过下面 URL 从 Archweb 查询 <a href="https://archlinux.org/packages/?sort=&amp;q=&amp;packager=$packager&amp;flagged=" class="external free" rel="nofollow">https://archlinux.org/packages/?sort=&amp;q=&amp;packager=$packager&amp;flagged=</a> ，将 packager 替换成包维护者在 Archweb 的用户名即可。
2.  Archweb 需要禁用此维护者的帐号，并将其添加到 'Retired Package maintainers' 组。需从 'Package Maintainers' 移除此软件包维护者，并收回所有软件仓库权限。
3.  从服务器上禁用此帐号的 shell 访问权限（尤其是 repos.archlinux.org, pkgbuild.com）。
4.  移除此用户的 GPG key，并向仓库提交新的 archlinux-keyring 软件包。在 keyring 项目中创建 bug 工单，删除辞职人员的密钥。
5.  将包维护者的 AUR 帐号移出 Package Maintainer 组。
6.  <a href="https://wiki.archlinux.org/title/ArchWiki:Access_levels_and_roles#Access_levels" class="extiw" title="arch:ArchWiki:Access levels and roles">bureaucrat</a> 应将维护者的维基账户移出 ⧼group-archpackager⧽ 组。
7.  <a href="https://bbs.archlinux.org/userlist.php?username=&amp;show_group=1&amp;sort_by=username&amp;sort_dir=ASC&amp;search=Submit" class="external text" rel="nofollow">BBS 管理员</a>需要修改包维护者的论坛帐号。

</div>
