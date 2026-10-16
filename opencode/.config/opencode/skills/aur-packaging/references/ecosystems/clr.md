# CLR and Mono

Source: `/usr/share/doc/arch-wiki-zh-cn/html/zh-cn/CLR_软件打包准则.html`

## Purpose

PKGBUILD rules for Mono-based CLR applications and libraries.

## Operational guidance

- Use `depends=(mono)`, `arch=(any)`, and normally `options=(!strip)`.
- Install executable launchers in `/usr/bin` and forward arguments with `mono application.exe "$@"`.
- Install reusable assemblies in Mono's GAC only when they are intended as dependencies.
- GAC assemblies need a signing key and must be registered into the staged `$pkgdir/usr/lib` location.
