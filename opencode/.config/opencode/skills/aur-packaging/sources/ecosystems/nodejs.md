<div class="mw-content-ltr mw-parser-output" lang="zh-Hans-CN" dir="ltr">

<div class="aside archwiki-template-box archwiki-template-box-note noexcerpt">

**翻译状态：**

- 本文（或部分内容）译自 <a href="https://wiki.archlinux.org/title/Node.js_package_guidelines" class="extiw" title="arch:Node.js package guidelines">Node.js package guidelines</a>，最近一次同步于 2021-03-12，若英文版本有所<a href="https://wiki.archlinux.org/title/Node.js_package_guidelines?diff=0&amp;oldid=721278" class="external text" rel="nofollow">更改</a>，则您可以帮助同步与[翻译](../zh-cn/Help:%E7%BF%BB%E8%AF%91.html "Help:翻译")更改的内容。
- 您可以在 <a href="https://wiki.archlinux.org/title/Node.js_package_guidelines_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)?action=history" class="external text" rel="nofollow">ArchWiki 的对应页面</a>找到本文翻译的**原始**修订历史。
- 本文可能与英文原文存在出入。

</div>

<div class="archwiki-template-box" style="display:block; text-align: center; margin-bottom: 1em;">

**[Arch 打包准则](../zh-cn/Arch_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Arch 打包准则")**

------------------------------------------------------------------------

<a href="../zh-cn/32_%E4%BD%8D%E8%BD%AF%E4%BB%B6%E5%8C%85%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html" class="mw-redirect" title="32位软件包打包准则">32 位</a> – [安全](../zh-cn/Arch_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99/%E5%AE%89%E5%85%A8.html "Arch 打包准则/安全") – [CLR](../zh-cn/CLR_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "CLR 软件打包准则") – [CMake](../zh-cn/CMake_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "CMake 软件打包准则") – [DKMS](../zh-cn/DKMS_%E8%BD%AF%E4%BB%B6%E5%8C%85%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "DKMS 软件包打包准则") – [Eclipse](../zh-cn/Eclipse_%E6%8F%92%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Eclipse 插件打包准则") – [Electron](../zh-cn/Electron_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Electron 打包准则") – [Free Pascal](../zh-cn/Free_Pascal_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Free Pascal 打包准则") – <a href="/wzh/index.php?title=GNOME_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="GNOME package guidelines（页面不存在）">GNOME</a> – [Go](../zh-cn/Go_%E8%AF%AD%E8%A8%80%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Go 语言软件打包准则") – [Haskell](../zh-cn/Haskell_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Haskell 打包准则") – [Java](../zh-cn/Java_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Java 打包准则") – [交叉编译工具](../zh-cn/%E4%BA%A4%E5%8F%89%E7%BC%96%E8%AF%91%E5%B7%A5%E5%85%B7%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "交叉编译工具打包准则") – [KDE](../zh-cn/KDE_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "KDE 软件打包准则") – <a href="/wzh/index.php?title=Lisp_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Lisp package guidelines（页面不存在）">Lisp</a> – <a href="/wzh/index.php?title=Meson_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Meson package guidelines（页面不存在）">Meson</a> – <a href="/wzh/index.php?title=MinGW_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="MinGW package guidelines（页面不存在）">MinGW</a> – [内核模块](../zh-cn/%E5%86%85%E6%A0%B8%E6%A8%A1%E5%9D%97%E6%89%93%E5%8C%85%E6%8C%87%E5%8D%97.html "内核模块打包指南") – <span class="mw-selflink selflink">Node.js</span> – <a href="/wzh/index.php?title=Nonfree_applications_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Nonfree applications package guidelines（页面不存在）">Nonfree</a> – [OCaml](../zh-cn/OCaml_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "OCaml 打包准则") – <a href="/wzh/index.php?title=Perl_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Perl package guidelines（页面不存在）">Perl</a> – [PHP](../zh-cn/PHP_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "PHP 打包准则") – [Python](../zh-cn/Python_%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Python 打包准则") – [R](../zh-cn/R_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "R 软件打包准则") – <a href="/wzh/index.php?title=Ruby_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Ruby package guidelines（页面不存在）">Ruby</a> – [Rust](../zh-cn/Rust_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "Rust 软件打包准则") – <a href="/wzh/index.php?title=Shell_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Shell package guidelines（页面不存在）">Shell</a> – [VCS](../zh-cn/VCS_%E8%BD%AF%E4%BB%B6%E6%89%93%E5%8C%85%E5%87%86%E5%88%99.html "VCS 软件打包准则") – <a href="/wzh/index.php?title=Web_application_package_guidelines&amp;action=edit&amp;redlink=1" class="new" title="Web application package guidelines（页面不存在）">Web</a> – <a href="../zh-cn/Wine_package_guidelines.html" class="mw-redirect" title="Wine package guidelines">Wine</a> – [字体](../zh-cn/%E5%AD%97%E4%BD%93%E6%89%93%E5%8C%85%E6%8C%87%E5%8D%97.html "字体打包指南")

</div>

本文档包含了给 [Node.js](../zh-cn/Node.js.html "Node.js") 软件包编写 [PKGBUILD](../zh-cn/PKGBUILD.html "PKGBUILD") 的规范与指导。

<div class="mw-heading mw-heading2">

## <span id=".E8.BD.AF.E4.BB.B6.E5.8C.85.E5.91.BD.E5.90.8D"></span>软件包命名

</div>

<div class="archwiki-template-box archwiki-template-box-tip">

**提示：**可以用自定义变量 `_pkgname` 代替 `pkgname`，一般这个变量可以这样定义： `_pkgname=${pkgname#nodejs-}`

</div>

Node.js 库的软件包名应该以 `nodejs-` 开头。对于独立的应用，只使用程序名。

<div class="mw-heading mw-heading2">

## <span id=".E6.BA.90.E4.BB.A3.E7.A0.81"></span>源代码

</div>

<a href="/wzh/index.php?title=Npm&amp;action=edit&amp;redlink=1" class="new" title="Npm（页面不存在）">npm</a> 提供了可靠的命名规范和下载 URL。[PKGBUILD#source](../zh-cn/PKGBUILD.html#source "PKGBUILD") `source=()` 列表可以使用下面的 URL 模板：

https://registry.npmjs.org/\$\_pkgname/-/\$\_pkgname-\$pkgver.tgz\

<div class="mw-heading mw-heading2">

## <span id=".E4.BD.BF.E7.94.A8_npm"></span>使用 npm

</div>

使用 <a href="/wzh/index.php?title=Npm&amp;action=edit&amp;redlink=1" class="new" title="Npm（页面不存在）">npm</a> 安装时，应当将其添加为构建时依赖。

makedepends=('npm')\

不需要解压压缩包：

noextract=("\${\_pkgname}-\${pkgver}.tgz")\

这是一个最小的 <a href="../zh-cn/Creating_packages.html#package()" class="mw-redirect" title="Creating packages">package</a> 函数：

package() {\
    npm install -g --prefix "\${pkgdir}/usr" "\${srcdir}/\${\_pkgname}-\${pkgver}.tgz"\
\
    # npm 会把所有文件的所有权交给构建用户\
    # https://bugs.archlinux.org/task/63396\
    chown -R root:root "\${pkgdir}"\
}\

<div class="mw-heading mw-heading3">

### <span id=".E8.AE.BE.E7.BD.AE.E4.B8.B4.E6.97.B6.E7.BC.93.E5.AD.98"></span>设置临时缓存

</div>

当 *npm* 处理 `package.json` 时，npm 会为了构建软件包，下载依赖到默认的缓存目录 `$HOME/.npm`。为了避免污染用户的 home 目录，可以用 `--cache` 选项，将缓存目录临时设为其他目录。

下载依赖到 `${srcdir}/npm-cache`，然后安装它们到打包目录：

npm install --cache "\${srcdir}/npm-cache" \

继续正常打包：

npm run packager\

<div class="mw-heading mw-heading3">

### <span id=".E8.BD.AF.E4.BB.B6.E5.8C.85.E5.8C.85.E5.90.AB.E5.90.91_.24srcdir.2F.24pkgdir_.E7.9A.84.E5.BC.95.E7.94.A8"></span>软件包包含向 \$srcdir/\$pkgdir 的引用

</div>

很不幸，*npm* 会创建指向 `$srcdir` 和 `$pkgdir ` 的引用。这是一个<a href="https://github.com/npm/cli/issues/3828" class="external text" rel="nofollow">已知问题</a>。但你可以手动删除这些引用，反正也不会用到它们。

所有依赖都会在 `_where` 属性里，包含指向 `$pkgdir` 的引用，你通常可以用一点 *sed* 魔法删除它们：

find "\$pkgdir" -name package.json -print0 \| xargs -r -0 sed -i '/\_where/d'\

你的主软件包也会包含一些其他引用，删除它们最简单的办法就删除所有有下划线的属性，但用 *sed* 不是很方便。你可以使用 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=jq" class="external text" rel="nofollow">jq</a></span><sup><span class="small">包</span></sup></span> 得到想要的结果：

local tmppackage="\$(mktemp)"\
local pkgjson="\$pkgdir/usr/lib/node_modules/\$\_pkgname/package.json"\
jq '.\|=with_entries(select(.key\|test("\_.+")\|not))' "\$pkgjson" \> "\$tmppackage"\
mv "\$tmppackage" "\$pkgjson"\
chmod 644 "\$pkgjson"\

另一个你会找到对 `$pkgdir` 引用的地方，是软件包的 `man` 属性。如果你不在乎 man 页面（反正它们不会被作为依赖安装），你可以像这样删除它们：

find "\$pkgdir" -type f -name package.json \| while read pkgjson; do\
    local tmppackage="\$(mktemp)"\
    jq 'del(.man)' "\$pkgjson" \> "\$tmppackage"\
    mv "\$tmppackage" "\$pkgjson"\
    chmod 644 "\$pkgjson"\
done\

一个使用了上面全部三个技巧的例子：<span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://aur.archlinux.org/packages/readability-cli/" class="external text" rel="nofollow">readability-cli</a></span><sup><span class="small">AUR</span></sup></span>。

<div class="mw-heading mw-heading2">

## <span id=".E4.BD.BF.E7.94.A8_nvm"></span>使用 nvm

</div>

当一个基于 [node.js](../zh-cn/Node.js.html "Node.js") 的应用需要**构建**或**打包**使用不同的 node.js 版本时，可以使用 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://aur.archlinux.org/packages/nvm/" class="external text" rel="nofollow">nvm</a></span><sup><span class="small">AUR</span></sup></span>。

<div class="archwiki-template-box archwiki-template-box-warning">

**警告：**这只适用于应用的构建 / 打包时依赖，不影响运行时依赖.

</div>

把它加入构建时依赖：

makedepends=('npm' 'nvm')\

<span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://aur.archlinux.org/packages/nvm/" class="external text" rel="nofollow">nvm</a></span><sup><span class="small">AUR</span></sup></span> 使用 `NVM_DIR` <a href="../zh-cn/Environment_variable.html" class="mw-redirect" title="Environment variable">环境变量</a>来查找前缀（译注：指 nvm 的安装路径，下同）。如果不在 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://aur.archlinux.org/packages/nvm/" class="external text" rel="nofollow">nvm</a></span><sup><span class="small">AUR</span></sup></span> 初始化前指定，前缀就会被设置为 `$HOME/.nvm`。

你可以用下面的函数创建自定义前缀，并将用户目录和前缀隔离开：

\_ensure_local_nvm() {\
    # let's be sure we are starting clean\
    which nvm \>/dev/null 2\>&1 && nvm deactivate && nvm unload\
    export NVM_DIR="\${srcdir}/.nvm"\
\
    # The init script returns 3 if version specified\
    # in ./.nvrc is not (yet) installed in \$NVM_DIR\
    # but nvm itself still gets loaded ok\
    source /usr/share/nvm/init-nvm.sh \|\| \[\[ \$? != 1 \]\]\
}\

应该在使用 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://aur.archlinux.org/packages/nvm/" class="external text" rel="nofollow">nvm</a></span><sup><span class="small">AUR</span></sup></span>、<span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://archlinux.org/packages/?name=npm" class="external text" rel="nofollow">npm</a></span><sup><span class="small">包</span></sup></span> 或其他基于特定版本 [Node.js](../zh-cn/Node.js.html "Node.js") 的程序前，调用这个函数。

<div class="mw-heading mw-heading3">

### <span id=".E7.A4.BA.E4.BE.8B_PKGBUILD_.E7.94.A8.E6.B3.95"></span>示例 [PKGBUILD](../zh-cn/PKGBUILD.html "PKGBUILD") 用法

</div>

prepare() {\
    \_ensure_local_nvm\
    nvm install 14.15.0\
}\
\
build() {\
    \_ensure_local_nvm\
    npm install\
}\

或者，执行不带参数的 `nvm install`，会在当前目录的 `.nvrc` 文件中查找版本字符串。

这个用法的一个例子可以在 <span class="nobreak"><span class="plainlinks archwiki-template-pkg"><a href="https://aur.archlinux.org/packages/insomnia/" class="external text" rel="nofollow">insomnia</a></span><sup><span class="small">AUR</span></sup></span> 找到。

</div>
