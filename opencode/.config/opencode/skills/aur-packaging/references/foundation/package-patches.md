# Package Patches

Source: `/usr/share/doc/arch-wiki-zh-cn/html/zh-cn/软件包补丁.html`

## Purpose

Create, validate, and apply source patches from a `PKGBUILD`.

## Operational guidance

- Prepare sources without building via `makepkg -o` or `makepkg --nobuild`.
- Copy an extracted tree to `package.orig` and `package.new`, modify only the latter, and inspect with `diff -ura`.
- Generate a patch with `diff -ura package.orig package.new > package.patch`.
- Verify it from the original tree with `patch -p1 -i ../package.patch`, then rebuild and test.
- Add the patch to `source=()` and update its checksum using `updpkgsums`.
- Apply it in `prepare()`, normally with `patch -Np1 -i ../name.patch`; adjust strip depth only to match the patch paths.
