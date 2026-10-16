# AUR Submission Guidelines

Source: `/usr/share/doc/arch-wiki-zh-cn/html/zh-cn/AUR_提交准则.html`

## Purpose

Rules for AUR package naming, metadata, SSH authentication, updating, and publication.

## Operational guidance

- Check official repositories and AUR first. Do not submit an official-package duplicate or a duplicate AUR package.
- Target `x86_64`; use `-git` for moving VCS builds and `-bin` for source-available prebuilt binaries.
- Use `conflicts` and, where needed, `provides` for alternatives. Reserve `replaces` for an actual rename.
- Include accurate maintainer/contributor comments and a package-source `LICENSE` file. Ask for maintainer identity rather than inventing it.
- Configure a dedicated AUR SSH key and initialize repositories with `git -c init.defaultBranch=master clone ssh://aur@aur.archlinux.org/pkgbase.git`.
- Regenerate `.SRCINFO` after every PKGBUILD metadata change.
- Commit all changed packaging files with a meaningful message and push only when explicitly requested. AUR accepts pushes to `master`.
- Bump `pkgver` for upstream releases and `pkgrel` for substantive packaging-only changes; do not bump either for a typo.
- Automation cannot replace package review. Do not automatically publish an update based only on a detected version.
