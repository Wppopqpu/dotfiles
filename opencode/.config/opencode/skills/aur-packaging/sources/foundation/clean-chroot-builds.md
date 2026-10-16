<div class="mw-content-ltr mw-parser-output" lang="zh-Hans-CN" dir="ltr">

<div class="aside archwiki-template-box archwiki-template-box-note noexcerpt">

**翻译状态：**

- 本文（或部分内容）译自 <a href="https://wiki.archlinux.org/title/Building_in_a_clean_chroot" class="extiw" title="arch:Building in a clean chroot">Building in a clean chroot</a>，最近一次同步于 2025-03-06，若英文版本有所<a href="https://wiki.archlinux.org/title/Building_in_a_clean_chroot?diff=0&amp;oldid=820739" class="external text" rel="nofollow">更改</a>，则您可以帮助同步与[翻译](../zh-cn/Help:%E7%BF%BB%E8%AF%91.html "Help:翻译")更改的内容。
- 您可以在 <a href="https://wiki.archlinux.org/title/Building_in_a_clean_chroot_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)?action=history" class="external text" rel="nofollow">ArchWiki 的对应页面</a>找到本文翻译的**原始**修订历史。
- 本文可能与英文原文存在出入。

</div>

<div class="noprint archwiki-template-message">

<span class="mw-default-size" typeof="mw:File"><a href="../File:Tango-preferences-desktop-locale.png" class="mw-file-description"><img src="../File:Tango-preferences-desktop-locale.png" class="mw-file-element" decoding="async" width="48" height="48" /></a></span>**本文或本节需要<a href="../Project:Contributing_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87).html#%E7%BF%BB%E8%AF%91" class="mw-redirect" title="Project:Contributing (简体中文)">翻译</a>。要贡献翻译，请访问[简体中文翻译团队](../Project:%E7%BF%BB%E8%AF%91%E5%9B%A2%E9%98%9F.html "Project:翻译团队")。**

<div>

