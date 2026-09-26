#!/usr/bin/env fish

set -l verbose false

function show_help
    echo "Usage: (status filename) [OPTIONS] <backup-directory> <game-path>"
    echo ""
    echo "Restore Unity game data from a backup snapshot"
    echo ""
    echo "Options:"
    echo "  --help, -h    Show this help message"
    echo "  -v            Verbose output"
    echo ""
    echo "Arguments:"
    echo "  backup-directory   Path to backup snapshot (e.g., ~/documents/game_save_backup/unity_game_data_20260926_210404)"
    echo "  game-path          Relative path inside unity3d (e.g., 'Atelier Ueshima Erika/Starweaver_Express')"
    echo ""
    echo "Example:"
    echo "  (status filename) -v ~/documents/game_save_backup/unity_game_data_20260926_210404 'Atelier Ueshima Erika/Starweaver_Express'"
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

if test (count $positional_args) -ne 2
    echo "Usage: (status filename) [OPTIONS] <backup-directory> <game-path>" >&2
    echo "Run with --help for more information" >&2
    exit 2
end

set -l backup_dir $positional_args[1]
set -l game_path $positional_args[2]

switch $backup_dir
    case '~'
        set backup_dir $HOME
    case '~/*'
        set backup_dir (string replace -r '^~/' "$HOME/" -- $backup_dir)
end

test $verbose = true; and echo "[verbose] Backup directory: $backup_dir"
test $verbose = true; and echo "[verbose] Game path: $game_path"

if test -z "$game_path"; or string match -qr '(^/|(^|/)\.\.(/|$))' -- $game_path
    echo "Game path must be a relative path inside unity3d." >&2
    exit 2
end

set -l source_dir "$backup_dir/config/unity3d/$game_path"
set -l target_dir "$HOME/.config/unity3d/$game_path"

test $verbose = true; and echo "[verbose] Source: $source_dir"
test $verbose = true; and echo "[verbose] Target: $target_dir"

if not test -d "$source_dir"
    echo "Saved game directory not found: $source_dir" >&2
    exit 1
end

set -l target_parent (dirname "$target_dir")
test $verbose = true; and echo "[verbose] Creating parent directory: $target_parent"

mkdir -p "$target_parent"
or begin
    echo "Unable to create game directory parent: $target_parent" >&2
    exit 1
end

set -l timestamp (date '+%Y%m%d_%H%M%S')
set -l rollback_dir "$target_dir.before_restore_$timestamp"
set -l had_existing_data false

if test -e "$target_dir"
    test $verbose = true; and echo "[verbose] Preserving existing data to: $rollback_dir"
    mv "$target_dir" "$rollback_dir"
    or begin
        echo "Unable to preserve existing game data: $target_dir" >&2
        exit 1
    end
    set had_existing_data true
else
    test $verbose = true; and echo "[verbose] No existing data found"
end

test $verbose = true; and echo "[verbose] Restoring game data..."

cp -a "$source_dir" "$target_dir"
or begin
    if test $had_existing_data = true
        test $verbose = true; and echo "[verbose] Restore failed, rolling back..."
        mv "$rollback_dir" "$target_dir"
    end
    echo "Restore failed; existing data was kept." >&2
    exit 1
end

test $verbose = true; and echo "[verbose] Restore completed successfully"

echo "Restored: $game_path"
if test $had_existing_data = true
    echo "Previous data: $rollback_dir"
end
