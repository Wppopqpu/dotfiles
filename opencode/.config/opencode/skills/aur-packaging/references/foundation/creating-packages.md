# Creating Packages

Source: `/usr/share/doc/arch-wiki-zh-cn/html/zh-cn/创建软件包.html`

## Purpose

End-to-end workflow for authoring, testing, and publishing a `PKGBUILD`.

## Operational guidance

- Install `base-devel`, then manually build and test the upstream project before writing the package recipe.
- Begin in an empty work directory using `/usr/share/pacman/PKGBUILD.proto` or a closely related existing recipe.
- A `PKGBUILD` is Bash. Use makepkg's absolute `"$srcdir"` and `"$pkgdir"` paths and keep build functions non-interactive.
- The execution order is `prepare()`, `pkgver()`, `build()`, `check()`, then the required `package()`.
- Install under `/usr`, never `/usr/local`; use a staging install such as `make DESTDIR="$pkgdir" install`.
- Build with `makepkg`, inspect results with `pacman -Qlp` and `pacman -Qip`, then run `namcap` on both recipe and artifact.
- Prefer `pkgctl build` in a clean chroot. Supply unavoidable local build dependencies with `pkgctl build -I path/to/package.pkg.tar.zst`.
