# this file will set up xcursor theme
g_set_current_file cursor.fish
g_log setting up xcursor theme

set WORKING_DIR ~/dotfiles/cursor/.icons/koishi_cursors/

set current (pwd)

cd $WORKING_DIR

source generate.fish

cd $current
