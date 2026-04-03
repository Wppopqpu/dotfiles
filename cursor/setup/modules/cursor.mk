TARGETS += gui.theme.koishi_cursors
.PHONY: gui.theme.koishi_cursors
gui.theme.koishi_cursors: $(HOME)/.icons/koishi_cursors/cursors/text

$(HOME)/.icons/koishi_cursors/cursors/text: $(HOME)/.icons/koishi_cursors/original /usr/bin/win2xcurtheme
	@echo building koishi_cursors using win2xcurtheme...
	cd $(HOME)/.icons/koishi_cursors/ && fish generate.fish
