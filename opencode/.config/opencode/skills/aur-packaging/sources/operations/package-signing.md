<div class="mw-content-ltr mw-parser-output" lang="zh-Hans-CN" dir="ltr">

<div class="aside archwiki-template-box archwiki-template-box-note noexcerpt">

**翻译状态：**

- 本文（或部分内容）译自 <a href="https://wiki.archlinux.org/title/Pacman/Package_signing" class="extiw" title="arch:Pacman/Package signing">Pacman/Package signing</a>，最近一次同步于 2022-10-27，若英文版本有所<a href="https://wiki.archlinux.org/title/Pacman/Package_signing?diff=0&amp;oldid=747357" class="external text" rel="nofollow">更改</a>，则您可以帮助同步与[翻译](../../zh-cn/Help:%E7%BF%BB%E8%AF%91.html "Help:翻译")更改的内容。
- 您可以在 <a href="https://wiki.archlinux.org/title/Pacman_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)/Package_signing_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)?action=history" class="external text" rel="nofollow">ArchWiki 的对应页面</a>找到本文翻译的**原始**修订历史。
- 本文可能与英文原文存在出入。

</div>

<div class="archwiki-template-meta-related-articles-start">

相关文章

- [GnuPG](../../zh-cn/GnuPG.html "GnuPG")
- <a href="/wzh/index.php?title=DeveloperWiki:Package_signing&amp;action=edit&amp;redlink=1" class="new" title="DeveloperWiki:Package signing（页面不存在）">DeveloperWiki:Package signing</a>

</div>

为了保证软件包来自开发者, Pacman 使用<a href="https://www.gnupg.org/gph/en/manual.html#AEN385" class="external text" rel="nofollow">信任网络</a>中的 <a href="https://www.gnupg.org/" class="external text" rel="nofollow">GnuPG 密钥</a>进行软件包验证。<a href="https://archlinux.org/master-keys/" class="external text" rel="nofollow">这个网址</a>记录了 Archlinux 的主密钥。其中至少三个主密匙被用来签署官方开发者和授信用户自己的密钥，而他们将用这些密钥签署自己的包。用户在配置 pacman-key 时也会生成一个唯一的密钥。所以信任网络也会把用户的密钥连接到五大主密钥上面。

信任网络示例:

- **自定义软件包**: 用户自己构建软件包并用本地密钥签名。
- **非官方软件包**: 开发者构建软并签名软件包。用户需要用自己的密钥签名开发者的密钥，将其变为可信。
- **官方软件包**: 开发者构建软件包，而开发者的密钥已经被 Arch 主密钥签名。最终用户用自己的密钥签名主密钥，这样就能信任所有官方开发者。

<div class="archwiki-template-box archwiki-template-box-tip">

**提示：**HKP协议使用11371/tcp端口用来通信。为了从服务器得到签署的密钥（使用pacman-key），这个端口必须打开。

</div>

<div class="mw-heading mw-heading2">

## <span id=".E9.85.8D.E7.BD.AE"></span>配置

</div>

<div class="mw-heading mw-heading3">

### <span id=".E9.85.8D.E7.BD.AE_pacman"></span>配置 pacman

</div>

`/etc/pacman.conf` 中的 `SigLevel` 配置用 `pacman -S` 安装软件时使用的检查级别。文件的注释中列出了几个可选设置，<span class="plainlinks archwiki-template-man" title="$ man 5 pacman.conf"><a href="https://man.archlinux.org/man/pacman.conf.5#PACKAGE_AND_DATABASE_SIGNATURE_CHECKING" class="external text" rel="nofollow">pacman.conf(5) § PACKAGE AND DATABASE SIGNATURE CHECKING</a></span> 有详细介绍。签名检查可以全局配置或针对某个仓库配置。如果 `SigLevel` 在 \[options\] 节中进行了全局设置，那么所有的包都必须签名。如果使用 `pacman.conf` 中默认的 `LocalFileSigLevel` ，所有编译和用 `pacman -U` 安装的软件包都不需要使用 `makepkg` 进行签名。

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**尽管所有的官方软件包现在都进行了签名，但是在2018年11月的时候签名数据库<a href="https://bbs.archlinux.org/viewtopic.php?id=242258" class="external text" rel="nofollow">还在开发</a>。如果设置了 `Required` ，那么 `DatabaseOptional` 也应该被设置。

