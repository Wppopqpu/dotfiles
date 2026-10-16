<div class="mw-content-ltr mw-parser-output" lang="zh-Hans-CN" dir="ltr">

<div class="aside archwiki-template-box archwiki-template-box-note noexcerpt">

**翻译状态：**

- 本文（或部分内容）译自 <a href="https://wiki.archlinux.org/title/Patching_packages" class="extiw" title="arch:Patching packages">Patching packages</a>，最近一次同步于 2026-02-28，若英文版本有所<a href="https://wiki.archlinux.org/title/Patching_packages?diff=0&amp;oldid=862738" class="external text" rel="nofollow">更改</a>，则您可以帮助同步与[翻译](../zh-cn/Help:%E7%BF%BB%E8%AF%91.html "Help:翻译")更改的内容。
- 您可以在 <a href="https://wiki.archlinux.org/title/Patching_packages_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)?action=history" class="external text" rel="nofollow">ArchWiki 的对应页面</a>找到本文翻译的**原始**修订历史。
- 本文可能与英文原文存在出入。

</div>

<div class="archwiki-template-meta-related-articles-start">

相关文章

- [创建软件包](../zh-cn/%E5%88%9B%E5%BB%BA%E8%BD%AF%E4%BB%B6%E5%8C%85.html "创建软件包")

</div>

本文涵盖了如何在 [Arch 构建系统](../zh-cn/Arch_%E6%9E%84%E5%BB%BA%E7%B3%BB%E7%BB%9F.html "Arch 构建系统")（ABS）中为软件包创建和应用补丁。

<a href="https://en.wikipedia.org/wiki/Patch_(computing)" class="extiw" title="wikipedia:Patch (computing)">补丁</a>描述了一个或多个文件的行更改。补丁通常用于自动更改源代码。

<div class="mw-heading mw-heading2">

## <span id=".E5.88.9B.E5.BB.BA.E8.A1.A5.E4.B8.81"></span>创建补丁

