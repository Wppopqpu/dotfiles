if status is-interactive
    # Commands to run in interactive sessions can go here
	fish_vi_key_bindings
	abbr -a fm firefox --new-window "file://$(pwd)"
	abbr -a stow stow -v2
	abbr -a rstow sudo stow -t / -v2
end
