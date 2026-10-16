# .SRCINFO

Source: `/usr/share/doc/arch-wiki-zh-cn/html/zh-cn/.SRCINFO.html`

## Purpose

Generated, parseable package metadata used by AUR tooling without executing `PKGBUILD`.

## Operational guidance

- Regenerate after every metadata change: `makepkg --printsrcinfo > .SRCINFO`.
- Use one unquoted `key = value` pair per line with exactly one space around `=`.
- Arrays become repeated keys, such as two separate `arch =` lines.
- Begin with `pkgbase =`; each split package gets its own `pkgname =` section.
- Keep `pkgver`, `pkgrel`, and `epoch` only once in the `pkgbase` section.
- Do not hand-edit generated metadata unless diagnosing a generator problem. A stale `.SRCINFO` makes AUR display incorrect package information.
