# makepkg

Source: `/usr/share/doc/arch-wiki-zh-cn/html/zh-cn/Makepkg.html`

## Purpose

Configures and runs the tool that builds binary Arch packages from `PKGBUILD` recipes.

## Operational guidance

- Configure makepkg in `/etc/makepkg.conf`, `/etc/makepkg.conf.d/makepkg.conf`, `$XDG_CONFIG_HOME/pacman/makepkg.conf`, or `~/.makepkg.conf`.
- Set `PACKAGER`; set `GPGKEY` when signing artifacts. Source signature checks use the user's GnuPG keyring, not pacman's keyring.
- Never run `makepkg` as root. Run it as an ordinary user.
- Build from the directory containing `PKGBUILD`; use `makepkg --syncdeps` for missing repository dependencies.
- Use `makepkg --install` only when installation is intended and `makepkg --clean` to discard stale build state.
- Refresh checksums with `updpkgsums` or `makepkg --geninteg`.
- Use `makepkg -o` to prepare editable sources and `makepkg -ef` to rebuild without extracting them again.
