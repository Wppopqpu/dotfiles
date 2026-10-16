---
name: aur-packaging
description: Package, update, validate, and prepare Arch Linux AUR recipes from an existing software project. Use whenever the user asks to create or update a PKGBUILD, package software for Arch Linux or the AUR, maintain an AUR package, update a supplied upstream release/tag/version, generate .SRCINFO, or fix an Arch package build. Inspect the project, classify its ecosystem and package type autonomously, then follow the matching Arch packaging guidance. Do not use merely to install an existing AUR package.
compatibility: Requires an Arch Linux packaging environment for builds; use makepkg, devtools/pkgctl, namcap, and Git only when available and appropriate.
---

# Arch and AUR Packaging

Create and maintain high-quality, source-based Arch packages. Treat a `PKGBUILD` as executable code and an AUR publication as a public, difficult-to-reverse operation.

Read [the reference index](references/README.md) first. Read the relevant foundation, AUR workflow, and ecosystem pages before changing packaging files. Use the matching Pandoc-converted Chinese page in [sources/](sources/README.md) when a concise English reference does not settle a rule, command option, exception, or example.

## Scope and boundaries

- Work from an existing upstream project or an existing package repository.
- Create or update `PKGBUILD`, `.SRCINFO`, patches, `.install` files, and other package-owned files when necessary.
- Update a package only when the user supplies a specific upstream version, release URL, source archive, or VCS tag/commit. Do not independently search for or apply new upstream versions.
- Default to source builds. Use a `-bin` package only when the project is genuinely distributed and intended as a prebuilt binary package.
- Do not invent a maintainer name, email address, upstream URL, license, checksum, PGP fingerprint, dependency, release version, or test result. Ask one focused question when a required fact is missing.
- Do not run `makepkg` as root.
- Do not run `git add`, `git commit`, `git push`, force-push, or AUR requests unless the user explicitly requests that publication action. A successful local build is not permission to publish.
- Never weaken checksums, PGP verification, or signature validation merely to make a build succeed.

## Classify before packaging

Inspect the repository root and existing packaging files. Determine all applicable categories before selecting commands.

| Signal | Classification | Read |
| --- | --- | --- |
| Existing `PKGBUILD` | update or repair | `foundation/pkgbuild.md`, `foundation/makepkg.md` |
| `Cargo.toml` | Rust binary crate | `ecosystems/rust.md` |
| `pyproject.toml` or `setup.py` | Python | `ecosystems/python.md` |
| `go.mod` | Go | `ecosystems/go.md` |
| `package.json` | Node.js | `ecosystems/nodejs.md` |
| Electron files or Electron dependency | Electron | `ecosystems/electron.md` |
| `CMakeLists.txt` | CMake | `ecosystems/cmake.md` |
| `.git` source with no fixed release | VCS package | `foundation/vcs-packages.md` |
| `dkms.conf` or kernel module source | DKMS or kernel module | `ecosystems/dkms.md` or `ecosystems/kernel-modules.md` |
| font files | fonts | `ecosystems/fonts.md` |
| Windows executable/installer | Wine | `ecosystems/wine.md` |
| Java, OCaml, Haskell, R, PHP, CLR, Free Pascal, KDE, Eclipse, 32-bit, or cross-toolchain markers | specialized package | matching file in `ecosystems/` |

Multiple classifications can apply. For example, a Rust VCS package needs both Rust and VCS guidance; an Electron Node.js package needs both Electron and Node.js guidance.

## New package workflow

1. Read `foundation/creating-packages.md`, `foundation/pkgbuild.md`, `foundation/arch-packaging-standards.md`, `foundation/clean-chroot-builds.md`, and the matching ecosystem reference.
2. Inspect upstream metadata, license, source/release process, build instructions, tests, produced files, and runtime behavior. Build or test upstream manually when this exposes the actual commands and dependencies.
3. Check whether the software is already available in official repositories or AUR before preparing a publishable AUR recipe. Read `aur-workflow/aur-submission-guidelines.md` for AUR work.
4. Select correct package naming and type: stable release, VCS, prebuilt binary, split package, architecture-specific, or `any`. Preserve all direct runtime dependencies and distinguish build and test dependencies.
5. Write a minimal conventional `PKGBUILD`:
   - Use HTTPS source URLs and upstream checksums or signatures.
   - Use `prepare()` for patches or one-time source preparation, `build()` for compilation, `check()` for tests, and `package()` only for staging into `"$pkgdir"`.
   - Install under `/usr`, not `/usr/local`; do not place mutable application state in the package image.
   - Keep commands non-interactive and avoid host-home state by redirecting tool caches to `"$srcdir"` when relevant.
