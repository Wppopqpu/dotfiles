# Arch and AUR Packaging References

This reference set is a concise English operational digest of AUR-related pages in the local Arch Wiki mirror. It is not a replacement for the referenced upstream documentation. The matching Pandoc-converted Chinese originals are available in `../sources/`.

## Reading order

1. Start with [Creating Packages](foundation/creating-packages.md), [PKGBUILD](foundation/pkgbuild.md), and [Arch Packaging Standards](foundation/arch-packaging-standards.md).
2. Read the matching page in `ecosystems/` after identifying the project's language, framework, or artifact type.
3. Use [AUR Submission Guidelines](aur-workflow/aur-submission-guidelines.md) before preparing an AUR repository or publishing an update.
4. Build in a clean chroot and inspect the result with [Clean Chroot Builds](foundation/clean-chroot-builds.md) and [Namcap](foundation/namcap.md).

## Categories

- `foundation/`: PKGBUILD authoring, integrity, building, validation, and generic standards.
- `aur-workflow/`: AUR review, submission, maintenance, and governance.
- `ecosystems/`: Rules for language runtimes, build systems, and specialized artifact types.
- `operations/`: Build acceleration, repository state, signatures, testing, and debugging.

## Selection guide

| Project signal | Read first |
| --- | --- |
| `Cargo.toml` | `ecosystems/rust.md` |
| `pyproject.toml` or `setup.py` | `ecosystems/python.md` |
| `go.mod` | `ecosystems/go.md` |
| `package.json` | `ecosystems/nodejs.md`; add `electron.md` for Electron |
| `CMakeLists.txt` | `ecosystems/cmake.md` |
| VCS-only upstream | `foundation/vcs-packages.md` |
| Kernel module | `ecosystems/dkms.md` or `ecosystems/kernel-modules.md` |
| Prebuilt Windows program | `ecosystems/wine.md` |
| Font archive | `ecosystems/fonts.md` |
| AUR publication or update | `aur-workflow/aur-submission-guidelines.md` and `foundation/srcinfo.md` |

## Source policy

Every reference names its local HTML source. Review the source page when an upstream policy, command interface, or release-specific rule may have changed.
