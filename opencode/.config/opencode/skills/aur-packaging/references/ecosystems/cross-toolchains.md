# Cross-compilation Toolchains

Source: `/usr/share/doc/arch-wiki-zh-cn/html/zh-cn/交叉编译工具打包准则.html`

## Purpose

Build compatible cross-compilation toolchain packages.

## Operational guidance

- Match compatible GCC, binutils, libc, and kernel-header versions.
- Build in order: cross-binutils, target headers, stage-one GCC, target libc, then stage-two GCC.
- Do not prefix package names with `cross-`; use a valid vendorless or `unknown` target triplet.
- Keep a target-specific sysroot such as `/usr/lib/<target>` and install target-prefixed executables under `/usr/bin`.
- Use out-of-tree builds and clear the source tree after a PKGBUILD change when configure state can be stale.
- Inspect `config.log`, sysroot contents, and installation semantics when a toolchain build fails.
