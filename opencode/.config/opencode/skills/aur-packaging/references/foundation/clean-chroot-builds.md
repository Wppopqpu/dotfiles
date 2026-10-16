# Clean Chroot Builds

Source: `/usr/share/doc/arch-wiki-zh-cn/html/zh-cn/创建一个干净的_chroot.html`

## Purpose

Isolate builds so undeclared host dependencies and host configuration cannot leak into packages.

## Operational guidance

- Prefer `pkgctl build` or the relevant `devtools` helper from the directory containing `PKGBUILD`.
- Use `extra-x86_64-build` for `extra`-like x86_64 builds and `multilib-build` for multilib targets.
- For a manual chroot, create it with `mkarchroot "$CHROOT/root" base-devel` and update it using `arch-nspawn "$CHROOT/root" pacman -Syu`.
- Build with `makechrootpkg -c -r "$CHROOT"`; the `-c` flag cleans the working chroot.
- Preinstall unavailable local dependencies with repeated `-I package.pkg.tar.zst` options.
- Pass makepkg flags after `--`, for example `makechrootpkg -c -r "$CHROOT" -- --check`.
- A missing `devtools` installation is a validation limitation, not a reason to claim a clean build passed.
