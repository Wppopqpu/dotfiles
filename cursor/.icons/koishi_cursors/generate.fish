#!/usr/bin/env fish

set SCALE 2

mkdir -p cursors
rm -rf cursors/*

cd original

win2xcurtheme ./install.inf --scale $SCALE -o ../cursors

cd ..
