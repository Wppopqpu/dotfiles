# distcc

Source: `/usr/share/doc/arch-wiki-zh-cn/html/zh-cn/Distcc.html`

## Purpose

Distribute C and C++ compilation across network workers.

## Operational guidance

- Enable `distcc` in `BUILDENV`, define `DISTCC_HOSTS`, and size `MAKEFLAGS` for the available worker slots.
- Do not use `-march=native` when dispatching builds to heterogeneous workers.
- Pump mode requires a `DISTCC_HOSTS` pump configuration, `pump --startup`, and `pump --shutdown`.
- Monitor with `distccmon-text` and inspect daemon logs with `journalctl` when failures occur.
- Treat distcc as host-specific optimization; disable it when diagnosing a package failure.
