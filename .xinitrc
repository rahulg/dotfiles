# No systemd-localed? Then set xkbmap manually.
[[ -x $(which localectl) ]] || setxkbmap -layout dvorak -option 'ctrl:nocaps,altwin:ctrl_alt_win,compose:menu,lv3:ralt_switch'

if [ -f ~/.Xmodmap ]
then
	xmodmap ~/.Xmodmap
fi

exec startkde
