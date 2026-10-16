# PHP

Source: `/usr/share/doc/arch-wiki-zh-cn/html/zh-cn/PHP_打包准则.html`

## Purpose

Minimal rules for packaging PHP libraries.

## Operational guidance

- Name libraries `php-<lowercase-hyphenated-library-name>`.
- Install library files under `/usr/share/php/`.
- Use `arch=(any)` unless the package genuinely includes architecture-specific native code.
- This guideline covers libraries, not deployment of a full PHP web application stack.
