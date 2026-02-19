# Set up xdg-mime
g_set_current_file mime.fish

set NVIM_DESKTOP nvim.desktop
set ZATHURA_DESKTOP org.pwmt.zathura.desktop

g_log Setting up (g_quote xdg-mime)...

# set_mime [desktop-file] [filetype]
function set_mime
	g_log Setting default of mimetype[s] (g_quote $argv[2..]) to (g_quote $argv[1])...
	xdg-mime default $argv[1] $argv[2..]
end

# setup_one_mime [filetype] [desktop-file]
function setup_one_mime
	g_log setting up (g_quote $argv[2]) for (g_quote $argv[1])

	if test ! -f /usr/share/applications/$argv[2]
		g_log Desktop file (g_quote $argv[2]) does not exist. Skipping...
		return
	end

	if test ! -x /usr/bin/nvim
		g_log (g_quote nvim) does not exist. Skipping...
		return
	end

	if test (xdg-mime query default $argv[1]) = $argv[2]
		g_log Default of (g_quote $argv[1]) is already set to (g_quote $argv[2]). Skipping...
		return
	end

	set_mime $argv[2] $argv[1]
end

function setup_mime

	if test ! -x /usr/bin/xdg-mime
		g_log (g_quote xdg-mime) does not exist. Skipping..
		return
	end

	setup_one_mime text/plain $NVIM_DESKTOP
	setup_one_mime application/pdf $ZATHURA_DESKTOP
end

setup_mime
