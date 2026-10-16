# Node.js

Source: `/usr/share/doc/arch-wiki-zh-cn/html/zh-cn/Node.js_打包准则.html`

## Purpose

PKGBUILD conventions for Node.js libraries, applications, and npm installation.

## Operational guidance

- Name libraries `nodejs-<name>`; name standalone applications after the program.
- Fetch npm registry sources using the stable registry tarball form and use `noextract` when npm consumes the tarball directly.
- Add `npm` to `makedepends` and install staged packages with `npm install -g --prefix "$pkgdir/usr"`.
- Keep npm cache under `$srcdir` and normalize staged ownership with `chown -R root:root "$pkgdir"`.
- Remove npm build-path metadata from installed `package.json` files.
- Use nvm only to select a build-time Node version; do not depend on the packager's home configuration.
