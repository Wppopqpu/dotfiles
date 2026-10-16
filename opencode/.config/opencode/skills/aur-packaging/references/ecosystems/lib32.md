# 32-bit Packages

Source: `/usr/share/doc/arch-wiki-zh-cn/html/zh-cn/32_位软件包打包准则.html`

## Purpose

Conventions for 32-bit and x32 packages on 64-bit Arch systems.

## Operational guidance

- Prefix 32-bit packages with `lib32-`; suffix x32 ABI packages with `-x32`.
- State `(32-bit)` in `pkgdesc`.
- Add `-m32` to `CFLAGS`, `CXXFLAGS`, and `LDFLAGS`, and use `PKG_CONFIG_PATH=/usr/lib32/pkgconfig`.
- Avoid native-package conflicts; configure Autoconf projects with 32-bit program and library paths.
