# KDE

Source: `/usr/share/doc/arch-wiki-zh-cn/html/zh-cn/KDE_软件打包准则.html`

## Purpose

KDE-specific naming, CMake, and desktop integration practices.

## Operational guidance

- Build out of tree with CMake and preserve environment-controlled compiler flags.
- Use the KDE prefix from `kf5-config --prefix` where the target KDE generation requires it; use `/usr` for official `extra` packaging.
- Follow KDE names such as `plasma5-applets-<name>`, `plasma5-runners-<name>`, and `kf5-servicemenus-<name>` where applicable.
- Do not add `.install` cache-update commands for hicolor icons or desktop files; pacman hooks already do that work.
