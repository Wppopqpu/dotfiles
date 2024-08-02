# Fetch theme from tokyonight if available.
FPATH=~/.local/share/nvim/lazy/tokyonight.nvim/extras/kitty/tokyonight_moon.conf
TARGET=~/.config/kitty/theme.conf

# echo testing theme path
if [[ -f $FPATH ]] ; then
	cp -f $FPATH $TARGET
	# echo "Kitty theme fetched from tokyonight."
else
	echo "" > $TARGET
fi
