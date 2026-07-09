#!/usr/bin/env fish

set SIZES 24,32,48,64,96

mkdir -p cursors
rm -rf cursors/*

python3 scripts/generate-multi.py --sizes $SIZES original/install.inf -o cursors
