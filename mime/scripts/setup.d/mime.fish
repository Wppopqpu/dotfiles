# Set up xdg-mime
g_set_current_file mime.fish

set NVIM_DESKTOP nvim.desktop

g_log Setting up (g_quote xdg-mime)...

function set_mime
	g_log Setting default of mimetype[s] (g_quote $argv[2..]) to (g_quote $argv[1])...
	xdg-mime default $argv[1] $argv[2..]
end

function setup_nvim
	g_log Setting up nvim...

	if test ! -x /usr/bin/xdg-mime
		g_log (g_quote xdg-mime) does not exist. Skipping..
		return
	end

	if test ! -f /usr/share/applications/$NVIM_DESKTOP
		g_log Desktop file (g_quote $NVIM_DESKTOP) does not exist. Skipping...
		return
	end

	if test ! -x /usr/bin/nvim
		g_log (g_quote nvim) does not exist. Skipping...
		return
	end

	if test (xdg-mime query default text/plain) = nvim.desktop
		g_log Default of (g_quote text/plain) is already set to (g_quote $NVIM_DESKTOP). Skipping...
		return
	end

	set_mime $NVIM_DESKTOP text/plain
end

setup_nvim
