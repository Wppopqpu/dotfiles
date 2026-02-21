#!/usr/bin/env fish

set SCALE 2

mkdir -p res
mkdir -p cursors

# clean up
rm res/*
rm cursors/*

# use win2xcur to generate from .ani files

for each in original/*.ani
	win2xcur $each --scale $SCALE -o res
	echo generated from $each.
end



# create symlinks
set -l mappings \
    "Normal"     "default left_ptr arrow" \
    "Help"       "help question_arrow" \
    "Working"    "watch progress" \
    "Busy"       "wait watch" \
    "Text"       "text xterm" \
    "Handwriting" "pencil" \
    "Move"       "move" \
    "Link"       "pointer hand hand2" \
    "Unavailable" "not-allowed crossed_circle" \
    "Vertical"   "ns-resize" \
    "Horizontal" "ew-resize" \
    "Diagonal1"  "nwse-resize" \
    "Diagonal2"  "nesw-resize" \
    "Pin"        "dnd-none grabbing"

for i in (seq 1 2 (count $mappings))
    set src $mappings[$i]
    set links_str $mappings[(math $i + 1)]

    if test -f "res/$src"
        for linkname in (string split " " -- $links_str)
            ln -sf "../res/$src" "cursors/$linkname"
            echo "cursors/$linkname -> res/$src"
        end
    else
        echo "WARN: 'res/$src' not exist, skipped."
    end
end

echo done.
