# No systemd-localed? Then set xkbmap manually.
[[ -x $(which localectl) ]] || setxkbmap -layout dvorak -option 'ctrl:nocaps,altwin:swap_alt_win'

if [[ -d /etc/X11/xinit/xinitrc.d ]]; then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
		[[ -x "$f" ]] && . "$f"
	done
	unset f
fi

if [ -f ~/.Xmodmap ]
then
	xmodmap ~/.Xmodmap
fi

exec gnome-session
