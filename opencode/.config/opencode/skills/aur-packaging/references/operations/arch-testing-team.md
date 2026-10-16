# Arch Testing Team

Source: `/usr/share/doc/arch-wiki-zh-cn/html/zh-cn/Arch_测试团队.html`

## Purpose

Official testing workflow before repository promotion.

## Operational guidance

- Test installation and basic behavior; for libraries, verify the loaded library with `ldd`.
- Reboot and validate when testing kernels or kernel-module changes.
- File bugs with package name, version, `pkgrel`, trigger, component, and useful logs.
- Official signoffs apply only to official repository promotion, not to AUR recipes.
- Use the same evidence standard when reporting an AUR packaging defect upstream or to its maintainer.
