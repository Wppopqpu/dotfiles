#!/usr/bin/env fish

set -l root (status dirname)
set -l theme_dir "$root/../.local/share/fcitx5/themes/mellow-noctalia-dark"
set -l palette "$HOME/.local/share/color-schemes/noctalia.colors"
set -l theme_conf "$theme_dir/theme.conf.in"
set -l panel_svg "$theme_dir/panel.svg.in"
set -l highlight_svg "$theme_dir/highlight.svg.in"

if not test -f "$palette"
    echo "Matugen palette not found: $palette" >&2
    exit 1
end
function kde_color
    set -l section $argv[1]
    set -l key $argv[2]
    set -l file $argv[3]
    awk -v section="[$section]" -v key="$key" '
        $0 == section { found=1; next }
        found && /^\[/ { found=0 }
        found && $0 ~ "^" key "=" { gsub(/ /, "", $0); split($0, a, "="); split(a[2], c, ","); printf "#%02x%02x%02x", c[1], c[2], c[3]; exit }
    ' "$file"
end

set -l primary (kde_color 'Colors:Selection' BackgroundNormal "$palette")
set -l on_primary (kde_color 'Colors:Selection' ForegroundNormal "$palette")
set -l surface (kde_color 'Colors:View' BackgroundNormal "$palette")
set -l on_surface (kde_color 'Colors:View' ForegroundNormal "$palette")
set -l surface_variant (kde_color 'Colors:Window' BackgroundNormal "$palette")
set -l outline (kde_color 'Colors:Button' DecorationFocus "$palette")

mkdir -p "$theme_dir"
sed -e "s/^NormalColor=.*/NormalColor=$on_surface/" \
    -e "s/^Name=.*/Name=Mellow Noctalia dark/" \
    -e "s/^HighlightCandidateColor=.*/HighlightCandidateColor=$on_primary/" \
    -e "s/^HighlightColor=.*/HighlightColor=$on_primary/" \
    -e "s/^HighlightBackgroundColor=.*/HighlightBackgroundColor=$primary/" \
    -e "s/^Color=#ffffff\$/Color=$surface/" \
    -e "s/^BorderColor=#ffffff00\$/BorderColor=$outline/" \
    -e "s/^NormalColor=#000000\$/NormalColor=$on_surface/" \
    "$theme_conf" > "$theme_dir/theme.conf.tmp"
mv "$theme_dir/theme.conf.tmp" "$theme_dir/theme.conf"
cp "$panel_svg" "$theme_dir/panel.svg"
sed -i -e "s/#151515/$surface/g" -e "s/#666666/$outline/g" "$theme_dir/panel.svg"
cp "$highlight_svg" "$theme_dir/highlight.svg"
sed -i -e "s/#595959/$primary/g" -e "s/#000000/$on_primary/g" "$theme_dir/highlight.svg"
fcitx5-remote -r >/dev/null 2>&1; or true
