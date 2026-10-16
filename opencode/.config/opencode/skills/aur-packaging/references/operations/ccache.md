# ccache

Source: `/usr/share/doc/arch-wiki-zh-cn/html/zh-cn/Ccache.html`

## Purpose

Cache compiler outputs to speed repeated local package builds.

## Operational guidance

- Enable it by removing `!` from `ccache` in makepkg's `BUILDENV`.
- Inspect the cache with `ccache -s`, clear it with `ccache -C`, and bypass it with `CCACHE_DISABLE=1`.
- To use it in `makechrootpkg`, bind-mount a cache directory and set `CCACHE_DIR` inside the chroot.
- ccache is an acceleration, not a packaging dependency or a portability guarantee.
- Reproduce suspicious compiler failures with the cache disabled before reporting an AUR build bug.
