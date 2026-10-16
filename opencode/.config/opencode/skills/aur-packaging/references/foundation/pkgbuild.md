# PKGBUILD Reference

Source: `/usr/share/doc/arch-wiki-zh-cn/html/zh-cn/PKGBUILD.html`

## Purpose

Reference for the Bash metadata, source, dependency, integrity, and packaging directives consumed by `makepkg`.

## Operational guidance

- Define `pkgname`, `pkgver`, `pkgrel`, and `arch`. Keep package names lowercase and use no hyphen in `pkgver`.
- Reset `pkgrel=1` for a new upstream release; increment it for a packaging-only rebuild.
- Declare direct runtime dependencies in `depends`, build-only tools in `makedepends`, tests in `checkdepends`, and optional features in `optdepends`.
- Do not list `base-devel` members as dependencies.
- Use unique local source names with `name::URL` when necessary. Add `.sig`, `.sign`, or `.asc` sources to enable PGP verification.
- Put complete uppercase fingerprints only in `validpgpkeys`; prefer strong upstream checksums and signatures.
- List `backup` files as relative paths such as `etc/example.conf`. Empty directories and wildcard backup entries are unsupported.
- Use `provides`, `conflicts`, and `replaces` only for real package relationships; `replaces` is normally only for a rename.
