# Haskell

Source: `/usr/share/doc/arch-wiki-zh-cn/html/zh-cn/Haskell_打包准则.html`

## Purpose

Conventions for Haskell programs and libraries.

## Operational guidance

- Name libraries `haskell-<library>` in lowercase, normally matching Hackage.
- Treat compiled Haskell libraries and programs as architecture-dependent.
- Prefer Hackage release sources; keep an `_hkgname` when the package name includes the `haskell-` prefix.
- Rebuild reverse dependencies after a library or build-flag change.
- Install and register libraries through the supported Setup workflow into `$pkgdir`.