</div>

默认的设置下，系统只安装被授信的密钥签署的软件包。

/etc/pacman.conf

SigLevel = Required DatabaseOptional

`TrustedOnly` 是 pacman 的默认设置。

默认配置的效果与下行等同：

SigLevel = Required DatabaseOptional TrustedOnly\

上面这些也可以在仓库内部进行设置，比如：

\[core\]\
SigLevel = PackageRequired # ’Optional’ here would turn off a global ’Required’ for this repository\
Include = /etc/pacman.d/mirrorlist

软件仓库中的软件启用了签名验证，但是并不要求仓库数据库也被签名了。

<div class="archwiki-template-box archwiki-template-box-warning">

**警告：**SigLevel `TrustAll` 设置仅仅为了测试而存在，使用它会信任未被验证的密钥。对于所有的官方软件源你应该使用 `TrustedOnly` 。

</div>

<div class="mw-heading mw-heading3">

### <span id=".E5.88.9D.E5.A7.8B.E5.8C.96.E5.AF.86.E9.92.A5.E7.8E.AF"></span>初始化密钥环

</div>

要初始化 pacman 密钥:

\# pacman-key --init\
\
初始化密钥，需要收集到足够的<a href="https://en.wikipedia.org/wiki/Entropy_(computing)" class="extiw" title="wikipedia:Entropy (computing)">熵</a>。请随意移动鼠标，随机按键盘或者运行一些磁盘读写操作（比如在其他终端运行`ls -R /`或者`find / -name foo` 或者 `dd if=/dev/sda8 of=/dev/tty7`之类的)应该会收集足够的熵。如果你的系统没有足够的熵，这项工作需要好几个小时，但是如果你有，那么就会快多了。\

这会在 `/etc/pacman.d/gnupg` 初始化密钥并生成系统主密钥。

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**如果`pacman-key --init`运行时系统没有足够的熵，可能会需要很长时间。请在目标机器上安装 [haveged](../../zh-cn/Haveged.html "Haveged") 或 <a href="/wzh/index.php?title=Rng-tools&amp;action=edit&amp;redlink=1" class="new" title="Rng-tools（页面不存在）">rng-tools</a>。然后在用 root 权限执行`pacman-key --init` 前<a href="../../zh-cn/Help:%E9%98%85%E8%AF%BB.html#%E6%8E%A7%E5%88%B6_systemd_%E5%8D%95%E5%85%83" class="mw-redirect" title="Start">启动</a> `haveged.service`。

</div>

<div class="mw-heading mw-heading2">

## <span id=".E7.AE.A1.E7.90.86.E5.AF.86.E9.92.A5"></span>管理密钥

</div>

<div class="mw-heading mw-heading3">

### <span id=".E9.AA.8C.E8.AF.81.E4.B8.BB.E5.AF.86.E9.92.A5"></span>验证主密钥

</div>

通过以下命令进行配置：

\# pacman-key --populate\

该命令对 <a href="https://archlinux.org/master-keys/" class="external text" rel="nofollow">Master Signing Keys</a> 进行验证，when prompted as these are used to co-sign (and therefore trust) all other packager's keys.

PGP 通常很长(2048 位或更长)，不太容易使用，所以通常创建一个40位十六进制指纹，最后八位被称为密钥 ID，是密钥的名字。长签名可以用来检测两个密钥是否相同。

<div class="mw-heading mw-heading3">

### <span id=".E5.AE.98.E6.96.B9.E5.BC.80.E5.8F.91.E8.80.85.E5.AF.86.E9.92.A5"></span>官方开发者密钥

</div>

官方开发者和 TU 的密钥已经被主密钥签名认证，所以不需要用 pacman-key 认证它们。pacman 遇到不认识的签名时，它将会询问是否从密钥服务器（设置在`/etc/pacman.d/gnupg/gpg.conf`文件中，或在命令行中使用`--keyserver`选项）下载。

<div class="archwiki-template-box archwiki-template-box-tip">

