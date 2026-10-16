# OCaml

Source: `/usr/share/doc/arch-wiki-zh-cn/html/zh-cn/OCaml_打包准则.html`

## Purpose

Rules for OCaml libraries, executables, Dune projects, and findlib installation.

## Operational guidance

- Name libraries `ocaml-<module>` and applications after the program.
- Install libraries under `/usr/lib/ocaml`; do not use the deprecated `site-lib` layout.
- Install through `ocaml-findlib` and make sure upstream supplies a correct `META` file.
- Stage findlib installation with `OCAMLFIND_DESTDIR="$pkgdir$(ocamlfind printconf destdir)"`.
- Use `options=(!strip)` when the package produces bytecode.
- Use `arch=(any)` only for source-only packages; native code is architecture-specific.
