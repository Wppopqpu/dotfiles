<div class="mw-content-ltr mw-parser-output" lang="zh-Hans-CN" dir="ltr">

<div class="noprint archwiki-template-message">

<span class="mw-default-size" typeof="mw:File"><a href="../File:Tango-view-refresh-red.png" class="mw-file-description"><img src="../File:Tango-view-refresh-red.png" class="mw-file-element" decoding="async" width="48" height="48" /></a></span>**本文或本节内容已经过时。**

<div>

**原因：** 小部分翻译已经过期，且部分段落内容缺乏翻译，请阅读英文页面中的内容。 (在<a href="../zh-cn/Talk:GnuPG.html" class="external text" rel="nofollow">Talk:GnuPG</a>讨论)

</div>

</div>

<div class="aside archwiki-template-box archwiki-template-box-note noexcerpt">

**翻译状态：**

- 本文（或部分内容）译自 <a href="https://wiki.archlinux.org/title/GnuPG" class="extiw" title="arch:GnuPG">GnuPG</a>，最近一次同步于 2023-07-30，若英文版本有所<a href="https://wiki.archlinux.org/title/GnuPG?diff=0&amp;oldid=783900" class="external text" rel="nofollow">更改</a>，则您可以帮助同步与[翻译](../zh-cn/Help:%E7%BF%BB%E8%AF%91.html "Help:翻译")更改的内容。
- 您可以在 <a href="https://wiki.archlinux.org/title/GnuPG_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)?action=history" class="external text" rel="nofollow">ArchWiki 的对应页面</a>找到本文翻译的**原始**修订历史。
- 本文可能与英文原文存在出入。

</div>

<div class="archwiki-template-meta-related-articles-start">

相关文章

- <a href="../zh-cn/Pacman/Package_signing.html" class="mw-redirect" title="Pacman/Package signing">pacman/Package signing</a>
- <a href="../zh-cn/Data-at-rest_encryption.html" class="mw-redirect" title="Data-at-rest encryption">Data-at-rest encryption</a>
- <a href="../zh-cn/List_of_applications/Security.html#Encryption,_signing,_steganography" class="mw-redirect" title="List of applications/Security">List of applications/Security#Encryption, signing, steganography</a>

</div>

根据<a href="https://www.gnupg.org/" class="external text" rel="nofollow">官方网站</a>：

GnuPG 是完整实现了 <a href="https://tools.ietf.org/html/rfc4880" class="external text" rel="nofollow">RFC4880</a>（即PGP）所定义的 <a href="https://openpgp.org/about/" class="external text" rel="nofollow">OpenPGP</a> 标准的自由软件。GnuPG 可以加密和签名你的数据和通讯信息，包含一个通用的密钥管理系统以及用于各种公钥目录的访问模块。GnuPG，简称 GPG，是一个易于与其它程序整合的命令行工具，拥有很多前端程序和函数库。GnuPG 还支持 S/MIME 和 Secure Shell (ssh)。

<div class="mw-heading mw-heading2">

## <span id=".E5.AE.89.E8.A3.85"></span>安装

</div>

<div class="archwiki-template-box archwiki-template-box-tip">

**提示：**一般情况下，GnuPG 已作为 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=pacman" class="external text" rel="nofollow">pacman</a></span><sup><span class="small">包</span></sup></span> 等软件包的依赖而被安装。

</div>

<a href="../zh-cn/Help:%E9%98%85%E8%AF%BB.html#%E5%AE%89%E8%A3%85%E8%BD%AF%E4%BB%B6%E5%8C%85" class="mw-redirect" title="安装">安装</a>软件包 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=gnupg" class="external text" rel="nofollow">gnupg</a></span><sup><span class="small">包</span></sup></span>。

软件包 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=pinentry" class="external text" rel="nofollow">pinentry</a></span><sup><span class="small">包</span></sup></span> 也会被同时安装，它是一些简单的 PIN 或 passphrase 输入对话框的合集，GnuPG 需要用这些对话框来输入密码。至于用哪个 pinentry 对话框，则是由 shell 脚本 `/usr/bin/pinentry` 来确定，先后顺序参考 [\#pinentry](#pinentry)。

