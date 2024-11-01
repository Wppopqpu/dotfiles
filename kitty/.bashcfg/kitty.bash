# Fetch theme from tokyonight if available.
FPATH=~/.local/share/nvim/lazy/tokyonight.nvim/extras/kitty/tokyonight_moon.conf
TARGET=~/.config/kitty/theme.conf

echo Testing kitty theme path.
if [[ -f $FPATH ]] ; then
	SRC_DATE=$(stat -c %Y $FPATH)
	DST_DATE=$(stat -c %Y $TARGET)
	if [[ $DST_DATE -ge $SRC_DATE ]] ; then
		echo Kitty theme already updated. Skipped.
	else
		cp -f $FPATH $TARGET
		echo Kitty theme fetched from tokyonight.
	fi
else
	echo "" > $TARGET
fi
