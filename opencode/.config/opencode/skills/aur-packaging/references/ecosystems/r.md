# R

Source: `/usr/share/doc/arch-wiki-zh-cn/html/zh-cn/R_软件打包准则.html`

## Purpose

Package R modules from CRAN, MRAN snapshots, and Bioconductor.

## Operational guidance

- Name packages `r-<pkgname>` in lowercase and derive name and version from `DESCRIPTION`.
- Sanitize unsupported version characters such as `:` and `-`.
- Map `Depends`, `Imports`, and `LinkingTo` to runtime `depends`; map `Suggests` to `optdepends`.
- Inspect `SystemRequirements` for external packages, including possible Fortran tooling.
- `NeedsCompilation: yes` usually means architecture-specific; otherwise use `arch=(any)`.
- Build with `R CMD INSTALL` into a temporary library and stage the result in `/usr/lib/R/library` without build-user ownership.