**提示：**维基百科提供了一份<a href="https://en.wikipedia.org/wiki/Key_server_(cryptographic)" class="extiw" title="wikipedia:Key server (cryptographic)">公钥服务器列表</a>。

</div>

下载开发者密钥后，以后都不需要下载。以后会用它验证所有这个开发者构建的软件包。

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**

如果开发者和 TU 的密钥是较早之前导入，它们的签名可能还不存在于本地数据库，用下面命令更新：

\# pacman-key --refresh-keys\

当使用`--refresh-keys` 时，本地签名也会被远程查找，并收到未找到的消息，这是正常的。

</div>

<div class="mw-heading mw-heading3">

### <span id=".E5.AF.BC.E5.85.A5.E9.9D.9E.E5.AE.98.E6.96.B9.E5.AF.86.E9.92.A5"></span>导入非官方密钥

</div>

可以通过此方法在pacman密钥环中添加你自己的密钥，或者启用已签名的<a href="../../zh-cn/Unofficial_user_repositories.html" class="mw-redirect" title="Unofficial user repositories">非官方软件仓库</a>。

首先从密钥持有者手中拿到密钥 ID(*`keyid`*)，然后把密钥加入密钥环：

- 如果密钥位于密钥服务器，通过下面命令导入：
  \# pacman-key -r *keyid*

<!-- -->

- 如果提供了地址，先下载，然后用下面密钥导入：
  \# pacman-key --add */path/to/downloaded/keyfile*

对于所有要签名的密钥，都通过指纹进行验证：

\$ pacman-key -f *keyid*\

最后，本地签名导入的密钥：

\# pacman-key --lsign-key *keyid*\

现在可以用这个密钥签名软件包了。

<div class="mw-heading mw-heading3">

### <span id=".E7.94.A8GPG.E8.B0.83.E8.AF.95"></span>用GPG调试

</div>

如果需要，可以直接使用GPG调试pacman钥匙环，例如：

\# gpg --homedir /etc/pacman.d/gnupg --list-keys\

<div class="mw-heading mw-heading2">

## <span id=".E6.8F.90.E7.A4.BA.E5.92.8C.E6.8A.80.E5.B7.A7"></span>提示和技巧

</div>

<div class="mw-heading mw-heading3">

### <span id=".E5.AE.9A.E6.9C.9F.E5.8D.87.E7.BA.A7.E7.B3.BB.E7.BB.9F"></span>定期升级系统

</div>

