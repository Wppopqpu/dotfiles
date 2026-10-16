# Wine Applications

Source: `/usr/share/doc/arch-wiki-zh-cn/html/zh-cn/Wine_打包准则.html`

## Purpose

Package Win32 applications for Wine while isolating mutable user state.

## Operational guidance

- Verify redistribution rights and whether upstream supports archive or unattended installation before packaging.
- Install immutable application files below `/usr/share/$pkgname` and provide a wrapper under `/usr/bin`.
- Create state beneath the user's home directory through a package-specific `WINEPREFIX`; do not let Wine modify `/usr`.
- For installer-only payloads, set `WINEPREFIX` and XDG state below `$srcdir` while preparing sources.
- Link read-only application files to user state, but copy files that the application must modify.
- Consider Gecko and Mono overrides only when the application does not require them.
