# This file sets up some config stuff that cannot be managed by stow.

function log
	echo "[setup.fish]" $argv
end

function quote
	echo "` $argv '"
end

set SETUP_DIR $HOME/scripts/setup.d

log Setting up...

for each in $SETUP_DIR/*.fish
	log Sourcing (quote $each)...
	source $each
end
