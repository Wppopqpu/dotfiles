# Go

Source: `/usr/share/doc/arch-wiki-zh-cn/html/zh-cn/Go_语言软件打包准则.html`

## Purpose

Reproducible and hardened packaging of Go applications and modules.

## Operational guidance

- Name Go ecosystem libraries `go-<module>`; use the ordinary application name for end-user applications.
- For module projects, keep the module cache under the build tree with `GOPATH="$srcdir"` and `go mod download -modcacherw`.
- Forward Arch C and linker flags through the `CGO_*FLAGS` variables.
- Use suitable `GOFLAGS`, including `-buildmode=pie`, `-trimpath`, external linking, and `-mod=readonly` or a validated vendor mode.
- Patch upstream Makefiles that discard `GOFLAGS`, or invoke `go build` directly.
- Avoid inventing module metadata for non-module projects when reproducibility matters.
