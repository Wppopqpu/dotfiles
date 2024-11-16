# This file sets up some config stuff that cannot be managed by stow.

set CURRENT_FILE setup

function g_log
	echo "[$CURRENT_FILE]" $argv
end

function g_quote
	echo "` $argv '"
end

function g_set_current_file
	set CURRENT_FILE $argv
end

set SETUP_DIR $HOME/scripts/setup.d

g_log Setting up...

for each in $SETUP_DIR/*.fish
	g_log Sourcing (g_quote $each)...
	source $each
	g_set_current_file setup
end
