# Converted Arch Wiki Sources

This directory contains Pandoc conversions of the original Chinese offline Arch Wiki HTML pages used by this skill.

- Each source file is GitHub Flavored Markdown generated with Pandoc 3.11 from the local HTML mirror. The bundled Lua filter retains the MediaWiki article body and removes the offline site's navigation shell.
- Its category and English filename match the corresponding concise summary in `../references/`.
- The matching reference page records the exact original HTML path in its `Source:` line.
- Read the concise English reference first. Read the converted source when exact wording, an exception, command options, or an example is needed.
- Generated Markdown can preserve navigational material and minor conversion artifacts from the HTML source. Treat the local HTML file as the authoritative offline original when conversion fidelity matters.
