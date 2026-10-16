# Kernel Modules

Source: `/usr/share/doc/arch-wiki-zh-cn/html/zh-cn/内核模块打包指南.html`

## Purpose

Split conventional kernel-module packages to support multiple kernels without file conflicts.

## Operational guidance

- Split kernel-version-specific modules from shared utilities and support files.
- The standard-kernel module package depends on the matching kernel and the shared utilities package.
- Build separate module packages for alternate kernels; each can provide the standard module package.
- Place replacement modules in `/lib/modules/<kernel-version>/updates` so `depmod` gives them precedence.
- Use this model for modules shipped for known kernels; use DKMS when automatic rebuild across kernels is the requirement.
