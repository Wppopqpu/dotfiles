# Packaging Security

Source: `/usr/share/doc/arch-wiki-zh-cn/html/zh-cn/Arch_打包准则/安全.html`

## Purpose

Binary hardening and secure systemd-service defaults for Arch packages.

## Operational guidance

- Inspect binaries with `checksec --file=/path/to/binary`; Namcap catches some related defects.
- Preserve Arch compiler and linker flags. Missing PIE, fortify, stack protection, NX, or RELRO often means the build system discarded supplied flags.
- Inspect loader paths with `objdump -x binary | grep -E 'RPATH|RUNPATH'`; avoid attacker-controlled RPATH or RUNPATH locations.
- Keep `CPPFLAGS="-D_FORTIFY_SOURCE=3"` when compatible.
- For Go hardening, use PIE plus external linking and relevant CGO flags when the project supports them.
- Evaluate packaged services with `systemd-analyze security service.name`.
- Apply only compatible sandboxing directives such as `PrivateTmp=true`, `ProtectSystem=strict`, and `NoNewPrivileges=true`; do not use memory-write restrictions for JIT workloads.
