# No systemd-localed? Then set xkbmap manually.
[[ -x $(which localectl) ]] || setxkbmap -layout dvorak -option 'ctrl:nocaps,altwin:ctrl_alt_win,compose:menu,lv3:ralt_switch'

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

exec startkde
