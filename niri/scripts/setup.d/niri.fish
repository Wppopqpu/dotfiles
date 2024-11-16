# This file will set up niri.
g_set_current_file niri.fish

set SYSTEM_SERVICE_DIR /usr/lib/systemd/user
set LOCAL_SERVICE_DIR $HOME/.config/systemd/user
set NIRI_SERVICE_DIR $HOME/.config/systemd/user/niri.service.wants

# function log
# 	echo "[niri.fish]" $argv
# end
#
# function quote
# 	echo "` $argv '"
# end

function prepare_dir
	if test ! -d $argv
		g_log Directory (G-quote $argv) does not exist. Trying creating one...
		mkdir -p $argv
	end
end

function add_unit
	g_log Adding unit (g_quote $argv)...
	ln -s $argv $NIRI_SERVICE_DIR/ 2> /dev/null
	if test $status -eq 1
		g_log WARNING: Cannot add unit (g_quote $argv). It may already exists.
	end
end

function setup_systemd
	g_log Setting up systemd...
	add_unit $SYSTEM_SERVICE_DIR/mako.service
	add_unit $SYSTEM_SERVICE_DIR/waybar.service
	add_unit $LOCAL_SERVICE_DIR/swaybg.service
	add_unit $LOCAL_SERVICE_DIR/swayidle.service
end

g_log Setting up niri...

prepare_dir $NIRI_SERVICE_DIR
setup_systemd
