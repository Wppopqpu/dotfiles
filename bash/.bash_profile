# /etc/skel/.bash_profile

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
if [[ -f ~/.bashrc ]] ; then
	. ~/.bashrc
fi

export LANG=zh_CN.UTF-8
export LC_COLLATE=C.UTF-8

export MOZ_ENABLE_WAYLAND=1

export SHELL=/bin/fish

export PATH="$HOME/.local/bin:$PATH"

export GTK_THEME=Adwaita-dark
