# Arch Packaging Standards

Source: `/usr/share/doc/arch-wiki-zh-cn/html/zh-cn/Arch_打包准则.html`

## Purpose

Arch-wide rules for package layout, metadata, dependencies, source security, licensing, and reproducibility.

## Operational guidance

- Never install into `/usr/local` or `/usr/libexec`; use `/usr` and `/usr/lib/${pkgname}` where appropriate.
- Avoid custom variables; prefix unavoidable custom variables with `_`. Quote `"$srcdir"` and `"$pkgdir"`.
- Declare every direct dependency and move nonessential functionality to `optdepends`.
- Prefer `https://` and `git+https://` sources, validate with checksums and PGP, and never weaken verification to work around an upstream defect.
- Pin signed Git release sources by object hash, not a mutable tag name.
- Put system configuration in `/etc`; do not package files into `/tmp`, `/run`, `/proc`, `/sys`, `/home`, or other system-managed locations.
- Use SPDX identifiers for the upstream `license` field. Package-source licensing has separate requirements for official Arch packaging.
- Check reproducibility with `makerepropkg` or `repro` when practical.
