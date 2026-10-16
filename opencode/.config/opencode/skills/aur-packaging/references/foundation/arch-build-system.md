# Arch Build System

Source: `/usr/share/doc/arch-wiki-zh-cn/html/zh-cn/Arch_构建系统.html`

## Purpose

Working with official Arch packaging recipes and the tools used to rebuild them locally.

## Operational guidance

- Retrieve an official recipe with `pkgctl repo clone package-name`, optionally with `--protocol=https` or `--switch=<version>`.
- Official packaging repositories contain `PKGBUILD`, `.SRCINFO`, keys, and patches, not upstream source trees or binary artifacts.
- Copy a recipe directory before applying local changes; build it in a clean chroot.
- A dirty host can hide undeclared dependencies and create a package that fails elsewhere.
- For a locally modified official package, consider `groups=('modified')` plus `IgnoreGroup = modified`; rebuild promptly after ignored updates to avoid partial upgrades.
