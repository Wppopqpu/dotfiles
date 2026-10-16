# Official Repositories

Source: `/usr/share/doc/arch-wiki-zh-cn/html/zh-cn/官方仓库.html`

## Purpose

Explains stable, testing, staging, and multilib repository roles.

## Operational guidance

- Build against a fully updated and internally consistent official package set.
- Testing repositories must precede stable repositories and should be enabled coherently.
- Never use staging as a normal package build environment; it is intentionally incomplete.
- AUR packages are outside the official testing and release pipeline.
- If testing repositories are enabled, use a matching clean chroot configuration rather than mixing inconsistent host state.
