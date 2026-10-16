# Python

Source: `/usr/share/doc/arch-wiki-zh-cn/html/zh-cn/Python_打包准则.html`

## Purpose

Current Arch conventions for Python libraries and Python-coupled applications.

## Operational guidance

- Name libraries and Python-ecosystem applications `python-<name>`; pure Python is usually `arch=(any)`, while C extensions are architecture-specific.
- Prefer upstream release archives. Use `_name=${pkgname#python-}` when source naming differs from the package name.
- Put package metadata runtime requirements in `depends`, not only `makedepends`.
- For PEP 517, add `python-build`, `python-installer`, `python-wheel`, and the actual backend; build with `python -m build --wheel --no-isolation` and stage with `python -m installer --destdir="$pkgdir" dist/*.whl`.
- Prefer source builds over wheels and avoid hardcoded Python or site-packages paths.
- Do not use `tox` to validate the packaged result. Run the project test suite in `check()` and neutralize upstream pytest addopts when needed.
