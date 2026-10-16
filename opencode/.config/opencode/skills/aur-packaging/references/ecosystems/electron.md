# Electron Applications

Source: `/usr/share/doc/arch-wiki-zh-cn/html/zh-cn/Electron_打包准则.html`

## Purpose

Package Electron applications around Arch's versioned system Electron runtime.

## Operational guidance

- Package app resources only and execute them through the matching `/usr/bin/electron<version>` wrapper.
- Remove bundled Electron runtimes. Programs requiring `ELECTRON_RUN_AS_NODE=1` cannot use a system runtime this way.
- Do not mutate `package.json` or lockfiles with `sed`; use npm tooling to align the development Electron version.
- Build native extensions against the selected system Electron version and keep `HOME` inside `$srcdir` during npm work.
- Use `/usr/lib/<app>` for architecture-dependent resources, `/usr/share/<app>` otherwise, and `/opt/<app>` for intentionally bundled distributions.