</div>

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**如果你只是想要更改一两行，你可能会想使用 [sed](../zh-cn/%E6%A0%B8%E5%BF%83%E5%B7%A5%E5%85%B7.html#%E5%9F%BA%E7%A1%80 "核心工具")。

</div>

<a href="https://en.wikipedia.org/wiki/diff" class="extiw" title="wikipedia:diff">diff</a> 工具会逐行比较文件。将它的输出保存下来你就得到了一个补丁，如 `diff --unified --recursive --text foo bar > foobar.patch`（可以将参数简写为 `diff -ura`）。如果你传递了目录， *diff* 会比较它们包含的文件。

1.  如果你已将构建了软件包，请删除 `src` 目录。
2.  运行 `makepkg --nobuild`/`makepkg -o` 会下载并提取 `PKGBUILD` 中声明的源文件，但不会进行构建。如果你正在创建补丁的系统上没有必要的依赖，你可能需要转而使用 `makepkg --nobuild --nodeps`/`makepkg -od`。
3.  在 `src` 目录中创建两份提取的目录的副本，一个作为原始版本，一个作为你修改过的版本，下面我们会将他们称为 `package.orig` 和 `package.new`。
4.  在 `package.new` 目录中进行你的更改。
5.  运行 `diff -ura package.orig package.new --color` 并检查补丁是否看起来良好。
6.  运行 `diff -ura package.orig package.new > package.patch` 来生成补丁。
7.  进入 `package.orig` 目录并使用 `patch --strip=1 --input=../package.patch`（可以简写为 `patch -p1 -i ../package.patch`）命令来应用补丁。运行 `makepkg --noextract --install`/`makepkg -ei` 命令构建并安装更改后的软件包来验证补丁是否正常工作。

<div class="archwiki-template-box archwiki-template-box-note">

**注意：**你也可以使用 [Git](../zh-cn/Git.html "Git") 的 `git diff` 或 `git format-patch` 命令 <a href="https://stackoverflow.com/questions/6658313/generate-a-git-patch-for-a-specific-commit" class="external autonumber" rel="nofollow">[1]</a>。

</div>

更多信息参见 <span class="plainlinks archwiki-template-man" title="$ man 1 diff"><a href="https://man.archlinux.org/man/diff.1" class="external text" rel="nofollow">diff(1)</a></span> 和 <span class="plainlinks archwiki-template-man" title="$ man 1 git-diff"><a href="https://man.archlinux.org/man/git-diff.1" class="external text" rel="nofollow">git-diff(1)</a></span>。

<div class="archwiki-template-box archwiki-template-box-tip">

**提示：**大部分 git 托管平台（例如 GitHub 和 GitLab）支持为特定提交或合并生成补丁，只需在其 URL 结尾添加 `.patch`。对于 GitHub，请考虑在 URL 最后添加 `?full_index=1` 参数，以避免未来对象哈希值长度变更导致的校验值不匹配错误。

</div>

<div class="mw-heading mw-heading2">

## <span id=".E5.BA.94.E7.94.A8.E8.A1.A5.E4.B8.81"></span>应用补丁

</div>

本节概述如何在 `PKGBUILD` 的 `prepare()` 函数中应用你创建或从网络下载的补丁。请遵循以下步骤：

1.  为补丁文件在 `PKGBUILD` 的 `source` 数组中添加一个条目，将该条目与原始源 url 之间用空格隔开。如果该文件可在网上获得，你可以提供完整的 URL ，它将被自动下载并放在 `src` 目录中。如果它是你自己创建的补丁，则应将补丁文件与 `PKGBUILD` 文件放在同一目录中，并只需将文件名添加到 `source` 数组中，以便将其复制到 `src` 目录中。如果你要分发 `PKGBUILD`，就需要将补丁与 `PKGBUILD` 一同发布。
2.  然后使用 `makepkg -g >> PKGBUILD` 或者 `updpkgsums`（来自于 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=pacman-contrib" class="external text" rel="nofollow">pacman-contrib</a></span><sup><span class="small">包</span></sup></span>）来更新 `sha512sums` 数组。或者手动添加一个条目到 `sha512sums` 数组； 你可以使用 *sha512sum* 工具来生成你的补丁的校验和。
3.  如果 `PKGBUILD` 中还没有 `prepare()` 函数，就创建一个。
4.  第一步是在 `prepare()` 函数中进入到需要被打补丁的目录，可以通过 `cd $pkgname-$pkgver` 来完成。`$pkgname-$pkgver` 通常是源码包解包后的目录名，但并不总是这样。
5.  现在你只需要在这个目录里面应用补丁。这可以通过在 `prepare()` 函数中添加 `patch -p1 -i `*`pkgname`*`.patch` 来完成。将 *`pkgname`*`.patch` 改成包含 diff 的文件的名字（由于其在 `PKGBUILD` 的 `source` 数组中，因此已被自动复制到 `src` 目录下）。

一个 prepare 函数示例：

PKGBUILD

prepare() {\
    cd \$pkgname-\$pkgver\
    patch -Np1 -i ../eject.patch\
}\

或者不先 cd，直接使用 `patch` 的 `--directory`/`-d` 参数：

PKGBUILD

prepare() {\
    patch -d \$pkgname-\$pkgver -Np1 -i ../eject.patch\
}\

从终端运行 `makepkg`，如果一切顺利，补丁会被自动应用，并且你的新软件包会包含补丁中的更改。如果不是这样的话，你可能需要试验一下 patch 的 `--strip`/`-p` 选项。在试验的时候，你会发现 `--dry-run`, `--reverse` 或者 `--verbose` 选项会有用。更多信息参见 <span class="plainlinks archwiki-template-man" title="$ man 1 patch"><a href="https://man.archlinux.org/man/patch.1" class="external text" rel="nofollow">patch(1)</a></span>。

基本上它的工作原理如下：如果 diff 文件被用于将补丁应用到 `myversion/` 中的文件，那么 diff 文件将被应用于 `myversion/file`。你当前的运行目录为 `yourversion/`（即 `PKGBUILD` 中 cd 进的目录），在将补丁应用到文件时，需要将 `myversion/` 部分移除，只应用到 `file` 文件，所以需要使用 `-p1` 参数将路径中的第一个目录移除。但如果需要修补 `myfiles/myversion` 中的文件，就需要使用 `-p2` 移除两个目录。

如果你不应用一个 `-p` 选项，它将会去掉所有目录结构。如果所有文件都在基目录中的时候是可以的，但是如果补丁是在 `myversion/` 上创建的，并且有一个被编辑的文件是 `myversion/src/file`，当你从 `yourversion` 目录以不带 `-p` 参数应用补丁的时候，它会尝试为一个名为 `yourversion/file` 的文件打补丁。

大多数开发者从被打补丁的目录的父目录创建补丁，因此 `-p1` 通常是正确的。

<div class="mw-heading mw-heading2">

## <span id=".E4.BD.BF.E7.94.A8_quilt"></span>使用 quilt

</div>

一个更简单的创建补丁的方法是使用 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=quilt" class="external text" rel="nofollow">quilt</a></span><sup><span class="small">包</span></sup></span>，它为管理大量补丁提供了更好的支持，例如应用补丁，更新补丁和将被打补丁的文件回退到原始状态。<a href="https://wiki.debian.org/UsingQuilt" class="extiw" title="debian:UsingQuilt">Debian</a> 使用 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=quilt" class="external text" rel="nofollow">quilt</a></span><sup><span class="small">包</span></sup></span> 来管理他们的补丁。使用 quilt 生成和应用补丁、回退被打补丁的文件的基本用法和信息可参考<a href="http://www.shakthimaan.com/downloads/glv/quilt-tutorial/quilt-doc.pdf" class="external text" rel="nofollow">使用 Quilt</a>。

<div class="mw-heading mw-heading2">

## <span id=".E5.8F.A6.E8.A7.81"></span>另见

</div>

- <a href="http://www.kegel.com/academy/opensource.html" class="external free" rel="nofollow">http://www.kegel.com/academy/opensource.html</a> —— 有关修补文件的有用信息

</div>
