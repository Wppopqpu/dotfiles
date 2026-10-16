# VCS Packages

Source: `/usr/share/doc/arch-wiki-zh-cn/html/zh-cn/VCS_软件打包准则.html`

## Purpose

Conventions for packages built from a moving version-control source tree.

## Operational guidance

- Add the VCS suffix, such as `-git`, `-hg`, or `-svn`, unless packaging a fixed release.
- Use a monotonic `pkgver()`, normally `<release>.r<revision>` or `r<revision>`; retain the `r` separator for correct version ordering.
- Include the VCS client in `makedepends`, declare conflicts/provides explicitly, and generally avoid `replaces`.
- Moving VCS sources require `sha256sums=('SKIP')`; do not use shallow or sparse clones.
- Use `source=('[folder::][vcs+]url[#fragment]')` and never put `$pkgver` in the source folder name.
- For Git, a typical version function is `git describe --long --abbrev=7 | sed 's/\\([^-]*-g\\)/r\\1/;s/-/./g'`; supply a commit-count fallback for untagged repositories.
- List Git submodules as separate sources and redirect them locally in `prepare()`; add `git-lfs` when LFS objects are required.
