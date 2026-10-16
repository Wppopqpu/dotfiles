# Debug Builds and Backtraces

Source: `/usr/share/doc/arch-wiki-zh-cn/html/zh-cn/调试/获取跟踪信息.html`

## Purpose

Rebuild packages with debug symbols and collect actionable crash information.

## Operational guidance

- Start applications using `gdb --args application args`, reproduce the issue, then run `thread apply all backtrace full`.
- Find package ownership with `pacman -Qo /path/to/file`.
- Build debug symbols with `options=(debug !strip)` or use a separate debug package when appropriate.
- Install the matching main and debug packages from the same build.
- Arch Debuginfod normally does not provide symbols for AUR builds; rebuild the exact AUR artifact locally for debugging.
