if status is-interactive
    # Commands to run in interactive sessions can go here
	fish_vi_key_bindings
	abbr -a fm firefox --new-window "file://$(pwd)"
	abbr -a stow stow -v2
	abbr -a rstow sudo stow -t / -v2
	abbr -a gs git switch
	abbr -a gb git branch
	abbr -a gc git commit
	abbr -a ga git add
	abbr -a gl git log
	abbr -a gS git status
	abbr -a gp git push
	abbr -a gP git pull

	abbr -a emerge emerge -a

	# Load colors & theme.
	set FPATH $HOME/.local/share/nvim/lazy/tokyonight.nvim/extras/fish/tokyonight_moon.fish
	if test -e $FPATH
		. $FPATH
	end

	# Greeting.
	function fish_greeting
		echo "󱄄  󰆍 "
	end

	function peek_portage_log
		sudo tail -f /var/tmp/portage/*/*/temp/build.log
	end

	if test -e $HOME/.local/bin/mise
		$HOME/.local/bin/mise activate | source
	end
end