如果要使用图形界面或集成了 GnuPG 的程序，请查看[加密、签名与信息隐藏软件](../zh-cn/%E5%BA%94%E7%94%A8%E7%A8%8B%E5%BA%8F%E5%88%97%E8%A1%A8/%E5%AE%89%E5%85%A8.html#%E5%8A%A0%E5%AF%86%EF%BC%8C%E7%AD%BE%E5%90%8D%EF%BC%8C%E9%9A%90%E5%86%99 "应用程序列表/安全")。

<div class="mw-heading mw-heading2">

## <span id=".E9.85.8D.E7.BD.AE"></span>配置

</div>

<div class="mw-heading mw-heading3">

### <span id=".E4.B8.BB.E7.9B.AE.E5.BD.95"></span>主目录

</div>

GnuPG 套件将密钥环和私钥存储在 GnuPG 主目录，并从中读取配置。默认路径为 `~/.gnupg`。有两种方法可以改变主目录的路径：

- 设置 `$GNUPGHOME` [环境变量](../zh-cn/%E7%8E%AF%E5%A2%83%E5%8F%98%E9%87%8F.html "环境变量")。
- 使用 `--homedir` 参数，如 `$ gpg --homedir `*`/path/to/dir`* <a href="https://www.gnupg.org/documentation/manuals/gnupg/GPG-Configuration-Options.html" class="external autonumber" rel="nofollow">[1]</a>。

默认情况下，主目录的<a href="../zh-cn/%E6%96%87%E4%BB%B6%E6%9D%83%E9%99%90%E4%B8%8E%E5%B1%9E%E6%80%A7.html" class="mw-redirect" title="Permissions">权限</a>设置为 `700`，其包含的文件的权限设置为 `600`。只有目录的所有者有权读取、写入和访问文件。这是出于安全目的，不应更改。如果此目录或其中的任何文件不遵循此安全措施，您将收到有关不安全文件和主目录权限的警告。

<div class="mw-heading mw-heading3">

### <span id=".E9.85.8D.E7.BD.AE.E6.96.87.E4.BB.B6"></span>配置文件

</div>

GnuPG 的所有行为都可以通过命令行参数进行配置。对于您希望成为默认参数的参数，可以将它们添加到相应的配置文件中：

- *gpg* 检查 *`gnupg_home`*`/gpg.conf`（用户）和 `/etc/gnupg/gpg.conf`（全局）<a href="https://dev.gnupg.org/T4788" class="external autonumber" rel="nofollow">[2]</a>。由于 *gpg* 是 GnuPG 的主要入口点，因此大部分感兴趣的配置都在这里。请参阅 <a href="https://www.gnupg.org/documentation/manuals/gnupg/GPG-Options.html" class="external text" rel="nofollow">GPG 选项</a>获取可能的选项。
- *dirmngr*会检查*`gnupg_home`*`/dirmngr.conf`和`/etc/gnupg/dirmngr.conf`两个配置文件。*dirmngr*是由 `gpg` 内部调用的程序，用于访问 PGP 密钥服务器<a href="https://www.gnupg.org/documentation/manuals/gnupg/Invoking-DIRMNGR.html" class="external autonumber" rel="nofollow">[3]</a>。请参阅<a href="https://www.gnupg.org/documentation/manuals/gnupg/Dirmngr-Options.html" class="external text" rel="nofollow">Dirmngr 选项</a>以了解可能的选项。

这两个配置文件涵盖了常见用例，但GnuPG套件中还有更多带有自己选项的辅助程序。请参阅<a href="https://www.gnupg.org/documentation/manuals/gnupg/index.html" class="external text" rel="nofollow">GnuPG 手册</a>获取详细列表。

创建所需的文件，并按照[\#主目录](#%E4%B8%BB%E7%9B%AE%E5%BD%95)中讨论的方法设置其权限为`600`。

在这些文件中添加任何你想要的长选项。不要写两个破折号，只需写选项的名称和所需的参数。例如，要始终使GnuPG在特定路径上使用密钥环，就像使用`gpg --no-default-keyring --keyring `*`keyring-path`*` ...`调用它一样：

*gnupg_home*/gpg.conf (或 /etc/gnupg/gpg.conf)

no-default-keyring\
keyring *keyring-path*\

其他示例可以在[\#参阅](#%E5%8F%82%E9%98%85)中找到。

另外，[pacman](../zh-cn/Pacman.html "Pacman") 在包签名验证方面使用了一组不同的配置文件。有关详细信息，请参阅<a href="../zh-cn/Pacman/Package_signing.html" class="mw-redirect" title="Pacman/Package signing">Pacman/Package signing</a>。

<div class="mw-heading mw-heading3">

### <span id=".E6.96.B0.E7.94.A8.E6.88.B7.E7.9A.84.E9.BB.98.E8.AE.A4.E9.80.89.E9.A1.B9"></span>新用户的默认选项

</div>

要给新建用户设定一些默认选项，把配置文件放到 `/etc/skel/.gnupg/`。系统创建新用户时，就会把文件复制到 GnuPG 目录。还有一个 *addgnupghome* 命令可以为已有用户创建新 GnuPG 主目录：

\# addgnupghome user1 user2\

此命令会检查 `/home/user1/.gnupg/` 和 `/home/user2/.gnupg/`，并从 skeleton 目录复制文件过去。具有已存在的 GnuPG 主目录的用户只需跳过即可。

<div class="mw-heading mw-heading2">

## <span id=".E7.94.A8.E6.B3.95"></span>用法

</div>

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**

- 如果需要一个 *`user-id`*，可以使用 key ID、指纹、用户名或电邮地址的部分等替代，GnuPG 对此的处理很灵活。
- 如果需要一个 *`key-id`*，可以给命令加上 `--keyid-format=long` 选项来查询。例如，如果想要查看主密匙，可以使用`gpg --list-secret-keys --keyid-format=long user-id`命令，*key-id* 是和 *sec* 同一行的十六进制散列值。

</div>

<div class="mw-heading mw-heading3">

### <span id=".E5.88.9B.E5.BB.BA.E5.AF.86.E9.92.A5.E5.AF.B9"></span>创建密钥对

</div>

用下面命令创建一个密钥对：

\$ gpg --full-gen-key\

使用 `--expert` 选项可以选择其它的加密算法，尤其是较新的<a href="https://zh.wikipedia.org/wiki/%E6%A4%AD%E5%9C%86%E6%9B%B2%E7%BA%BF%E5%AF%86%E7%A0%81%E5%AD%A6" class="extiw" title="zhwp:椭圆曲线密码学">ECC（椭圆曲线加密）</a>。

命令执行后会需要用户回答一些问题，大部分用户应该需要的是：

- 默认的“RSA 和 RSA”用于加密和解密。
- 默认的密钥长度，即 3072。增大长度到 4096“成本极高，但获益很少”。<a href="https://www.gnupg.org/faq/gnupg-faq.html#no_default_of_rsa4096" class="external text" rel="nofollow">这个帖子说明了为何 GPG 不默认使用 RSA-4096</a>。
- 过期日期。大部分用户可以选择一年。这样即使无法访问密钥环，用户也知道密钥已经过期。如果有需要，可以不重新签发密钥就延长过期时间。
- 用户名和电子邮件。可以给同样的密钥不同的身份，比如给同一个密钥关联多个电子邮件。
- **不填写**可选注释。注释字段并没有被<a href="https://lists.gnupg.org/pipermail/gnupg-devel/2015-July/030150.html" class="external text" rel="nofollow">很好地定义</a>，作用有限。
- 一个安全的密钥口令。可参考<a href="../zh-cn/%E5%AE%89%E5%85%A8.html#%E9%80%89%E6%8B%A9%E5%AE%89%E5%85%A8%E7%9A%84%E5%AF%86%E7%A0%81" class="mw-redirect" title="Security">如何选择安全的密码</a>。

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**任何导入密钥的人都可以看到这里的用户名和电子邮件地址。

</div>

<div class="archwiki-template-box archwiki-template-box-tip">

**提示：**较简单的 `--gen-key` 选项对密钥类型、密钥长度、过期时间均使用默认值，仅询问姓名和电邮地址。

</div>

<div class="mw-heading mw-heading3">

### <span id=".E6.9F.A5.E7.9C.8B.E5.AF.86.E9.92.A5"></span>查看密钥

</div>

查看公钥：

\$ gpg --list-keys\

查看私钥:

\$ gpg --list-secret-keys\

<div class="mw-heading mw-heading3">

### <span id=".E5.AF.BC.E5.87.BA.E5.85.AC.E9.92.A5"></span>导出公钥

</div>

GPG 的主要用途是通过公钥加密信息以确保其私密性。你可以分发自己的公钥，而其他人通过该公钥加密发给你的信息。而你的私钥必须**始终**保密，否则将会威胁信息的私密性。相关内容，请参见<a href="https://zh.wikipedia.org/wiki/%E5%85%AC%E5%BC%80%E5%AF%86%E9%92%A5%E5%8A%A0%E5%AF%86" class="extiw" title="zhwp:公开密钥加密">公开密钥加密</a>。

所以其他人需要有你的公钥才能给你发加密信息。

以下命令可生成公钥的 ASCII 版本（`--armor` 参数）（例如用于以电子邮件发布）：

\$ gpg --export --armor --output *public-key*.asc *user-id*\

此外，还可以通过[密钥服务器](#%E4%BD%BF%E7%94%A8%E5%85%AC%E9%92%A5%E6%9C%8D%E5%8A%A1%E5%99%A8)分发公钥。

<div class="archwiki-template-box archwiki-template-box-tip">

**提示：**

- 使用 `--no-emit-version` 可以避免打印版本号，通过配置文件也可以进行此设置。
- 可以省略 `user-id` 以导出密钥环内所有的公钥。这可以用来分享多个身份，或是将其导入到另一个程序，比如 [Thunderbird](../zh-cn/Thunderbird.html#Use_OpenPGP_with_external_GnuPG "Thunderbird")。

</div>

<div class="mw-heading mw-heading3">

### <span id=".E5.AF.BC.E5.85.A5.E5.85.AC.E5.85.B1.E5.AF.86.E9.92.A5"></span>导入公共密钥

</div>

要给其他人发送加密信息，或者验证他们的签名，就需要他们的公钥。通过文件 *`public.key`* 导入公钥到密钥环：

\$ gpg --import *public.key*.asc\

此外，还可以通过[\#密钥服务器](#%E5%AF%86%E9%92%A5%E6%9C%8D%E5%8A%A1%E5%99%A8)导入公钥。

如想导入某个 key ID 以安装某个 Arch Linux 软件包，可参见 <a href="../zh-cn/Pacman/Package_signing.html#%E7%AE%A1%E7%90%86%E5%AF%86%E9%92%A5" class="mw-redirect" title="Pacman/Package signing">pacman 的相关说明</a>和 [makepkg 的相关说明](../zh-cn/Makepkg.html#%E9%AA%8C%E8%AF%81%E7%AD%BE%E5%90%8D "Makepkg")。

<div class="mw-heading mw-heading3">

### <span id=".E4.BD.BF.E7.94.A8.E5.85.AC.E9.92.A5.E6.9C.8D.E5.8A.A1.E5.99.A8"></span>使用公钥服务器

</div>

<div class="mw-heading mw-heading4">

#### <span id=".E5.8F.91.E5.B8.83.E5.85.AC.E9.92.A5"></span>发布公钥

</div>

你可以将你的公钥注册到一个公共的密钥服务器，这样其他人不用联系你就能获取到你的公钥：

\$ gpg --send-keys *key-id*\

<div class="archwiki-template-box archwiki-template-box-warning">

**警告：**一旦一个公钥被发送到密钥服务器，它就无法从服务器上删除。<a href="https://pgp.mit.edu/faq.html" class="external text" rel="nofollow">这个网页</a>解释了原因。

</div>

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**与公钥相关联的电邮地址一旦公开，可能会被垃圾邮件发送者盯上。请做好相应的防护措施。

</div>

<div class="mw-heading mw-heading4">

#### <span id=".E6.90.9C.E7.B4.A2.E5.92.8C.E6.8E.A5.E6.94.B6.E5.85.AC.E9.92.A5"></span>搜索和接收公钥

</div>

要查询公钥的详细信息而不是导入，执行：

\$ gpg --search-keys *user-id*\

要导入一个公钥：

\$ gpg --receive-keys *key-id*\

要使用密钥服务器中的最新版本刷新/更新钥匙串：

\$ gpg --refresh-keys\

<div class="archwiki-template-box archwiki-template-box-warning">

**警告：**

- 您应该通过将其指纹与所有者在独立来源（例如直接联系该人）上发布的指纹进行比较，以验证检索到的公钥的真实性。请参阅 <a href="https://en.wikipedia.org/wiki/Public_key_fingerprint" class="extiw" title="wikipedia:Public key fingerprint">Wikipedia:Public key fingerprint</a> 获取更多信息。
- 接收密钥时，建议使用长密钥 ID 或完整指纹。使用短密钥 ID 可能会导致冲突。所有具有短密钥 ID 的密钥都将被导入，参见 <a href="https://lore.kernel.org/lkml/20160815153401.9EC2BADC2C@smtp.postman.i2p/" class="external text" rel="nofollow">在野外发现的伪密钥</a>作为示例。

</div>

<div class="archwiki-template-box archwiki-template-box-tip">

**提示：**将 `auto-key-retrieve` 添加到 [GPG 配置文件](#Configuration_files)中，将在需要时自动从密钥服务器获取密钥。这不会对安全性造成妥协，但可以被视为**侵犯隐私**；请参阅<span class="plainlinks archwiki-template-man" title="$ man 1 gpg"><a href="https://man.archlinux.org/man/gpg.1" class="external text" rel="nofollow">gpg(1)</a></span>中的"web bug"。

</div>

\

<div class="mw-heading mw-heading4">

#### <span id=".E5.85.AC.E9.92.A5.E6.9C.8D.E5.8A.A1.E5.99.A8"></span>公钥服务器

</div>

常见的公钥服务器：

- <a href="https://keyserver.ubuntu.com" class="external text" rel="nofollow">Ubuntu Keyserver</a>：联盟式（federated）、没有验证、公钥不可删除。
- <a href="https://keys.mailvelope.com" class="external text" rel="nofollow">Mailvelope Keyserver</a>：中心式、验证电邮 ID、公钥可删除。
- <a href="https://keys.openpgp.org" class="external text" rel="nofollow">keys.openpgp.org</a>：中心式、验证电邮 ID、公钥可删除、没有第三方签名（即不支持信任网络）。

<a href="https://en.wikipedia.org/wiki/Key_server_(cryptographic)#Keyserver_examples" class="extiw" title="wikipedia:Key server (cryptographic)">维基百科（英文）</a>上有更多的服务器。

备选公钥服务器可以在[\#配置文件](#%E9%85%8D%E7%BD%AE%E6%96%87%E4%BB%B6)中的 `keyserver` 选项中注明，例如：

~/.gnupg/dirmngr.conf

keyserver hkp://keyserver.ubuntu.com\

当常规服务器无法正常工作时，临时使用另一台服务器很方便。例如，可以通过以下方法实现：

\$ gpg --keyserver *hkps://keys.openpgp.org/* --search-keys *user-id*\

<div class="archwiki-template-box archwiki-template-box-tip">

**提示：**

- 若遇到错误信息 `gpg: keyserver receive failed: General error`，且你使用了默认的 HKPS 公钥服务器池，请在 `dirmngr.conf` 中设置 HKPS 池证书： `hkp-cacert /usr/share/gnupg/sks-keyservers.netCA.pem` 然后杀掉旧的 `dirmngr` 进程。
- 若遇到错误信息 `gpg: keyserver receive failed: Connection refused`，可尝试更换 DNS 服务器。
- 你可以通过 `--use-tor` 选项或 [Torsocks](../zh-cn/Tor.html#Torsocks "Tor") 来使用 [Tor](../zh-cn/Tor.html "Tor") 连接密钥服务器。详见<a href="https://gnupg.org/blog/20151224-gnupg-in-november-and-december.html" class="external text" rel="nofollow">这个网页</a>。
- 你可以通过设置[环境变量](../zh-cn/%E7%8E%AF%E5%A2%83%E5%8F%98%E9%87%8F.html "环境变量") `http_proxy` 并在 `dirmngr.conf` 中写入 `honor-http-proxy` 以使用代理访问密钥服务器。或者，你也可以通过在 `dirmngr.conf` 中写入 `http-proxy `*`host[:port]`* 以直接覆盖环境变量`http_proxy`来使用代理。[重启](../zh-cn/Systemd.html#%E4%BD%BF%E7%94%A8%E5%8D%95%E5%85%83 "Systemd") `dirmngr.service` [用户服务](../zh-cn/Systemd/%E7%94%A8%E6%88%B7.html "Systemd/用户")以使改动生效。
- 如果连接到密钥服务器失败并显示 `gpg: keyserver receive failed: Server indicated a failure`，您可能需要将 gpg 配置为使用备用端口。例如，要在 Ubuntu 的密钥服务器上使用端口 80，请使用 `keyserver hkp://keyserver.ubuntu.com:80`。

</div>

<div class="mw-heading mw-heading3">

### <span id=".E7.BD.91.E7.BB.9C.E5.85.AC.E9.92.A5.E7.9B.AE.E5.BD.95"></span>网络公钥目录

</div>

网络公钥服务（Web Key Service，WKS）协议是公钥分发的新<a href="https://datatracker.ietf.org/doc/draft-koch-openpgp-webkey-service/" class="external text" rel="nofollow">标准</a>。电子邮件域将提供其自己的公钥服务器，称为网络公钥目录（<a href="https://wiki.gnupg.org/WKD" class="external text" rel="nofollow">Web Key Directory，WKD</a>）。在高于 2.1.16 版本的 GPG 中，在依电子邮件地址（如`user@example.com`）加密时，如果该公钥不在本地密钥环中，GPG 将以 HTTPS 向电子邮件的域（`example.com`）查询 OpenPGP 公钥。选项 `auto-key-locate` 将在本地密钥环内无该电邮地址的公钥时，按 WKD 协议查找公钥。

\$ gpg --recipient *user@example.org* --auto-key-locate --encrypt *doc*\

<a href="https://wiki.gnupg.org/WKD#Implementations" class="external text" rel="nofollow">GnuPG Wiki</a> 举出了一些支持 WKD 的电子邮件服务商。若电邮地址域由你控制，可遵循<a href="https://wiki.gnupg.org/WKDHosting" class="external text" rel="nofollow">这份指南</a>在你的域上启用 WKD。可用<a href="https://metacode.biz/openpgp/web-key-directory" class="external text" rel="nofollow">这个地址</a>检查你的公钥是否能在 WKD 中找到。

<div class="mw-heading mw-heading3">

### <span id=".E5.8A.A0.E5.AF.86.E4.B8.8E.E8.A7.A3.E5.AF.86"></span>加密与解密

</div>

<div class="mw-heading mw-heading4">

#### <span id=".E9.9D.9E.E5.AF.B9.E7.A7.B0.E5.8A.A0.E8.A7.A3.E5.AF.86"></span>非对称加解密

</div>

在加密（参数`--encrypt`或`-e`）一个文件或一条信息给另外一个人（参数`--recipient`或`-r`）之前，你需要先[\#导入](#%E5%AF%BC%E5%85%A5%E5%85%AC%E5%85%B1%E5%AF%86%E9%92%A5)他的公钥。如果你还没有[\#创建](#%E5%88%9B%E5%BB%BA%E5%AF%86%E9%92%A5%E5%AF%B9)自己的密钥对，请先创建。

要加密一个名为 doc 的文件：

\$ gpg --recipient *user-id* --encrypt *doc*\

要解密（参数 `--decrypt` 或 `-d`）一个用你的公钥加密的、名为 *doc*.gpg 的文件：

\$ gpg --output *doc* --decrypt *doc*.gpg\

*gpg* 会提示你输入密钥口令，并将 *doc*.gpg 中的数据解密到 *doc*。如果你忽略了参数 `-o`（`--output`），*gpg* 将会直接输出解密的信息。

<div class="archwiki-template-box archwiki-template-box-tip">

**提示：**

- 使用参数 `--armor` 以 ASCII 编码的形式加密文件（适用于复制与粘贴文本文件格式的消息）。
- 使用 `-R `*`<user-id>`* 或 `--hidden-recipient `*`user-id`* 代替 `-r` 可以不将收件人的指纹 ID 放入加密的消息中。这有助于隐藏收件人的信息，是针对流量分析的一个有限对策。
- 使用 `--no-emit-version` 以避免打印版本号。也可将相应配置添加到你的配置文件中。
- 你可以使用 GPG 将自己作为收件人来加密敏感文件，但是每次只能压缩一个文件——尽管你可以将多个文件压缩后再进行加密。如果需要加密一个目录或一整个文件系统，请参见 <a href="../zh-cn/Data-at-rest_encryption.html#Available_methods" class="mw-redirect" title="Data-at-rest encryption">Data-at-rest encryption#Available methods</a>。

</div>

<div class="mw-heading mw-heading4">

#### <span id=".E5.AF.B9.E7.A7.B0.E5.8A.A0.E8.A7.A3.E5.AF.86"></span>对称加解密

</div>

对称加密不需要生成密钥对，可用来简单地给文件加上密码。使用 `-c`/`--symmetric` 参数来进行对称加密：

\$ gpg -c *doc*\

下面的例子：

- 用口令给 *`doc`* 进行了对称加密
- 用 AES-256 加密算法对口令进行加密
- 用 SHA-512 摘要算法对口令进行打乱
- 打乱 65536 次

\$ gpg -c --s2k-cipher-algo AES256 --s2k-digest-algo SHA512 --s2k-count 65536 *doc*\

下面的命令可解密以口令对称加密的 *`doc`*`.gpg` 文件，并将解密的文档输出到同一目录下的 *`doc`* 文件中：

\$ gpg --output *doc* --decrypt *doc*.gpg\

<div class="mw-heading mw-heading4">

#### <span id=".E7.9B.AE.E5.BD.95.E6.93.8D.E4.BD.9C"></span>目录操作

</div>

可用 <span class="plainlinks archwiki-template-man" title="$ man 1 gpgtar"><a href="https://man.archlinux.org/man/gpgtar.1" class="external text" rel="nofollow">gpgtar(1)</a></span> 对目录进行加密和解密。

加密：

\$ gpgtar -c -o *dir*.gpg *dir*\

解密：

\$ gpgtar -d *dir*.gpg\

<div class="mw-heading mw-heading2">

## <span id=".E5.AF.86.E9.92.A5.E7.BB.B4.E6.8A.A4"></span>密钥维护

</div>

<div class="mw-heading mw-heading3">

### <span id=".E5.A4.87.E4.BB.BD.E4.BD.A0.E7.9A.84.E7.A7.81.E9.92.A5"></span>备份你的私钥

</div>

用如下命令备份你的私钥。

\$ gpg --export-secret-keys --armor --output *private-key*.asc *user-id*\

请注意，上述命令将要求您输入密钥的密码。这是因为，否则任何获得上述导出文件访问权限的人都可以像您一样对文档进行加密和签名，而无需知道您的密码。

<div class="archwiki-template-box archwiki-template-box-warning">

**警告：**

- 口令通常是密钥安全方面最薄弱的环节。最好把导出的文件放在另一个系统或者设备里，比如物理保险柜或者加密驱动器中。这是当你遇到设备被盗、磁盘故障等情况时恢复对密钥控制权的唯一安全措施。
- 这种备份方式有一些安全局限性，这篇文章 <a href="https://web.archive.org/web/20210803213236/https://habd.as/post/moving-gpg-keys-privately/" class="external free" rel="nofollow">https://web.archive.org/web/20210803213236/https://habd.as/post/moving-gpg-keys-privately/</a> 中有关于用 *gpg* 备份和导入密钥的更加安全的办法。

</div>

用如下命令导入你的私钥备份

\$ gpg --import *private-key*.asc\

<div class="archwiki-template-box archwiki-template-box-tip">

**提示：** 你可以用 [Paperkey](../zh-cn/Paperkey.html "Paperkey") 来把私钥导出为明文文本或条形码，并打印出来存档。

</div>

<div class="mw-heading mw-heading3">

### <span id=".E5.A4.87.E4.BB.BD.E4.BD.A0.E7.9A.84.E5.90.8A.E9.94.80.E8.AF.81.E4.B9.A6"></span>备份你的吊销证书

</div>

生成新密钥对的时候会同时生成吊销证书，默认存放在 `~/.gnupg/openpgp-revocs.d/` 下，证书的文件名是对应的密钥的指纹。 你也可以用以下命令手动生成吊销证书：

\$ gpg --gen-revoke --armor --output *revcert.asc* *user-id*\

如果密钥丢失或泄露，此证书可用于 [\#吊销密钥](#%E5%90%8A%E9%94%80%E5%AF%86%E9%92%A5)。如果你无法访问密钥，则无法使用上述命令生成新的吊销证书，那么备份将非常有用。吊销证书很短，你可以把他打印出来然后在需要使用的时候手动输入到电脑里。

<div class="archwiki-template-box archwiki-template-box-warning">

**警告：**任何能接触到吊销证书的人都可以吊销你的密钥对，而且无法撤消。所以请像保护私钥一样保护你的吊销证书。

</div>

<div class="mw-heading mw-heading3">

### <span id=".E7.BC.96.E8.BE.91.E4.BD.A0.E7.9A.84.E5.AF.86.E9.92.A5"></span>编辑你的密钥

</div>

运行 `gpg --edit-key `*`user-id`* 命令将会出现一个菜单，该菜单使你能够执行大部分密钥管理相关的任务。

在编辑密钥子菜单中输入 `help` 命令可以显示完整的命令列表。以下是一些有用的命令：

\> passwd       # 修改密码短语\
\> clean        # 压缩任何不再可用的用户ID（例如已撤销或已过期）\
\> revkey       # 撤销密钥\
\> addkey       # 向该密钥添加子密钥\
\> expire       # 更改密钥过期时间\
\> adduid       # 添加附加的名称、注释和电子邮件地址\
\> addphoto     # 向密钥添加照片（必须是JPG格式，推荐大小为240x288，当提示时输入完整路径）\

<div class="archwiki-template-box archwiki-template-box-tip">

**提示：**如果你有多个电子邮件账户，你可以使用 `adduid` 命令将每个账户都添加为一个身份。然后你可以将你最喜欢的账户设置为 `primary`。

</div>

<div class="mw-heading mw-heading3">

### <span id=".E5.AF.BC.E5.87.BA.E5.AD.90.E5.AF.86.E9.92.A5"></span>导出子密钥

</div>

如果您计划在多个设备上使用相同的密钥，您可能希望去除主密钥，只保留在较不安全的系统上的最低限度的加密子密钥。

首先，找出您想要导出的子密钥。

\$ gpg --list-secret-keys --with-subkey-fingerprint\

仅选择要导出的子密钥。

\$ gpg -a --export-secret-subkeys \[子密钥id\]! \> /tmp/subkey.gpg\

<div class="archwiki-template-box archwiki-template-box-warning">

**警告：**如果您忘记添加“!”，所有子密钥都将被导出。

</div>

到此为止，您可以停止了，但最好同时更改密码。将密钥导入临时文件夹。

\$ gpg --homedir /tmp/gpg --import /tmp/subkey.gpg\
\$ gpg --homedir /tmp/gpg --edit-key *用户id*\
\> passwd\
\> save\
\$ gpg --homedir /tmp/gpg -a --export-secret-subkeys *\[子密钥id\]*! \> /tmp/subkey.altpass.gpg\

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**您会收到一个警告，说明主密钥不可用且密码未更改，但可以安全地忽略，因为子密钥的密码已经更改。

</div>

此时，您现在可以在其他设备上使用 `/tmp/subkey.altpass.gpg`。

<div class="mw-heading mw-heading3">

### <span id=".E5.BB.B6.E9.95.BF.E8.BF.87.E6.9C.9F.E6.97.A5.E6.9C.9F"></span>延长过期日期

</div>

<div class="archwiki-template-box archwiki-template-box-warning">

**警告：永远不要**删除已过期或已吊销的子密钥，除非你有充分的理由。这样做将导致你无法解密使用旧子密钥加密的文件。请**仅**从其他用户那里删除已过期或已吊销的密钥以清理你的密钥环。

</div>

在你的子密钥上设置一个过期日期是一个好的做法，这样如果你失去了对密钥的访问（例如，你忘记了密码短语），密钥将不会继续被他人无限期地使用。当密钥过期时，延长过期日期相对简单：

\$ gpg --edit-key *用户ID*\
\> expire\

你将被要求输入一个新的过期日期，以及用于签署新过期日期的你的密钥密码短语。

对于任何其他已过期的子密钥，重复此步骤：

\> key 1\
\> expire\

最后，保存更改并退出：

\> save\

将其更新到密钥服务器。

\$ gpg --keyserver keyserver.ubuntu.com --send-keys *key-id*\

或者，如果你在多台电脑上使用此密钥，你可以导出带有新签署过期日期的公钥，并在这些计算机上导入它：

\$ gpg --export --output pubkey.gpg *user-id*\
\$ gpg --import pubkey.gpg\

无需重新导出你的私钥或更新你的备份：主密钥本身永不过期，只需要公钥和子密钥上的过期日期的签名。

<div class="mw-heading mw-heading3">

### <span id=".E8.BD.AE.E6.8D.A2.E5.AD.90.E5.AF.86.E9.92.A5"></span>轮换子密钥

</div>

<div class="archwiki-template-box archwiki-template-box-warning">

**警告：永远不要**删除过期或被撤销的子密钥，除非有充分的理由。这样做将导致您无法解密使用旧子密钥加密的文件。请**仅**从其他用户那里删除过期或被撤销的密钥以清理您的密钥环。

</div>

或者，如果您希望在子密钥过期后完全停止使用它们，您可以创建新的子密钥。请提前几周进行此操作，以便其他人可以更新他们的密钥环。

<div class="archwiki-template-box archwiki-template-box-tip">

**提示：**您不需要仅因为密钥过期而创建新密钥。您可以延长过期日期，请参阅部分[\#延长过期日期](#%E5%BB%B6%E9%95%BF%E8%BF%87%E6%9C%9F%E6%97%A5%E6%9C%9F)。

</div>

创建新的子密钥（对签名和加密密钥都重复此操作）

\$ gpg --edit-key *user-id*\
\> addkey\

回答它询问的以下问题（参见[\#创建密钥对](#%E5%88%9B%E5%BB%BA%E5%AF%86%E9%92%A5%E5%AF%B9)以获取建议的设置）。

保存更改

\> save\

将其更新到密钥服务器。

\$ gpg --keyserver *pgp.mit.edu* --send-keys *user-id*\

您还需要导出一份最新的私钥备份。有关如何执行此操作的详细信息，请参见[\#备份私钥](#%E5%A4%87%E4%BB%BD%E7%A7%81%E9%92%A5)。

<div class="archwiki-template-box archwiki-template-box-tip">

**提示：**撤销过期的子密钥是不必要的，而且可能会被认为是不好的做法。如果您不断撤销密钥，可能会导致其他人对您缺乏信心。

</div>

<div class="mw-heading mw-heading3">

### <span id=".E5.90.8A.E9.94.80.E5.AF.86.E9.92.A5"></span>吊销密钥

</div>

如果密钥被泄露、被取代、不再使用或者您忘记了密码，应该执行密钥撤销操作。这可以通过将密钥与密钥的撤销证书合并来完成。

如果您无法再访问您的密钥对，请首先[导入您自己的公钥](#%E5%AF%BC%E5%85%A5%E5%85%AC%E9%92%A5)。 然后，要撤销密钥，请导入保存在[撤销证书](#%E5%A4%87%E4%BB%BD%E6%92%A4%E9%94%80%E8%AF%81%E4%B9%A6)中的文件：

 \$ gpg --import *revcert*.asc\

现在，撤销操作需要公开。[使用密钥服务器](#%E4%BD%BF%E7%94%A8%E5%AF%86%E9%92%A5%E6%9C%8D%E5%8A%A1%E5%99%A8)将撤销的密钥发送到公共 PGP 服务器（如果您以前使用过），否则，将撤销的密钥导出到文件并分发给您的通信伙伴。

<div class="mw-heading mw-heading2">

## <span id=".E7.AD.BE.E5.90.8D"></span>签名

</div>

签名用于认证和时间戳文档。如果文档被修改，验证签名将失败。与使用公钥加密文档不同，签名是使用用户的私钥创建的。文档的接收者然后使用发送者的公钥验证签名。

<div class="mw-heading mw-heading3">

### <span id=".E5.88.9B.E5.BB.BA.E7.AD.BE.E5.90.8D"></span>创建签名

</div>

<div class="mw-heading mw-heading4">

#### <span id=".E7.AD.BE.E7.BD.B2.E6.96.87.E4.BB.B6"></span>签署文件

</div>

要签署文件，请使用`-s`/`--sign`标志：

\$ gpg --output *doc*.sig --sign *doc*\

*`doc`*`.sig`包含原始文件*`doc`*的压缩内容和以二进制格式表示的签名，但文件并未加密。但是，您可以将签名与[加密](#%E5%8A%A0%E5%AF%86%E5%92%8C%E8%A7%A3%E5%AF%86)结合使用。

<div class="mw-heading mw-heading4">

#### <span id=".E4.BB.A5.E5.8F.AF.E8.AF.BB.E5.BD.A2.E5.BC.8F.E7.AD.BE.E5.90.8D.E6.96.87.E4.BB.B6.E6.88.96.E6.B6.88.E6.81.AF"></span>以可读形式签名文件或消息

</div>

要签署文件而无需将其压缩为二进制格式，请使用：

\$ gpg --output *doc*.sig --clearsign *doc*\

在这里，原始文件*`doc`*的内容和签名以可读形式存储在*`doc`*`.sig`中。

<div class="mw-heading mw-heading4">

#### <span id=".E5.88.9B.E5.BB.BA.E7.8B.AC.E7.AB.8B.E7.9A.84.E7.AD.BE.E5.90.8D.E6.96.87.E4.BB.B6"></span>创建独立的签名文件

</div>

要创建一个单独的签名文件，以便与文档或文件本身份开分发，请使用`--detach-sig`标志：

\$ gpg --output *doc*.sig --detach-sig *doc*\

在这里，签名存储在*`doc`*`.sig`中，但*`doc`*的内容不会存储在其中。这种方法常用于分发软件项目，以允许用户验证程序未被第三方修改。

<div class="mw-heading mw-heading3">

### <span id=".E9.AA.8C.E8.AF.81.E7.AD.BE.E5.90.8D"></span>验证签名

</div>

要验证签名，请使用`--verify`标志：

\$ gpg --verify *doc*.sig\

其中*`doc`*`.sig`是包含您要验证的签名的已签名文件。

如果您要验证一个已分离签名，验证时必须同时存在已签名的数据文件和签名文件。例如，要验证 Arch Linux 的最新 iso 文件，您可以执行以下操作：

\$ gpg --verify archlinux-*version*.iso.sig\

其中`archlinux-`*`version`*`.iso`必须位于相同的目录中。

您还可以使用第二个参数指定已签名的数据文件：

\$ gpg --verify archlinux-*version*.iso.sig */path/to/*archlinux-*version*.iso\

如果一个文件除了被签名外还被加密，只需[解密](#%E5%8A%A0%E5%AF%86%E5%92%8C%E8%A7%A3%E5%AF%86)该文件，其签名也将被验证。

<div class="mw-heading mw-heading2">

## gpg-agent

</div>

*gpg-agent* 主要用作守护进程，用于请求和缓存密钥链的密码。这在外部程序（如邮件客户端）使用 GnuPG 时十分有用。 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=gnupg" class="external text" rel="nofollow">gnupg</a></span><sup><span class="small">包</span></sup></span> 带有默认自动启动的 [systemd/用户](../zh-cn/Systemd/%E7%94%A8%E6%88%B7.html "Systemd/用户")套接字。这些套接字分别是 `gpg-agent.socket`、`gpg-agent-extra.socket`、`gpg-agent-browser.socket`、`gpg-agent-ssh.socket` 和 `dirmngr.socket`。

- *gpg* 使用 `gpg-agent.socket` 连接到 *gpg-agent* 守护进程。
- `gpg-agent-extra.socket` 的作用是在本地建立一个转发自远程系统的 Unix 域套接字。这样就可以在远程系统上使用 *gpg*，而无需向远程系统公开私钥。有关详细信息，请参阅 <span class="plainlinks archwiki-template-man" title="$ man 1 gpg-agent"><a href="https://man.archlinux.org/man/gpg-agent.1" class="external text" rel="nofollow">gpg-agent(1)</a></span>。
- `gpg-agent-browser.socket` 允许 Web 浏览器访问 *gpg-agent* 守护进程。
- <a href="../zh-cn/%E5%AE%89%E5%85%A8%E5%A4%96%E5%A3%B3%E5%8D%8F%E8%AE%AE.html" class="mw-redirect" title="SSH">SSH</a> 使用 `gpg-agent-ssh.socket` 缓存 *ssh-add* 程序添加的 <a href="../zh-cn/SSH_keys.html" class="mw-redirect" title="SSH keys">SSH keys</a>。有关必要的配置，请参阅 [\#SSH agent](#SSH_agent)。
- `dirmngr.socket` 启动一个 GnuPG 守护进程来处理与 keyserver 的连接。

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**如果您没有使用默认的 GnuPG [\#目录位置](#%E7%9B%AE%E5%BD%95%E4%BD%8D%E7%BD%AE), 您需要[编辑](../zh-cn/Systemd.html#%E4%BF%AE%E6%94%B9%E7%8E%B0%E5%AD%98%E5%8D%95%E5%85%83%E6%96%87%E4%BB%B6 "Systemd")所有套接字文件让其使用 `gpgconf --list-dirs` 的值。 套接字名称使用非默认 GnuPG 主目录的哈希 <a href="https://github.com/gpg/gnupg/blob/260bbb4ab27eab0a8d4fb68592b0d1c20d80179c/common/homedir.c#L710-L713" class="external autonumber" rel="nofollow">[4]</a>，您可以硬编码它不用担心它的改变。

</div>

\

<div class="mw-heading mw-heading3">

### <span id=".E9.85.8D.E7.BD.AE_2"></span>配置

</div>

gpg-agent 用 `~/.gnupg/gpg-agent.conf` 文件配置。配置选项列在 <span class="plainlinks archwiki-template-man" title="$ man 1 gpg-agent"><a href="https://man.archlinux.org/man/gpg-agent.1" class="external text" rel="nofollow">gpg-agent(1)</a></span> 中。例如，您可以更改默认密钥的缓存 ttl：

~/.gnupg/gpg-agent.conf

default-cache-ttl 3600\

<div class="archwiki-template-box archwiki-template-box-tip">

**提示：**要缓存整个会话的密码(passphrase)，请运行以下命令：

\$ /usr/lib/gnupg/gpg-preset-passphrase --preset XXXXX\

其中 XXXXX 是 keygrip。您可以在运行 `gpg --with-keygrip -K` 时获取它的值。密码(passphrase)将一直保存到 `gpg-agent` 重新启动为止。如果设置了 `default-cache-ttl` 值，会优先采用它。

</div>

在 Linux 中，为了允许预设的密码短语，需要通过使用 `--allow-preset-passphrase` 启动 gpg-agent，或在 `~/.gnupg/gpg-agent.conf` 中设置`allow-preset-passphrase`。

<div class="mw-heading mw-heading3">

### <span id=".E9.87.8D.E6.96.B0.E5.8A.A0.E8.BD.BD_gpg-agent"></span>重新加载 gpg-agent

</div>

在修改完配置之后，用 *gpg-connect-agent* 重新加载 gpg-agent：

\$ gpg-connect-agent reloadagent /bye\

该命令应该输出 `OK`。

但是在某些情况下，只是重新启动可能不够，比如当 `keep-screen` 被添加到 gpg-agent 配置中时。在这种情况下，您首先需要终止正在进行的 gpg-agent 进程，然后按上述方法重新启动它。

<div class="mw-heading mw-heading3">

### pinentry

</div>

`gpg-agent` 可以在 `pinentry-program` 中设定，以便使用特定的 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=pinentry" class="external text" rel="nofollow">pinentry</a></span><sup><span class="small">包</span></sup></span> 用户界面来提示用户输入(passphrase)。例如：

~/.gnupg/gpg-agent.conf

pinentry-program /usr/bin/pinentry-curses\

还有其他 pinentry 程序可选，参考 `pacman -Ql pinentry | grep /usr/bin/` 的输出结果。

<div class="archwiki-template-box archwiki-template-box-tip">

**提示：**

- 为了使用 `/usr/bin/pinentry-kwallet` 您需要安装软件包 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://aur.archlinux.org/packages/kwalletcli/" class="external text" rel="nofollow">kwalletcli</a></span><sup><span class="small">AUR</span></sup></span>。
- 所有的默认 pinentry 程序（除了 `/usr/bin/pinentry-emacs`）都支持 <a href="https://specifications.freedesktop.org/secret-service/" class="external text" rel="nofollow">DBus Secret Service API</a> ，它允许通过一个兼容的管理器(如 <a href="../zh-cn/GNOME_Keyring.html" class="mw-redirect" title="GNOME Keyring">GNOME Keyring</a> 或 <a href="/wzh/index.php?title=KeePass&amp;action=edit&amp;redlink=1" class="new" title="KeePass（页面不存在）">KeePassXC</a>)记住密码。

</div>

记得在修改完配置后要[\#重新加载 gpg-agent](#%E9%87%8D%E6%96%B0%E5%8A%A0%E8%BD%BD_gpg-agent)。

<div class="mw-heading mw-heading3">

### <span id=".E7.BC.93.E5.AD.98.E5.AF.86.E7.A0.81"></span>缓存密码

</div>

`max-cache-ttl` 和 `default-cache-ttl` 定义 gpg-agent 的密码缓存时间（秒）。要在会话中只输入一次密码，设置一个非常高的值即可，例如：

gpg-agent.conf

max-cache-ttl 60480000\
default-cache-ttl 60480000\

对于 SSH 仿真模式下的密码缓存，需要设置 `default-cache-ttl-ssh` 和 `max-cache-ttl-ssh`，例如：

gpg-agent.conf

default-cache-ttl-ssh 60480000\
max-cache-ttl-ssh 60480000\

<div class="mw-heading mw-heading3">

### Unattended passphrase

</div>

从 GnuPG 2.1.0 开始，需要使用 gpg-agent 和 pinentry，这可能会破坏使用 `--passphrase-fd 0` 命令行选项从 STDIN 传入的密码短语的向后兼容性。为了拥有与旧版本相同类型的功能，必须做两件事：

首先，编辑 gpg-agent 配置允许 *loopback* pinentry 模式 :

~/.gnupg/gpg-agent.conf

allow-loopback-pinentry\

如果 gpg-agent 正在运行，[重新加载](#%E9%87%8D%E6%96%B0%E5%8A%A0%E8%BD%BD_gpg-agent)它使配置生效。

其次，要么应用程序需要更新，以包括一个命令行参数来使用回环模式，例如：

\$ gpg --pinentry-mode loopback ...\

如果不可能这样做，则可以将选项添加到配置中：

~/.gnupg/gpg.conf

pinentry-mode loopback\

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**上游作者指出，在 `gpg.conf` 中设置 `pinentry-mode loopback` 可能会破坏其他用法，如果可能，最好使用命令行选项。<a href="https://dev.gnupg.org/T1772" class="external autonumber" rel="nofollow">[5]</a>

</div>

<div class="mw-heading mw-heading3">

### <span id="SSH_.E4.BB.A3.E7.90.86"></span>SSH 代理

</div>

*gpg-agent* 具有 OpenSSH 代理仿真功能。如果您正在使用 GnuPG 套件，可以考虑使用 *gpg-agent* 来缓存 SSH 密钥。此外，一些用户可能更喜欢 GnuPG 代理提供的 PIN 输入对话框作为其密码(passphrase)管理的一部分。

<div class="mw-heading mw-heading4">

#### <span id=".E8.AE.BE.E7.BD.AE_SSH_AUTH_SOCK"></span>设置 SSH_AUTH_SOCK

</div>

[设置](../zh-cn/%E7%8E%AF%E5%A2%83%E5%8F%98%E9%87%8F.html#%E6%8C%89%E7%94%A8%E6%88%B7 "环境变量")以下环境变量与 *gpg-agent* 通信，替代默认的 *ssh-agent*。

SSH_AGENT_PID=""\
SSH_AUTH_SOCK="\${XDG_RUNTIME_DIR}/gnupg/S.gpg-agent.ssh"

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**

- 如果使用脚本管理环境变量,需要 unset `SSH_AGENT_PID` 而不是将 `unset SSH_AGENT_PID` 设置成 `""`。
- 请记住，在手动设置 `SSH_AUTH_SOCK` 的情况下，如果使用了自定义的 `GNUPGHOME`，那么套接字位置可能不同。您可以使用以下 bash 示例，或者将 `SSH_AUTH_SOCK` 更改为 `gpgconf --list-dirs agent-ssh-socket` 的值。
- 如果安装了 GNOME Keyring，有必要[禁用](../zh-cn/GNOME/Keyring.html#%E7%A6%81%E7%94%A8%E9%92%A5%E5%8C%99%E7%8E%AF%E7%9A%84%E5%AE%88%E6%8A%A4%E8%BF%9B%E7%A8%8B%E7%BB%84%E4%BB%B6 "GNOME/Keyring")其 ssh 组件。否则，它将覆盖 `SSH_AUTH_SOCK`。

</div>

或者通过 Bash 配置，这也适用于非标准的套接字路径 :

~/.bashrc

unset SSH_AGENT_PID\
if \[ "\${gnupg_SSH_AUTH_SOCK_by:-0}" -ne \$\$ \]; then\
  export SSH_AUTH_SOCK="\$(gpgconf --list-dirs agent-ssh-socket)"\
fi

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**`gnupg_SSH_AUTH_SOCK_by` 用来检测 *gpg-agent* 是否以 `gpg-agent --daemon /bin/sh` 的方式启动, 在这种情况下，shell 从父进程继承 `SSH_AUTH_SOCK` 变量, *gpg-agent* <a href="https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git;a=blob;f=agent/gpg-agent.c;hb=7bca3be65e510eda40572327b87922834ebe07eb#l1307" class="external autonumber" rel="nofollow">[6]</a>.

</div>

<div class="mw-heading mw-heading4">

#### <span id=".E9.85.8D.E7.BD.AE_pinentry_.E4.BD.BF.E7.94.A8.E6.AD.A3.E7.A1.AE.E7.9A.84_TTY"></span>配置 pinentry 使用正确的 TTY

</div>

如果用户切换了 X 会话，还需要设置 GPG_TTY 并刷新 TTY，如 <span class="plainlinks archwiki-template-man" title="$ man 1 gpg-agent"><a href="https://man.archlinux.org/man/gpg-agent.1" class="external text" rel="nofollow">gpg-agent(1)</a></span> 中所述。例如：

~/.bashrc

export GPG_TTY=\$(tty)\
gpg-connect-agent updatestartuptty /bye \>/dev/null

在同时使用多个终端时，如果想要 *gpg-agent* 通过 *pinentry-curses* 在运行 ssh 的终端上请求密码(passphrase)，添加以下内容到 SSH 配置文件。这将使得每次运行 *ssh* 命令时都会刷新 TTY <a href="https://unix.stackexchange.com/a/499133" class="external autonumber" rel="nofollow">[7]</a>：

~/.ssh/config

Match host \* exec "gpg-connect-agent UPDATESTARTUPTTY /bye"

请注意，必须设置 `GPG_TTY` 环境变量才能正常工作。

<div class="mw-heading mw-heading4">

#### <span id=".E6.B7.BB.E5.8A.A0_SSH_.E5.AF.86.E9.92.A5"></span>添加 SSH 密钥

</div>

*gpg-agent* 运行后，和 [ssh-agent](../zh-cn/SSH_%E5%AF%86%E9%92%A5.html#SSH_agents "SSH 密钥") 一样您可以通过 *ssh-add* 添加准许的密钥。 准许的密钥列表储存在 `~/.gnupg/sshcontrol`。

一旦您的密钥被批准，每次需要密码(passphrase)时，都会有 *pinentry* 对话框。要缓存密码，参见 [\#缓存密码](#%E7%BC%93%E5%AD%98%E5%AF%86%E7%A0%81)。

<div class="mw-heading mw-heading4">

#### <span id=".E4.BD.BF.E7.94.A8_PGP_.E5.AF.86.E9.92.A5.E8.BF.9B.E8.A1.8C_SSH_.E8.BA.AB.E4.BB.BD.E9.AA.8C.E8.AF.81"></span>使用 PGP 密钥进行 SSH 身份验证

</div>

您还可以使用 PGP 密钥作为 SSH 密钥。这需要一个具有`验证`功能的密钥（请参阅 [\#Custom ability](#Custom_ability)）。使用 PGP 密钥进行 SSH 身份验证有各种好处，包括:

- 您不再需要维护 SSH 密钥，减少了密钥维护量。
- 可以在智能卡上储存验证密钥。GnuPG 将在卡可用时自动检测密钥，并将其添加到代理中（使用 `ssh-add -l` 或 `ssh-add -L` 检查）。密钥的备注应该会是 `openpgp:`*`key-id`* 或 `cardno:`*`card-id`*。

运行 `gpg --export-ssh-key `*`gpg-key`*获取 GPG/SSH 公钥。如果您的密钥具有身份验证功能，但此命令仍然失败，并显示 “Unusable public key”, 给 *gpg-key* 添加 `!` 后缀 (<a href="https://dev.gnupg.org/T2957" class="external autonumber" rel="nofollow">[8]</a>)。

除非您的 GPG 密钥在密钥卡上，否则您需要将密钥添加到 `$GNUPGHOME/sshcontrol` 中，才能被识别为 SSH 密钥。如果您的钥匙在钥匙卡上，它的 keygrip 会隐式地添加到 `sshcontrol` 中。如果没有，通过以下方式获取密钥的 keygrip：

\$ gpg --list-keys --with-keygrip

sub   rsa4096 2018-07-25 \[A\]\
      Keygrip = *1531C8084D16DC4C36911F1585AF0ACE7AAFD7E7*

然后像这样编辑 `sshcontrol`。添加 keygrip 只需要一次；除非要添加其他密钥，否则不需要再次编辑该文件。

\$GNUPGHOME/sshcontrol

*1531C8084D16DC4C36911F1585AF0ACE7AAFD7E7*\

<div class="mw-heading mw-heading3">

### <span id=".E8.BD.AC.E5.8F.91_gpg-agent_.E5.92.8C_ssh-agent_.E5.88.B0.E8.BF.9C.E7.A8.8B.E4.B8.BB.E6.9C.BA"></span>转发 gpg-agent 和 ssh-agent 到远程主机

</div>

<div class="archwiki-template-box archwiki-template-box-tip">

**提示：**设置`ForwardAgent yes`，如[此处](../zh-cn/OpenSSH.html#Agent_forwarding "OpenSSH")所示，怎么样？

</div>

通过将 gpg 套接字转发到远程机器，可以将 gpg-agent 转发到远程计算机，如 <a href="https://wiki.gnupg.org/AgentForwarding" class="external text" rel="nofollow">GnuPG wiki</a> 所述。

首先，将以下行添加到远程计算机上的 `/etc/ssh/sshd_config`，以便在连接时自动删除旧的套接字。如果不这样做，则需要手动删除远程计算机上的套接字，然后才能连接启用了转发的代理，以便代理转发正常工作：

/etc/ssh/sshd_config

...\
StreamLocalBindUnlink yes\
...\

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**必须在远程计算机上运行 `systemctl reload sshd`，使 sshd 加载新配置。

</div>

在客户端上，用 `RemoteForward` SSH 指令来将发往远程端口的通信转发到本地端口。如 <span class="plainlinks archwiki-template-man" title="$ man 5 ssh_config"><a href="https://man.archlinux.org/man/ssh_config.5#RemoteForward" class="external text" rel="nofollow">ssh_config(5) § RemoteForward</a></span> 中所述，该指令参数的第一项是远程主机上监听套接字的路径，第二项是本地主机上目标套接字的路径。配置应该如下所示：

\$HOME/.ssh/config

Host *remote_name*\
    ...\
    RemoteForward *remote_agent_socket* *local_agent_extra_socket*\
    RemoteForward *remote_agent_ssh_socket* *local_agent_ssh_socket*\

第一行配置 gpg-agent 转发 :

- *remote_agent_socket* 是在远程机器上 `gpgconf --list-dir agent-socket` 的输出。
- *local_agent_extra_socket* 是在本地机器上 `gpgconf --list-dir agent-extra-socket` 的输出。

第二行是可选的，配置 ssh-agent 转发:

- *local_agent_ssh_socket* 是在远程机器上 `gpgconf --list-dir agent-ssh-socket` 的输出。
- *remote_agent_ssh_socket* 是在本地机器上 `gpgconf --list-dir agent-ssh-socket` 的输出。

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**如果要使用 ssh-agent 转发，需要在远程机器上将 `SSH_AUTH_SOCK` 设为 `gpgconf --list-dir agent-ssh-socket` 的输出，如[\#SSH 代理](#SSH_%E4%BB%A3%E7%90%86)所述）。

</div>

因此，在默认路径下，它应该是：

    RemoteForward /run/user/1000/gnupg/S.gpg-agent /run/user/1000/gnupg/S.gpg-agent.extra\
    RemoteForward /run/user/1000/gnupg/S.gpg-agent.ssh `/run/user/1000/gnupg/S.gpg-agent.ssh`\

有了这个配置，运行 `ssh myremote` 会自动将 gpg-agent 转发到远程，并允许使用 gpg 密钥解密/签名（如果包含第二行 `RemoteForward`，则会允许 gpg 和 ssh-agent 一起工作）。

<div class="mw-heading mw-heading2">

## Smartcards

</div>

<div class="noprint archwiki-template-message">

<span class="mw-default-size" typeof="mw:File"><a href="../File:Tango-preferences-desktop-locale.png" class="mw-file-description"><img src="../File:Tango-preferences-desktop-locale.png" class="mw-file-element" decoding="async" width="48" height="48" /></a></span>**本文或本节需要<a href="../Project:Contributing_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87).html#%E7%BF%BB%E8%AF%91" class="mw-redirect" title="Project:Contributing (简体中文)">翻译</a>。要贡献翻译，请访问[简体中文翻译团队](../Project:%E7%BF%BB%E8%AF%91%E5%9B%A2%E9%98%9F.html "Project:翻译团队")。**

<div>

**附注：** 以下内容缺少中文翻译（在 <a href="../zh-cn/Talk:GnuPG.html" class="external text" rel="nofollow">Talk:GnuPG#</a> 中讨论）

</div>

</div>

GnuPG uses *scdaemon* as an interface to your smartcard reader, please refer to the <a href="../zh-cn/Man_page.html" class="mw-redirect" title="Man page">man page</a> <span class="plainlinks archwiki-template-man" title="$ man 1 scdaemon"><a href="https://man.archlinux.org/man/scdaemon.1" class="external text" rel="nofollow">scdaemon(1)</a></span> for details.

<div class="mw-heading mw-heading3">

### GnuPG only setups

</div>

<div class="archwiki-template-box archwiki-template-box-note">

**注意：** To allow scdaemon direct access to USB smartcard readers the optional dependency <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=libusb-compat" class="external text" rel="nofollow">libusb-compat</a></span><sup><span class="small">包</span></sup></span> must be installed

</div>

If you do not plan to use other cards but those based on GnuPG, you should check the `reader-port` parameter in `~/.gnupg/scdaemon.conf`. The value '0' refers to the first available serial port reader and a value of '32768' (default) refers to the first USB reader.

<div class="mw-heading mw-heading3">

### <span id="GnuPG_with_pcscd_.28PCSC_Lite.29"></span>GnuPG with pcscd (PCSC Lite)

</div>

<span class="plainlinks archwiki-template-man" title="$ man 8 pcscd"><a href="https://man.archlinux.org/man/pcscd.8" class="external text" rel="nofollow">pcscd(8)</a></span> is a daemon which handles access to smartcard (SCard API). If GnuPG's scdaemon fails to connect the smartcard directly (e.g. by using its integrated CCID support), it will fallback and try to find a smartcard using the PCSC Lite driver.

To use pscsd <a href="../zh-cn/Help:%E9%98%85%E8%AF%BB.html#%E5%AE%89%E8%A3%85%E8%BD%AF%E4%BB%B6%E5%8C%85" class="mw-redirect" title="Install">install</a> <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=pcsclite" class="external text" rel="nofollow">pcsclite</a></span><sup><span class="small">包</span></sup></span> and <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=ccid" class="external text" rel="nofollow">ccid</a></span><sup><span class="small">包</span></sup></span>. Then <a href="../zh-cn/Help:%E9%98%85%E8%AF%BB.html#%E6%8E%A7%E5%88%B6_systemd_%E5%8D%95%E5%85%83" class="mw-redirect" title="Start">start</a> and/or <a href="../zh-cn/Help:%E9%98%85%E8%AF%BB.html#%E6%8E%A7%E5%88%B6_systemd_%E5%8D%95%E5%85%83" class="mw-redirect" title="Enable">enable</a> `pcscd.service`. Alternatively start and/or enable `pcscd.socket` to activate the daemon when needed.

<div class="mw-heading mw-heading4">

#### Always use pcscd

</div>

If you are using any smartcard with an opensc driver (e.g.: ID cards from some countries) you should pay some attention to GnuPG configuration. Out of the box you might receive a message like this when using `gpg --card-status`

gpg: selecting openpgp failed: ec=6.108\

By default, scdaemon will try to connect directly to the device. This connection will fail if the reader is being used by another process. For example: the pcscd daemon used by OpenSC. To cope with this situation we should use the same underlying driver as opensc so they can work well together. In order to point scdaemon to use pcscd you should remove `reader-port` from `~/.gnupg/scdaemon.conf`, specify the location to `libpcsclite.so` library and disable ccid so we make sure that we use pcscd:

~/.gnupg/scdaemon.conf

pcsc-driver /usr/lib/libpcsclite.so\
card-timeout 5\
disable-ccid\

Please check <span class="plainlinks archwiki-template-man" title="$ man 1 scdaemon"><a href="https://man.archlinux.org/man/scdaemon.1" class="external text" rel="nofollow">scdaemon(1)</a></span> if you do not use OpenSC.

<div class="mw-heading mw-heading4">

#### Shared access with pcscd

</div>

GnuPG `scdaemon` is the only popular `pcscd` client that uses `PCSC_SHARE_EXCLUSIVE` flag when connecting to `pcscd`. Other clients like OpenSC PKCS#11 that are used by browsers and programs listed in <a href="/wzh/index.php?title=Electronic_identification&amp;action=edit&amp;redlink=1" class="new" title="Electronic identification（页面不存在）">Electronic identification</a> are using `PCSC_SHARE_SHARED` that allows simultaneous access to single smartcard. `pcscd` will not give exclusive access to smartcard while there are other clients connected. This means that to use GnuPG smartcard features you must before have to close all your open browser windows or do some other inconvenient operations. Starting from version 2.2.28 LTS and 2.3.0 you can enable shared access by modifying your `scdaemon.conf` file and adding `pcsc-shared` line end of it.

<div class="mw-heading mw-heading5">

##### Multi applet smart cards

</div>

When using [YubiKey](../zh-cn/YubiKey.html "YubiKey")s or other multi applet USB dongles with OpenSC PKCS#11 may run into problems where OpenSC switches your Yubikey from OpenPGP to PIV applet, breaking the `scdaemon`.

You can hack around the problem by forcing OpenSC to also use the OpenPGP applet. Open `/etc/opensc.conf` file, search for Yubikey and change the `driver = "PIV-II";` line to `driver = "openpgp";`. If there is no such entry, use `pcsc_scan`. Search for the Answer to Reset `ATR: 12 34 56 78 90 AB CD ...`. Then create a new entry.

/etc/opensc.conf

...\
card_atr 12:23:34:45:67:89:ab:cd:... {\
    name = "YubiKey Neo";\
    driver = "openpgp"\
}\
...

After that you can test with `pkcs11-tool -O --login` that the OpenPGP applet is selected by default. Other PKCS#11 clients like browsers may need to be restarted for that change to be applied.

<div class="mw-heading mw-heading5">

##### Using a smart card on a remote client via SSH

</div>

If you log into a machine via SSH and try to use an attached device via pcscd, you will notice errors such as:

gpg: selecting card failed: No such device\
gpg: OpenPGP card not available: No such device\

This is due to [Polkit](../zh-cn/Polkit.html "Polkit") restricting access to local clients. To fix this, you can add a rule to allow certain users in all cases. The below rule allows all users in the `wheel` group to access devices via `pcscd`:

/etc/polkit-1/rules.d/99-pcscd.rules

polkit.addRule(function(action, subject) {\
    if (action.id == "org.debian.pcsc-lite.access_card" &&\
        subject.isInGroup("wheel")) {\
        return polkit.Result.YES;\
    }\
});\
polkit.addRule(function(action, subject) {\
    if (action.id == "org.debian.pcsc-lite.access_pcsc" &&\
        subject.isInGroup("wheel")) {\
        return polkit.Result.YES;\
    }\
});

After creating the file, make sure to <a href="../zh-cn/Help:%E9%98%85%E8%AF%BB.html#%E6%8E%A7%E5%88%B6_systemd_%E5%8D%95%E5%85%83" class="mw-redirect" title="Restart">restart</a> `polkit.service`.

<div class="mw-heading mw-heading2">

## Tips and tricks

</div>

<div class="mw-heading mw-heading3">

### Different algorithm

</div>

You may want to use stronger algorithms:

~/.gnupg/gpg.conf

...\
\
personal-digest-preferences SHA512\
cert-digest-algo SHA512\
default-preference-list SHA512 SHA384 SHA256 SHA224 AES256 AES192 AES CAST5 ZLIB BZIP2 ZIP Uncompressed\
personal-cipher-preferences TWOFISH CAMELLIA256 AES 3DES\

In the latest version of GnuPG, the default algorithms used are SHA256 and AES, both of which are secure enough for most people. However, if you are using a version of GnuPG older than 2.1, or if you want an even higher level of security, then you should follow the above step.

<div class="mw-heading mw-heading3">

### Encrypt a password

</div>

It can be useful to encrypt some password, so it will not be written in clear on a configuration file. A good example is your email password.

First create a file with your password. You **need** to leave **one** empty line after the password, otherwise gpg will return an error message when evaluating the file.

Then run:

\$ gpg -e -a -r *user-id* *your_password_file*\

`-e` is for encrypt, `-a` for armor (ASCII output), `-r` for recipient user ID.

You will be left with a new *`your_password_file`*`.asc` file.

<div class="archwiki-template-box archwiki-template-box-tip">

**提示：**[pass](../zh-cn/Pass.html "Pass") automates this process.

</div>

<div class="mw-heading mw-heading3">

### Change trust model

</div>

By default GnuPG uses the <a href="https://en.wikipedia.org/wiki/Web_of_Trust" class="extiw" title="wikipedia:Web of Trust">Web of Trust</a> as the trust model. You can change this to <a href="https://en.wikipedia.org/wiki/Trust_on_first_use" class="extiw" title="wikipedia:Trust on first use">Trust on first use</a> by adding `--trust-model=tofu` when adding a key or adding this option to your GnuPG configuration file. More details are in <a href="https://lists.gnupg.org/pipermail/gnupg-devel/2015-October/030341.html" class="external text" rel="nofollow">this email to the GnuPG list</a>.

<div class="mw-heading mw-heading3">

### <span id="Hide_all_recipient_id.27s"></span>Hide all recipient id's

</div>

By default the recipient's key ID is in the encrypted message. This can be removed at encryption time for a recipient by using `hidden-recipient `*`user-id`*. To remove it for all recipients add `throw-keyids` to your configuration file. This helps to hide the receivers of the message and is a limited countermeasure against traffic analysis (i.e. using a little social engineering, anyone who is able to decrypt the message can check whether one of the other recipients is the one they suspect). On the receiving side, it may slow down the decryption process because all available secret keys must be tried (e.g. with `--try-secret-key `*`user-id`*).

<div class="mw-heading mw-heading3">

### Using caff for keysigning parties

</div>

To allow users to validate keys on the keyservers and in their keyrings (i.e. make sure they are from whom they claim to be), PGP/GPG uses the <a href="https://en.wikipedia.org/wiki/Web_of_Trust" class="extiw" title="wikipedia:Web of Trust">Web of Trust</a>. Keysigning parties allow users to get together at a physical location to validate keys. The <a href="https://en.wikipedia.org/wiki/Zimmermann%E2%80%93Sassaman_key-signing_protocol" class="extiw" title="wikipedia:Zimmermann–Sassaman key-signing protocol">Zimmermann-Sassaman</a> key-signing protocol is a way of making these very effective. <a href="https://www.cryptnet.net/fdp/crypto/keysigning_party/en/keysigning_party.html" class="external text" rel="nofollow">Here</a> you will find a how-to article.

For an easier process of signing keys and sending signatures to the owners after a keysigning party, you can use the tool *caff*. It can be installed from the AUR with the package <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://aur.archlinux.org/packages/caff-git/" class="external text" rel="nofollow">caff-git</a></span><sup><span class="small">AUR</span></sup></span>.

To send the signatures to their owners you need a working <a href="https://en.wikipedia.org/wiki/Message_transfer_agent" class="extiw" title="wikipedia:Message transfer agent">MTA</a>. If you do not have already one, install <a href="/wzh/index.php?title=Msmtp&amp;action=edit&amp;redlink=1" class="new" title="Msmtp（页面不存在）">msmtp</a>.

<div class="mw-heading mw-heading3">

### <span id="Always_show_long_ID.27s_and_fingerprints"></span>Always show long ID's and fingerprints

</div>

To always show long key ID's add `keyid-format 0xlong` to your configuration file. To always show full fingerprints of keys, add `with-fingerprint` to your configuration file.

<div class="mw-heading mw-heading3">

### Custom capabilities

</div>

For further customization also possible to set custom capabilities to your keys. The following capabilities are available:

- Certify (only for master keys) - allows the key to create subkeys, mandatory for master keys.
- Sign - allows the key to create cryptographic signatures that others can verify with the public key.
- Encrypt - allows anyone to encrypt data with the public key, that only the private key can decrypt.
- Authenticate - allows the key to authenticate with various non-GnuPG programs. The key can be used as e.g. an SSH key.

It is possible to specify the capabilities of the master key, by running:

\$ gpg --full-generate-key --expert\

And select an option that allows you to set your own capabilities.

Comparably, to specify custom capabilities for subkeys, add the `--expert` flag to `gpg --edit-key`, see [\#Edit your key](#Edit_your_key) for more information.

<div class="mw-heading mw-heading2">

## Troubleshooting

</div>

<div class="mw-heading mw-heading3">

### su

</div>

When using `pinentry`, you must have the proper permissions of the terminal device (e.g. `/dev/tty1`) in use. However, with *su* (or *sudo*), the ownership stays with the original user, not the new one. This means that pinentry will fail with a `Permission denied` error, even as root. If this happens when attempting to use ssh, an error like `sign_and_send_pubkey: signing failed: agent refused operation` will be returned. The fix is to change the permissions of the device at some point before the use of pinentry (i.e. using gpg with an agent). If doing gpg as root, simply change the ownership to root right before using gpg:

\# chown root /dev/ttyN  # where N is the current tty\

and then change it back after using gpg the first time. The equivalent is true with `/dev/pts/`.

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**The owner of tty *must* match with the user for which pinentry is running. Being part of the group `tty` **is not** enough.

</div>

<div class="archwiki-template-box archwiki-template-box-tip">

**提示：**If you run gpg with `script` it will use a new tty with the correct ownership:

\# script -q -c "gpg --gen-key" /dev/null\

</div>

<div class="mw-heading mw-heading3">

### Agent complains end of file

</div>

If the pinentry program is `/usr/bin/pinentry-gnome3`, it needs a DBus session bus to run properly. See <a href="../zh-cn/General_troubleshooting.html#Session_permissions" class="mw-redirect" title="General troubleshooting">General troubleshooting#Session permissions</a> for details.

Alternatively, you can use a variety of different options described in [\#pinentry](#pinentry).

<div class="mw-heading mw-heading3">

### KGpg configuration permissions

</div>

There have been issues with <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=kgpg" class="external text" rel="nofollow">kgpg</a></span><sup><span class="small">包</span></sup></span> being able to access the `~/.gnupg/` options. One issue might be a result of a deprecated *options* file, see the <a href="https://bugs.kde.org/show_bug.cgi?id=290221" class="external text" rel="nofollow">bug</a> report.

<div class="mw-heading mw-heading3">

### GNOME on Wayland overrides SSH agent socket

</div>

For Wayland sessions, `gnome-session` sets `SSH_AUTH_SOCK` to the standard gnome-keyring socket, `$XDG_RUNTIME_DIR/keyring/ssh`. This overrides any value set elsewhere.

See [GNOME/Keyring#Disabling](../zh-cn/GNOME/Keyring.html#Disabling "GNOME/Keyring") on how to disable this behavior.

<div class="mw-heading mw-heading3">

### mutt

</div>

Mutt might not use *gpg-agent* correctly, you need to set an <a href="../zh-cn/Environment_variable.html" class="mw-redirect" title="Environment variable">environment variable</a> `GPG_AGENT_INFO` (the content does not matter) when running mutt. Be also sure to enable password caching correctly, see [\#Cache passwords](#Cache_passwords).

See <a href="https://bbs.archlinux.org/viewtopic.php?pid=1490821#p1490821" class="external text" rel="nofollow">this forum thread</a>.

<div class="mw-heading mw-heading3">

### <span id=".22Lost.22_keys.2C_upgrading_to_gnupg_version_2.1"></span>"Lost" keys, upgrading to gnupg version 2.1

</div>

When `gpg --list-keys` fails to show keys that used to be there, and applications complain about missing or invalid keys, some keys may not have been migrated to the new format.

Please read <a href="https://web.archive.org/web/20160502052025/http://jo-ke.name/wp/?p=111" class="external text" rel="nofollow">GnuPG invalid packet workaround</a>. Basically, it says that there is a bug with keys in the old `pubring.gpg` and `secring.gpg` files, which have now been superseded by the new `pubring.kbx` file and the `private-keys-v1.d/` subdirectory and files. Your missing keys can be recovered with the following commands:

\$ cd\
\$ cp -r .gnupg gnupgOLD\
\$ gpg --export-ownertrust \> otrust.txt\
\$ gpg --import .gnupg/pubring.gpg\
\$ gpg --import-ownertrust otrust.txt\
\$ gpg --list-keys\

<div class="mw-heading mw-heading3">

### <span id="gpg_hanged_for_all_keyservers_.28when_trying_to_receive_keys.29"></span>gpg hanged for all keyservers (when trying to receive keys)

</div>

If gpg hanged with a certain keyserver when trying to receive keys, you might need to kill dirmngr in order to get access to other keyservers which are actually working, otherwise it might keeping hanging for all of them.

<div class="mw-heading mw-heading3">

### Smartcard not detected

</div>

Your user might not have the permission to access the smartcard which results in a `card error` to be thrown, even though the card is correctly set up and inserted.

One possible solution is to add a new group `scard` including the users who need access to the smartcard.

Then use <a href="/wzh/index.php?title=Udev_rules&amp;action=edit&amp;redlink=1" class="new" title="Udev rules（页面不存在）">udev rules</a>, similar to the following:

/etc/udev/rules.d/71-gnupg-ccid.rules

ACTION=="add", SUBSYSTEM=="usb", ENV{ID_VENDOR_ID}=="1050", ENV{ID_MODEL_ID}=="0116\|0111", MODE="660", GROUP="scard"\

One needs to adapt VENDOR and MODEL according to the `lsusb` output, the above example is for a YubikeyNEO.

<div class="mw-heading mw-heading3">

### <span id="server_.27gpg-agent.27_is_older_than_us_.28x_.3C_y.29"></span>server 'gpg-agent' is older than us (x \< y)

</div>

This warning appears if `gnupg` is upgraded and the old gpg-agent is still running. <a href="../zh-cn/Help:%E9%98%85%E8%AF%BB.html#%E6%8E%A7%E5%88%B6_systemd_%E5%8D%95%E5%85%83" class="mw-redirect" title="Restart">Restart</a> the *user'*s `gpg-agent.socket` (i.e., use the `--user` flag when restarting).

<div class="mw-heading mw-heading3">

### IPC connect call failed

</div>

Make sure `gpg-agent` and `dirmngr` are not running with `killall gpg-agent dirmngr` and the `$GNUPGHOME/crls.d/` folder has permission set to `700`.

By default, the <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=gnupg" class="external text" rel="nofollow">gnupg</a></span><sup><span class="small">包</span></sup></span> package uses the directory `/run/user/$UID/gnupg/` for sockets. <a href="https://github.com/gpg/gnupg/blob/25ae80b8eb6e9011049d76440ad7d250c1d02f7c/README#L121-L122" class="external text" rel="nofollow">GnuPG documentation</a> states this is the preferred directory (not all file systems are supported for sockets). Validate that your `agent-socket` configuration specifies a path that has an appropriate file system. You can find the your path settings for `agent-socket` by running `gpgconf --list-dirs agent-socket`.

Test that `gpg-agent` starts successfully with `gpg-agent --daemon`.

<div class="mw-heading mw-heading3">

### Mitigating Poisoned PGP Certificates

</div>

In June 2019, an unknown attacker spammed several high-profile PGP certificates with tens of thousands (or hundreds of thousands) of signatures (CVE-2019-13050) and uploaded these signatures to the SKS keyservers. The existence of these poisoned certificates in a keyring causes gpg to hang with the following message:

gpg: removing stale lockfile (created by 7055)\

Possible mitigation involves removing the poisoned certificate as per this <a href="https://tech.michaelaltfield.net/2019/07/14/mitigating-poisoned-pgp-certificates/" class="external text" rel="nofollow">blog post</a>.

<div class="mw-heading mw-heading3">

### Invalid IPC response and Inappropriate ioctl for device

</div>

The default pinentry program is `/usr/bin/pinentry-gtk-2`. If <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=gtk2" class="external text" rel="nofollow">gtk2</a></span><sup><span class="small">包</span></sup></span> is unavailable, pinentry falls back to `/usr/bin/pinentry-curses` and causes signing to fail:

gpg: signing failed: Inappropriate ioctl for device\
gpg: \[stdin\]: clear-sign failed: Inappropriate ioctl for device\

You need to set the `GPG_TTY` environment variable for the pinentry programs `/usr/bin/pinentry-tty` and `/usr/bin/pinentry-curses`.

\$ export GPG_TTY=\$(tty)\

<div class="mw-heading mw-heading3">

### Keyblock resource does not exist

</div>

If you get an error like this when trying to import keys

gpg: keyblock resource '*gnupg_home*/pubring.kbx': No such file or directory\

it is because GnuPG will not create its home directory if it does not yet exist. Simply create it manually

\$ mkdir -m 700 *gnupg_home*\

<div class="mw-heading mw-heading2">

## <span id=".E5.8F.82.E8.A7.81"></span>参见

</div>

- <a href="https://gnupg.org/" class="external text" rel="nofollow">GNU Privacy Guard Homepage</a>
- <a href="https://program-think.blogspot.com/2013/02/file-integrity-check.html" class="external text" rel="nofollow">扫盲文件完整性校验——关于散列值和数字签名 @ 编程随想的博客</a>
- <a href="https://futureboy.us/pgp.html" class="external text" rel="nofollow">Alan Eliasen's GPG Tutorial</a>
- <a href="https://tools.ietf.org/html/rfc4880" class="extiw" title="rfc:4880">RFC 4880</a> — "OpenPGP Message Format"
- <a href="https://help.riseup.net/en/security/message-security/openpgp/gpg-best-practices" class="external text" rel="nofollow">gpg.conf recommendations and best practices</a>
- <a href="https://fedoraproject.org/wiki/Creating_GPG_Keys" class="external text" rel="nofollow">Fedora:Creating GPG Keys</a>
- <a href="https://wiki.debian.org/Subkeys" class="external text" rel="nofollow">Debian:Subkeys</a>
- <a href="https://github.com/lfit/itpol/blob/master/protecting-code-integrity.md" class="external text" rel="nofollow">Protecting code integrity with PGP</a>
- <a href="https://sanctum.geek.nz/arabesque/series/gnu-linux-crypto/" class="external text" rel="nofollow">A more comprehensive gpg Tutorial</a>
- <a href="https://www.reddit.com/r/GPGpractice/" class="external text" rel="nofollow">/r/GPGpractice - a subreddit to practice using GnuPG.</a>

</div>
