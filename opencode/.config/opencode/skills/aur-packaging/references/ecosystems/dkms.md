# DKMS Modules

Source: `/usr/share/doc/arch-wiki-zh-cn/html/zh-cn/DKMS_软件包打包准则.html`

## Purpose

Package kernel modules that DKMS rebuilds across installed kernels.

## Operational guidance

- Name the package `<upstream>-dkms` and include `dkms` in `depends`.
- Install module source and `dkms.conf` into `/usr/src/<name>-<version>/`.
- Do not compile, load, unload, or call `dkms` from `PKGBUILD` or a `.install` script; pacman hooks handle lifecycle actions.
- Do not depend on a specific kernel's headers.
- Store DKMS-managed patches below the staged source tree and list them in `dkms.conf`.
