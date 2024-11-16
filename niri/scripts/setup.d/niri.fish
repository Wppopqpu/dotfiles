# This file will set up niri.

set SYSTEM_SERVICE_DIR /usr/lib/systemd/user
set LOCAL_SERVICE_DIR $HOME/.config/systemd/user
set NIRI_SERVICE_DIR $HOME/.config/systemd/user/niri.service.wants

function log
	echo "[niri.fish]" $argv
end

function quote
	echo "` $argv '"
end

function prepare_dir
	if test ! -d $argv
		log Directory (quote $argv) does not exist. Trying creating one...
		mkdir -p $argv
	end
end

function add_unit
	log Adding unit (quote $argv)...
	ln -s $argv $NIRI_SERVICE_DIR/
end

function setup_systemd
	log Setting up systemd...
	add_unit $SYSTEM_SERVICE_DIR/mako.service
	add_unit $SYSTEM_SERVICE_DIR/waybar.service
	add_unit $LOCAL_SERVICE_DIR/swaybg.service
	add_unit $LOCAL_SERVICE_DIR/swayidle.service
end

log Setting up niri...

prepare_dir $NIRI_SERVICE_DIR
setup_systemd
