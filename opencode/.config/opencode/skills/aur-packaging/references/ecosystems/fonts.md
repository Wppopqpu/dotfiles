# Fonts

Source: `/usr/share/doc/arch-wiki-zh-cn/html/zh-cn/字体打包指南.html`

## Purpose

Naming, metadata, dependency, and installation conventions for font archives.

## Operational guidance

- Prefix TrueType packages with `ttf-`, OpenType packages with `otf-`, and variable fonts with `-variable`.
- Use lowercase names, describe the font class, and normally set `arch=(any)`.
- Install font files mode `644` below `/usr/share/fonts/<type>`.
- Do not add font-cache dependencies solely for cache refresh; pacman hooks handle installed fonts.
- Add `provides=('ttf-font')` only when the family meets the virtual-package requirements.
- Install custom license text, including OFL text, below `/usr/share/licenses/$pkgname`.
