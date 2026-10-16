# Arch User Repository

Source: `/usr/share/doc/arch-wiki-zh-cn/html/zh-cn/Arch_用户软件仓库.html`

## Purpose

Obtain, audit, build, install, and maintain AUR recipes safely.

## Operational guidance

- Clone recipes with `git clone https://aur.archlinux.org/package.git` and run `git pull` before rebuilding updates.
- Review `PKGBUILD`, `.install`, patches, and every auxiliary file before running any build command.
- Build as an unprivileged user with `makepkg -s`; use `makepkg --packagelist` to locate all output artifacts.
- Install artifacts with `pacman -U package-file` only after review and validation.
- AUR helpers and `makepkg -s` resolve repository dependencies, not arbitrary other AUR dependencies.
- Rebuild affected AUR packages following official-library ABI upgrades; pacman does not manage AUR updates.
- AUR recipes are unofficial and can be malicious. A successful build is not an audit result.