**附注：** [\#处理大规模重构](#%E5%A4%84%E7%90%86%E5%A4%A7%E8%A7%84%E6%A8%A1%E9%87%8D%E6%9E%84) 需要翻译（在 <a href="../zh-cn/Talk:%E5%88%9B%E5%BB%BA%E4%B8%80%E4%B8%AA%E5%B9%B2%E5%87%80%E7%9A%84_chroot.html" class="external text" rel="nofollow">Talk:创建一个干净的 chroot#</a> 中讨论）

</div>

</div>

<div class="mw-heading mw-heading2">

## <span id=".E4.BD.BF.E7.94.A8_clean_chroot_.E7.9A.84.E6.84.8F.E4.B9.89"></span>使用 clean chroot 的意义

</div>

clean chroot 可以直译为 干净/洁净的 [chroot](../zh-cn/Chroot.html "Chroot")。在 clean chroot 环境中构建可以避免软件包依赖缺失问题。不然可能会出现意外的动态链接或是在 [PKGBUILD](../zh-cn/PKGBUILD.html "PKGBUILD") 依赖数组 `depends` 中出现未声明的依赖。此外，它还允许用户参与 [core-testing](../zh-cn/%E5%AE%98%E6%96%B9%E4%BB%93%E5%BA%93.html#core-testing "官方仓库") 或 [extra-testing](../zh-cn/%E5%AE%98%E6%96%B9%E4%BB%93%E5%BA%93.html#extra-testing "官方仓库") 测试仓库情况下，为稳定仓库 ([core](../zh-cn/%E5%AE%98%E6%96%B9%E4%BB%93%E5%BA%93.html#core "官方仓库")、[extra](../zh-cn/%E5%AE%98%E6%96%B9%E4%BB%93%E5%BA%93.html#extra "官方仓库")) 构建软件包。

\

<div class="mw-heading mw-heading2">

## <span id=".E4.BE.BF.E6.8D.B7.E6.96.B9.E5.BC.8F"></span>便捷方式

</div>

为了快速在 clean chroot 环境中构建软件包而无需复杂配置，你可以使用 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=devtools" class="external text" rel="nofollow">devtools</a></span><sup><span class="small">包</span></sup></span> 中的辅助脚本来帮助你。

这些辅助脚本应在 [PKGBUILD](../zh-cn/PKGBUILD.html "PKGBUILD") 的同一目录中调用，就像使用 [makepkg](../zh-cn/Makepkg.html "Makepkg") 时一样。例如，`extra-x86_64-build ` 将会自动从 `/var/lib/archbuild` 的 clean chroot 模板中创建 chroot 环境，更新它，并为 [extra](../zh-cn/%E5%AE%98%E6%96%B9%E4%BB%93%E5%BA%93.html#extra "官方仓库") 仓库构建软件包。对于 [multilib](../zh-cn/%E5%AE%98%E6%96%B9%E4%BB%93%E5%BA%93.html#multilib "官方仓库") 构建则使用无架构参数的 `multilib-build`。请参考下表了解不同目标仓库和架构对应的构建脚本。

`-c`参数用于重置chroot模板，这在环境损坏时非常有用。在建立全新的 clean chroot 时不需要此参数。

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**

- *[core](../zh-cn/%E5%AE%98%E6%96%B9%E4%BB%93%E5%BA%93.html#core "官方仓库")* 仓库被省略，因为这些软件包必须先通过 *[core-testing](../zh-cn/%E5%AE%98%E6%96%B9%E4%BB%93%E5%BA%93.html#core-testing "官方仓库")* 仓库测试才能进入正式仓库
- 如果目标是为本地使用构建 *[core](../zh-cn/%E5%AE%98%E6%96%B9%E4%BB%93%E5%BA%93.html#core "官方仓库")* 仓库的软件包，建议直接使用稳定仓库而非测试仓库。此时可以直接使用`extra`构建脚本

</div>

|  |  |  |  |
|----|----|----|----|
| 目标仓库 | 架构 | 构建脚本 | 使用的 Pacman 配置文件 |
| extra | x86_64 | extra-x86_64-build | /usr/share/devtools/pacman.conf.d/extra.conf |
| core-testing / extra-testing | x86_64 | extra-testing-x86_64-build | /usr/share/devtools/pacman.conf.d/extra-testing.conf |
| core-staging / extra-staging | x86_64 | extra-staging-x86_64-build | /usr/share/devtools/pacman.conf.d/extra-staging.conf |
| multilib | x86_64 | multilib-build | /usr/share/devtools/pacman.conf.d/multilib.conf |
| multilib-testing | x86_64 | multilib-testing-build | /usr/share/devtools/pacman.conf.d/multilib-testing.conf |
| multilib-staging | x86_64 | multilib-staging-build | /usr/share/devtools/pacman.conf.d/multilib-staging.conf |

<div class="archwiki-template-box archwiki-template-box-tip">

**提示：**<span class="plainlinks archwiki-template-man" title="$ man 1 pkgctl-build"><a href="https://man.archlinux.org/man/pkgctl-build.1" class="external text" rel="nofollow">pkgctl-build(1)</a></span>会自动选择正确的构建脚本在 clean chroot 中构建

</div>

<div class="mw-heading mw-heading2">

## <span id=".E4.BC.A0.E7.BB.9F.E6.96.B9.E6.B3.95"></span>传统方法

</div>

<div class="mw-heading mw-heading3">

### <span id=".E8.AE.BE.E7.BD.AE_chroot_.E7.8E.AF.E5.A2.83"></span>设置 chroot 环境

</div>

<span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=devtools" class="external text" rel="nofollow">devtools</a></span><sup><span class="small">包</span></sup></span> 提供了用于创建 clean chroot 并在其中构建软件包的功能，请确保您已<a href="../zh-cn/Help:%E9%98%85%E8%AF%BB.html#%E5%AE%89%E8%A3%85%E8%BD%AF%E4%BB%B6%E5%8C%85" class="mw-redirect" title="安装">安装</a>该软件包。

之后，为创建 clean chroot，请创建一个新文件夹用于存放 chroot，比如 `$HOME/chroot/`：

\$ mkdir ~/chroot\

之后定义 `CHROOT` 变量:

\$ CHROOT=\$HOME/chroot\

现在就可以开始创建 clean chroot 环境了：

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**chroot 需要 `root` 文件夹的访问权限，因为 `$CHROOT` 目录需要复制其中的必要文件来创建一个干净的工作环境

</div>

\$ mkarchroot \$CHROOT/root base-devel\

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**

- 若您经常使用 clean chroot 构建软件包，在 `$HOME/.bashrc` 里添加 export 命令以引入 `CHROOT` 变量是一个不错的选择

<!-- -->

- 在 [btrfs](../zh-cn/Btrfs.html "Btrfs") 文件系统中，chroot 会以分卷（subvolume）的形式被创建，因此您必须以 root 用户的身份运行 `btrfs subvolume delete $CHROOT/root` 才能删除这个分卷。

</div>

所有相关信息，比如打包者名称、makeflags 等都在 `~/.makepkg.conf` 中，毋庸置疑，您需要编辑 `~/.makepkg.conf` 以确保其被正常构建。别忘了修改 `$CHROOT/root/etc/pacman.d/mirrorlist` 以更换[镜像源](../zh-cn/%E9%95%9C%E5%83%8F%E6%BA%90.html "镜像源")。

如果需要，您也可以在 `$CHROOT/root/etc/pacman.conf` 中启用 <a href="../zh-cn/%E5%AE%98%E6%96%B9%E4%BB%93%E5%BA%93.html" class="mw-redirect" title="Testing">testing</a> 软件仓库以在 chroot 中获取测试版本的软件包。

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**`~` 和 `$HOME` 变量在"makechrootpkg"构建脚本中会被自动定义为 `/root/`

</div>

<div class="mw-heading mw-heading4">

#### <span id=".E8.87.AA.E5.AE.9A.E4.B9.89_pacman.conf"></span>自定义 pacman.conf

</div>

或者，提供一个自定义的 `pacman.conf` 和` makepkg.conf`，其中包含以下内容：

\$ mkarchroot -C \<pacman.conf\> -M \<makepkg.conf\> \$CHROOT/root base-devel\

<div class="archwiki-template-box archwiki-template-box-warning">

**警告：**在首次创建 clean chroot 时使用自定义的 `pacman.conf` 或 `makepkg.conf` 可能会导致对 chroot 环境进行预期外的自定义调整。*请谨慎使用。*

</div>

<div class="mw-heading mw-heading3">

### <span id=".E5.9C.A8_chroot_.E9.87.8C.E6.9E.84.E5.BB.BA"></span>在 chroot 里构建

</div>

首先，请确保 base chroot (`$CHROOT/root`) 是最新的：

\$ arch-nspawn \$CHROOT/root pacman -Syu\

其次，在包含其 [PKGBUILD](../zh-cn/PKGBUILD.html "PKGBUILD") 的目录中调用 `makechrootpkg` 来构建软件包：

\$ makechrootpkg -c -r \$CHROOT\

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**传递 `-c` 参数给 `makechrootpkg` 可确保在构建前清理工作 chroot (`$CHROOT/$USER`)。

</div>

\

<div class="mw-heading mw-heading4">

#### <span id=".E9.A2.84.E8.A3.85.E5.BF.85.E8.A6.81.E4.BE.9D.E8.B5.96.E5.8C.85"></span>预装必要依赖包

</div>

要在 `$CHROOT/root/pacman.conf` 中启用的仓库无法提供所需依赖的情况下构建软件包，请使用 `-I `*`package`* 预先将它们安装到工作 chroot 中：

\$ makechrootpkg -c -r \$CHROOT -I build-dependency-1.0-1-x86_64.pkg.tar.xz -I required-package-2.0-2-x86_64.pkg.tar.xz\

<div class="mw-heading mw-heading4">

#### <span id=".E5.90.91_makepkg_.E4.BC.A0.E9.80.92.E5.8F.82.E6.95.B0"></span>向 makepkg 传递参数

</div>

要向 [makepkg](../zh-cn/Makepkg.html#Usage "Makepkg") 传递参数，请在 <a href="https://wiki.bash-hackers.org/dict/terms/end_of_options" class="external text" rel="nofollow">end-of-options marker (选项结束符)</a> 之后列出它们；例如，若要强制执行 `check()`：

\$ makechrootpkg -c -r \$CHROOT -- --check\

<div class="mw-heading mw-heading2">

## <span id=".E5.A4.84.E7.90.86.E5.A4.A7.E8.A7.84.E6.A8.A1.E9.87.8D.E6.9E.84"></span>处理大规模重构

</div>

处理大型重构最简洁的方法是使用 *staging* 仓库。先针对 *extra* 构建第一个软件包并推送到 *staging* 仓库。然后将后续所有软件包都基于 *staging* 重新构建，并一同推送到那里。

如果无法使用 *staging* 仓库，也可以通过如下命令，使用自定义软件包进行构建：

\# extra-x86_64-build -- -I ~/packages/foobar/foobar-2-1-any.pkg.tar.xz\

你可以通过多次使用 `-I` 参数来指定安装多个软件包。

处理大规模重构 (Major Rebuild) 有一种更简单但也相对“不够干净 (dirtier)”的方法：将所有已构建的软件包直接安装到 chroot 环境中，且全程不对其进行清理。使用以下命令构建第一个软件包：

\# extra-x86_64-build\

使用以下命令构建后续的所有软件包：

\# makechrootpkg -n -r /var/lib/archbuild/extra-x86_64\

运行 namcap (即` -n`参数) 意味着会将软件包安装到 chroot 中。`*-build`脚本默认也会执行此操作。

<div class="mw-heading mw-heading2">

## <span id=".E5.B0.8F.E6.8F.90.E7.A4.BA.E5.92.8C.E5.B0.8F.E6.8A.80.E5.B7.A7"></span>小提示和小技巧

</div>

<div class="mw-heading mw-heading3">

### <span id=".E5.9C.A8tmpfs.E4.B8.AD.E6.9E.84.E5.BB.BA"></span>在tmpfs中构建

</div>

若系统拥有足够内存，可为 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=devtools" class="external text" rel="nofollow">devtools</a></span><sup><span class="small">包</span></sup></span> 构建脚本指定 [tmpfs](../zh-cn/Tmpfs.html "Tmpfs") 文件系统。

\# mount --mkdir -t tmpfs -o defaults,size=20G tmpfs /mnt/chroots/arch\
\# extra-x86_64-build -c -r /mnt/chroots/arch\

</div>