定期使用 [pacman#升级软件包](../../zh-cn/Pacman.html#%E5%8D%87%E7%BA%A7%E8%BD%AF%E4%BB%B6%E5%8C%85 "Pacman")更新系统可以防止绝大部分签名错误。

<div class="mw-heading mw-heading4">

#### <span id=".E6.89.8B.E5.8A.A8.E6.9B.B4.E6.96.B0.E5.AF.86.E9.92.A5.E7.8E.AF"></span>手动更新密钥环

</div>

如果有时不可避免地在一段时间里没有更新系统，或者在安装系统时使用的[安装映像](../../zh-cn/%E5%AE%89%E8%A3%85%E6%8C%87%E5%8D%97.html#%E8%8E%B7%E5%8F%96%E5%AE%89%E8%A3%85%E6%98%A0%E5%83%8F "安装指南")版本较旧，可能会遇到密钥环过旧而导致的签名错误，提示为“文件签名损坏”。这时你可以在更新系统之前手动同步包数据库并升级 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=archlinux-keyring" class="external text" rel="nofollow">archlinux-keyring</a></span><sup><span class="small">包</span></sup></span>：

\# pacman -Sy archlinux-keyring\

此命令成功以后，应**立即**升级所有软件包以避免<a href="../../zh-cn/%E7%B3%BB%E7%BB%9F%E7%BB%B4%E6%8A%A4.html#%E4%B8%8D%E6%94%AF%E6%8C%81%E9%83%A8%E5%88%86%E5%8D%87%E7%BA%A7" class="mw-redirect" title="部分升级">部分升级</a>：

\# pacman -Su\

如果你是在安装系统的过程中，可以跳过此 `pacman -Su` 命令，因为接下来将要运行的 `pacstrap` 命令会在新安装的系统中安装最新的软件包。

这是**唯一**可以接受的使用 `-Sy` 升级软件包而不被视为<a href="../../zh-cn/%E7%B3%BB%E7%BB%9F%E7%BB%B4%E6%8A%A4.html#%E4%B8%8D%E6%94%AF%E6%8C%81%E9%83%A8%E5%88%86%E5%8D%87%E7%BA%A7" class="mw-redirect" title="部分升级">部分升级</a>的情况。其余情况下你总是应该使用 `pacman -Syu` 来升级系统。

<div class="mw-heading mw-heading3">

### Update system time regularly

</div>

When the [系统时间](../../zh-cn/%E7%B3%BB%E7%BB%9F%E6%97%B6%E9%97%B4.html "系统时间") is faulty, signing keys could be considered expired (or invalid) and signature checks on packages will fail. Synchronize the system clock regularly by using the [Network Time Protocol daemon](../../zh-cn/Network_Time_Protocol_daemon.html "Network Time Protocol daemon").

<div class="mw-heading mw-heading2">

## <span id=".E9.97.AE.E9.A2.98.E8.A7.A3.E5.86.B3"></span>问题解决

</div>

<div class="mw-heading mw-heading3">

### error: signature from xxx is invalid

</div>

Pacman-key 依赖于[系统时间](../../zh-cn/%E7%B3%BB%E7%BB%9F%E6%97%B6%E9%97%B4.html "系统时间")。如果系统时间是错误的，将会获得一个报错：

error: PackageName: signature from "User \<email@archlinux.org\>" is invalid\
error: failed to commit transaction (invalid or corrupted package (PGP signature))\
Errors occured, no packages were upgraded.

如果是使用 ntpd, (root权限) 执行 `ntpd -qg`，然后执行 `hwclock -w`.

如果使用的是其他 NTP 客户端，请参考[系统时间#时钟同步](../../zh-cn/%E7%B3%BB%E7%BB%9F%E6%97%B6%E9%97%B4.html#%E6%97%B6%E9%92%9F%E5%90%8C%E6%AD%A5 "系统时间")。

如果问题依然存在，请尝试下面方法：

<div class="mw-heading mw-heading3">

### <span id=".E5.88.A0.E9.99.A4.E6.8A.A5.E9.94.99.E7.9A.84.E5.8C.85"></span>删除报错的包

</div>

如果相同的包持续失败，并且您确定 pacman-key 的相关操作是正确的，可以尝试移除软件包 `rm /var/cache/pacman/pkg/`*`packagename`* 或者[清空所有缓存](../../zh-cn/Pacman.html#Cleaning_the_package_cache "Pacman")，然后可以重新下载软件包。

<div class="mw-heading mw-heading3">

### <span id=".E9.87.8D.E7.BD.AE.E6.89.80.E6.9C.89.E5.AF.86.E9.92.A5"></span>重置所有密钥

</div>

如果要删除或重置系统，删除 `/etc/pacman.d/gnupg` 目录并重新运行 `pacman-key --init`。通过 `pacman-key --populate` 重新添加默认密钥。

<div class="mw-heading mw-heading3">

### <span id=".E7.A6.81.E7.94.A8.E7.AD.BE.E5.90.8D.E6.A3.80.E6.9F.A5"></span>禁用签名检查

</div>

<div class="archwiki-template-box archwiki-template-box-warning">

**警告：**小心使用，禁用签名检查，pacman 会自动安装不信任的软件包。

</div>

如果不在意软件包签名，可以完全禁用 PGP 签名检查，编辑 `/etc/pacman.conf` 并取消注释 \[options\] 下的如下行:

SigLevel = Never\
 #LocalFileSigLevel = Optional\
\#RemoteFileSigLevel = Required\
\

需要同时注释掉单独软件源的 SigLevel 设置，因为他们会覆盖全局设置。

这样就不会进行任何签名检查，和 pacman 4 之前一样。如果这样，就不需要用 pacman-key 建立密钥环。

<div class="mw-heading mw-heading3">

### <span id=".E5.AF.86.E9.92.A5.E5.AF.BC.E5.85.A5.E5.A4.B1.E8.B4.A5"></span>密钥导入失败

</div>

有三种可能的情况导致这个问题：

- 过期的<span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=archlinux-keyring" class="external text" rel="nofollow">archlinux-keyring</a></span><sup><span class="small">包</span></sup></span> 包。
- 不正确的系统时间。
- 你的ISP屏蔽了用于导入 PGP keys 的端口。
- *pacman* 缓存中包含之前的未签名软件包
- 未正确设置 `dirmngr`

过期的 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=archlinux-keyring" class="external text" rel="nofollow">archlinux-keyring</a></span><sup><span class="small">包</span></sup></span> 包可能会导致这个问题，根据情况采用下面的解决方法

<div class="mw-heading mw-heading4">

#### <span id=".E5.88.87.E6.8D.A2.E5.85.AC.E9.92.A5.E6.9C.8D.E5.8A.A1.E5.99.A8"></span>切换公钥服务器

</div>

如果这样没有起作用，并且系统时间是正确的，你可以尝试切换到 Ubuntu 提供的公钥服务器(keyserver)。编辑 `/etc/pacman.d/gnupg/gpg.conf` 将 `keyserver` 行替换为

keyserver hkp://keyserver.ubuntu.com\

<div class="mw-heading mw-heading4">

#### <span id=".E6.B8.85.E7.90.86.E8.BD.AF.E4.BB.B6.E5.8C.85.E7.BC.93.E5.AD.98"></span>清理软件包缓存

</div>

如果上面方法都不起作用，pacman 缓存 `/var/cache/pacman/pkg/` 可以包含之前下载的未签名软件包，手动清空缓存：

\# pacman -Sc\
\
=== Signature is unknown trust ===\

在执行 `pacman -Syu` 时可能出现下面错误：

error: *package-name*: signature from "*packager*" is unknown trust\

这是因为 *`package-name`* 软件包使用的 *`packager`* 的密钥不被本地的 pacman-key gpg 数据库信任。可能是密钥在加入密钥链之后失效了，可以通过下面方法解决：

- 用 `pacman-key --refresh-keys` 刷新密钥
- 本地手动签署密钥
- 刷新所有密钥
- 将 `SigLevel` 设置成 `TrustAll` (不推荐)

后面两个选项将会破坏信任连，所以请谨慎使用。

<div class="mw-heading mw-heading3">

### <span id=".E9.80.9A.E8.BF.87.E4.BB.A3.E7.90.86.E6.9B.B4.E6.96.B0.E5.AF.86.E9.92.A5"></span>通过代理更新密钥

</div>

要使用代理更新密钥，必须同时在 `/etc/gnupg/dirmngr.conf` 和 `/etc/pacman.d/gnupg/dirmngr.conf` 中设置 `honor-http-proxy` 选项。更多信息请阅读 [GnuPG#Use a keyserver](../../zh-cn/GnuPG.html#Use_a_keyserver "GnuPG").

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**如果 *pacman-key* 没有用 `honor-http-proxy` 选项，执行失败，重启可能能够解决问题。

</div>

<div class="mw-heading mw-heading2">

## <span id=".E5.8F.82.E9.98.85"></span>参阅

</div>

- <a href="/wzh/index.php?title=Package_Signing_Proposal_for_Pacman&amp;action=edit&amp;redlink=1" class="new" title="Package Signing Proposal for Pacman（页面不存在）">DeveloperWiki:Package Signing Proposal for Pacman</a>
- <a href="http://allanmcrae.com/2011/08/pacman-package-signing-1-makepkg-and-repo-add/" class="external text" rel="nofollow">Pacman Package Signing – 1: Makepkg and Repo-add</a>
- <a href="http://allanmcrae.com/2011/08/pacman-package-signing-2-pacman-key/" class="external text" rel="nofollow">Pacman Package Signing – 2: Pacman-key</a>
- <a href="http://allanmcrae.com/2011/08/pacman-package-signing-3-pacman/" class="external text" rel="nofollow">Pacman Package Signing – 3: Pacman</a>
- <a href="http://allanmcrae.com/2011/12/pacman-package-signing-4-arch-linux/" class="external text" rel="nofollow">Pacman Package Signing – 4: Arch Linux</a>

</div>
