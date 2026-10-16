# Rust

Source: `/usr/share/doc/arch-wiki-zh-cn/html/zh-cn/Rust_软件打包准则.html`

## Purpose

Reproducible, offline-capable Cargo packaging for Rust binary crates.

## Operational guidance

- Package binary crates, not library-only crates; use a lowercase package name matching the executable where practical.
- Use crates.io sources with a stable `static.crates.io` URL and build-depend on `cargo`.
- In `prepare()`, run `cargo fetch --locked --target "$CARCH-unknown-linux-gnu"`.
- Build with `CARGO_TARGET_DIR=target cargo build --frozen --release --all-features`.
- Test with `cargo test --frozen --all-features`, adding `--workspace` for workspaces; avoid reusing release artifacts for test builds.
- Install from `target/release`. If `cargo install` is necessary, use `--no-track --frozen --root "$pkgdir/usr/" --path .`.
