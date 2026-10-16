# Java

Source: `/usr/share/doc/arch-wiki-zh-cn/html/zh-cn/Java_打包准则.html`

## Purpose

Filesystem layout, launcher, naming, and dependency rules for Java packages.

## Operational guidance

- Prefix generic libraries with `java-`; user-facing applications may use their program name.
- Install JAR files under `/usr/share/java/<program>/` and shared non-JAR data under `/usr/share/<program>/`.
- Write a `/usr/bin` launcher; do not rely on `JAVA_HOME` or reuse an upstream cross-distribution launcher.
- Use `exec /usr/bin/java -jar /usr/share/java/<program>/<program>.jar "$@"` for a main JAR.
- Depend on `java-runtime` to run software and `java-environment` to compile it.
- Keep writable state out of `/usr`; use `/etc`, `/var`, or user home state as appropriate.
