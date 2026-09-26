#!/usr/bin/env fish

set -l config_source "$HOME/.config/unity3d"
set -l target_dir "$HOME/documents/game_save_backup"
set -l verbose false

function show_help
    echo "Usage: (status filename) [OPTIONS] [target-directory]"
    echo ""
    echo "Backup Unity game data from ~/.config/unity3d"
    echo ""
    echo "Options:"
    echo "  --help, -h    Show this help message"
    echo "  -v            Verbose output"
    echo ""
    echo "Arguments:"
    echo "  target-directory   Backup destination (default: ~/documents/game_save_backup)"
    echo ""
    echo "Example:"
    echo "  (status filename) -v ~/backups/unity"
end

set -l positional_args

for arg in $argv
    switch $arg
        case --help -h
            show_help
            exit 0
        case -v
            set verbose true
        case '*'
            set positional_args $positional_args $arg
    end
end

if test (count $positional_args) -gt 1
    echo "Usage: (status filename) [OPTIONS] [target-directory]" >&2
    exit 2
end

if test (count $positional_args) -eq 1
    set target_dir $positional_args[1]
end

switch $target_dir
    case '~'
        set target_dir $HOME
    case '~/*'
        set target_dir (string replace -r '^~/' "$HOME/" -- $target_dir)
end

test $verbose = true; and echo "[verbose] Source: $config_source"
test $verbose = true; and echo "[verbose] Target base: $target_dir"

if not test -d "$config_source"
    echo "Unity game data directory not found: $config_source" >&2
    exit 1
end

test $verbose = true; and echo "[verbose] Creating backup directory..."

mkdir -p "$target_dir"
or begin
    echo "Unable to create backup directory: $target_dir" >&2
    exit 1
end

set -l timestamp (date '+%Y%m%d_%H%M%S')
set -l backup_dir "$target_dir/unity_game_data_$timestamp"

test $verbose = true; and echo "[verbose] Backup directory: $backup_dir"

mkdir -p "$backup_dir/config"
or begin
    echo "Unable to create backup: $backup_dir" >&2
    exit 1
end

if test -d "$config_source"
    test $verbose = true; and echo "[verbose] Copying $config_source..."
    cp -a "$config_source" "$backup_dir/config/"
    or begin
        rm -rf "$backup_dir"
        echo "Backup failed while copying: $config_source" >&2
        exit 1
    end
    test $verbose = true; and echo "[verbose] Copy completed successfully"
end

echo "Backup created: $backup_dir"
