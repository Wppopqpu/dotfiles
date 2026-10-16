# Namcap

Source: `/usr/share/doc/arch-wiki-zh-cn/html/zh-cn/Namcap.html`

## Purpose

Detect common defects in `PKGBUILD` files and built package archives.

## Operational guidance

- Run `namcap PKGBUILD` and `namcap package.pkg.tar.zst` before publishing.
- Use `namcap --info` for additional context and `--machine-readable` for automation.
- Treat `E` findings as release blockers; they commonly involve unsafe permissions, security, or missing licensing.
- Investigate warnings instead of suppressing them blindly; dependency warnings require runtime inspection.
- Custom rules distinguish `pkgbuild` and `tarball` analysis and return errors, warnings, and informational tags.
