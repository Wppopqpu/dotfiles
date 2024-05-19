if status is-interactive
    # Commands to run in interactive sessions can go here
	fish_vi_key_bindings
	abbr -a fm firefox --new-window "file://$(pwd)"
end
