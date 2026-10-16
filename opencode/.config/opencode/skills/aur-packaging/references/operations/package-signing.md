# Package Signing

Source: `/usr/share/doc/arch-wiki-zh-cn/html/zh-cn/Pacman/软件包签名.html`

## Purpose

Pacman repository and package-signature trust configuration.

## Operational guidance

- Keep normal signature policy near `Required DatabaseOptional TrustedOnly`; do not use broad `TrustAll` policies.
- Initialize official trust with `pacman-key --init` and `pacman-key --populate`.
- For a third-party repository, inspect a key fingerprint and locally sign it only after independent verification.
- Locally built AUR artifacts do not inherit official-repository trust just because `pacman -U` can install them.
- Source verification, PKGBUILD review, and binary package signatures address separate trust boundaries.
