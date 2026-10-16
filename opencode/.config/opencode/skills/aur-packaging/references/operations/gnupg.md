# GnuPG for Packaging

Source: `/usr/share/doc/arch-wiki-zh-cn/html/zh-cn/GnuPG.html`

## Purpose

Manage OpenPGP keys and verify or produce detached signatures.

## Operational guidance

- Protect `~/.gnupg` and private-key material; do not export private material into package repositories.
- Import a key with `gpg --import file.asc` or obtain it with `gpg --receive-keys <key-id>`.
- Verify the complete fingerprint through an independent channel. A keyserver lookup alone is not authentication.
- Verify detached signatures with `gpg --verify file.sig [file]`.
- For upstream AUR sources, validate upstream key identity before accepting a valid signature.
