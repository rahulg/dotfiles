tmux() {
	tmconf=tmux.conf
	if [[ $(uname -s) = 'Darwin' ]]; then
		tmconf=osx.conf
	elif [[ $(uname -s) = 'Linux' ]]; then 
		if [[ ! -n ${DISPLAY+1} && ${XDG_SESSION_TYPE} = x11 ]]; then
			tmconf=x11.conf
		fi
	fi
	command tmux -f ~/.config/tmux/${tmconf} ${@}
}
