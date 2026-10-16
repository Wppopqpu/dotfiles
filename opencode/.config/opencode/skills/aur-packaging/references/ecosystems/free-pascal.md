# Free Pascal

Source: `/usr/share/doc/arch-wiki-zh-cn/html/zh-cn/Free_Pascal_打包准则.html`

## Purpose

Packaging conventions for Free Pascal libraries, units, and cross-compiled targets.

## Operational guidance

- Depend on or build-depend on `fpc`.
- Query compiler version and unit path with `fpc -iV`, `fpc -iSP`, and `fpc -iSO` instead of hardcoding them.
- Install compiled units under `/usr/lib/fpc/<version>/units/<target>`.
- Add `staticlibs` when import libraries are installed.
- Use target-specific package names and unit paths for cross builds; non-Unix targets commonly need `!strip`.