6. Add only necessary local files, include them in `source=()`, record checksums, and add an accurate upstream license field. If AUR publication is intended, obtain maintainer identity before adding the maintainer comment.
7. Generate `.SRCINFO` with `makepkg --printsrcinfo > .SRCINFO`.

## Update workflow

Apply this workflow only when the user supplies the target version, release URL, source archive, tag, or commit.

1. Read the current `PKGBUILD`, `.SRCINFO`, source declarations, patches, and related scripts. Inspect the upstream change information supplied by the user.
2. Confirm the package class remains correct. Do not convert a stable package to VCS or `-bin` merely because an update is inconvenient.
3. Update the source and version metadata:
   - New stable upstream release: set `pkgver` to the normalized upstream version and reset `pkgrel=1`.
   - Packaging-only fix: keep `pkgver` and increment `pkgrel`.
   - VCS package: do not update solely because the moving source has new commits; update the recipe only for a packaging change or an explicitly requested tag/commit change.
4. Re-evaluate patches, source signatures, checksums, direct dependencies, build dependencies, test dependencies, install paths, and license metadata. Remove obsolete patches rather than carrying them forward without evidence.
5. Regenerate checksums with `updpkgsums` or the appropriate makepkg mechanism. Do not replace a failed checksum with `SKIP` except for a moving VCS source where the VCS guideline calls for it.
6. Regenerate `.SRCINFO`, then build and validate the updated package.
7. Report changed files, artifact paths, validation results, unresolved warnings, and any required manual follow-up. Prepare publication commands only when explicitly asked.

## Validation workflow

Use the strongest available validation and state exactly what could not run.

1. Validate Bash and metadata by running `makepkg` in the recipe directory as an unprivileged user.
2. Prefer a clean chroot build with `pkgctl build`. If unavailable, report that isolation was not performed rather than calling the build clean.
3. Run upstream tests through `check()` whenever they are available and reliable. Do not silently add `--nocheck` to bypass failures.
4. Run `namcap PKGBUILD` and `namcap <artifact>` when `namcap` is available. Treat errors as blockers; investigate warnings.
5. Inspect artifacts using `pacman -Qip` and `pacman -Qlp`; verify package name, version, dependencies, architecture, file paths, and absence of build-directory leakage.
6. Test the installed package behavior in a controlled environment when practical. For binaries and services, apply the relevant security guidance.
7. For a VCS package, test `pkgver()` and confirm the result is monotonic and valid for pacman version comparison.

## AUR publication workflow

Run this section only after the user explicitly asks to publish, commit, or push.

1. Read `aur-workflow/aur-submission-guidelines.md` and verify package naming, duplicate status, maintainer metadata, license, and `.SRCINFO` freshness.
2. Show the exact changed files and Git diff before staging.
3. Confirm that the target remote is the intended AUR `pkgbase` and the local Git identity is correct for public attribution.
4. Stage only package-owned files, create a meaningful commit, and push the AUR `master` branch.
5. Report the remote package URL, commit hash, and any rejected remote policy checks. Do not force-push unless the user explicitly asks for it and understands the consequence.

## Required reporting

End each task with:

- Classification and references used.
- Files created or modified.
- Version decision: `pkgver`, `pkgrel`, and reason.
- Build, test, chroot, Namcap, and artifact-inspection results.
- Known limitations or warnings.
- Publication status, explicitly stating when no Git commit or push was performed.

## Reference set

- [Reference index](references/README.md)
- [Converted source index](sources/README.md)
- [AUR submission rules](references/aur-workflow/aur-submission-guidelines.md)
- [Clean builds](references/foundation/clean-chroot-builds.md)
- [PKGBUILD reference](references/foundation/pkgbuild.md)
- [Packaging standards](references/foundation/arch-packaging-standards.md)
- [VCS packages](references/foundation/vcs-packages.md)
