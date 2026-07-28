g_set_current_file make.fish

g_log running make system
fish -c "cd ~/setup/; make -k V=1 all" | while read -l line
	g_log $line
end
