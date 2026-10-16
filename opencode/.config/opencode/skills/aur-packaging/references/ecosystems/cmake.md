# CMake

Source: `/usr/share/doc/arch-wiki-zh-cn/html/zh-cn/CMake_软件打包准则.html`

## Purpose

Reproducible, flag-preserving, out-of-tree CMake packaging.

## Operational guidance

- Add `cmake` to `makedepends`; configure out of tree with `cmake -B build -S source` and build with `cmake --build build`.
- Prefer `-DCMAKE_BUILD_TYPE=None` so upstream does not override Arch optimization flags.
- Set `-DCMAKE_INSTALL_PREFIX=/usr` and stage with `DESTDIR="$pkgdir" cmake --install build`.
- Run `ctest --test-dir build --output-on-failure --parallel "$(nproc)"` when tests are available.
- Prevent build-time FetchContent downloads: package the dependency as a source and configure disconnected local source paths.
- Remove unsafe RPATH using the appropriate CMake RPATH option, then verify with Namcap.
