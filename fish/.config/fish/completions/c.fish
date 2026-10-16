function __c_complete_scripts
    set -l scripts_dir "$HOME/scripts"
    test -d "$scripts_dir"; or return

    find -L "$scripts_dir" -type f \( -name '*.fish' -o -name '*.py' \) -printf '%P\n' 2>/dev/null
end

complete -c c -n 'test (count (commandline -opc)) -eq 1' -f -a '(__c_complete_scripts)'
