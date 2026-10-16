# Eclipse Plugins

Source: `/usr/share/doc/arch-wiki-zh-cn/html/zh-cn/Eclipse_插件打包准则.html`

## Purpose

Install Eclipse plugins without feature or JAR collisions.

## Operational guidance

- Name packages `eclipse-<pluginname>` and depend on `eclipse`.
- Install each plugin in `/usr/share/eclipse/dropins/<pluginname>/eclipse/`, not Eclipse's shared root directories.
- Keep plugin JARs in `plugins/`, but extract feature JARs into their own `features/<feature-name>/` directories.
- Remove source-only feature/plugin archives and redundant `pack.gz` files when they are not needed.
- Preserve the isolated `dropins/<plugin>/eclipse/{features,plugins}` layout to prevent file conflicts.
