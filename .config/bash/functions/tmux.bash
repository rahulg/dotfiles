tmux() {
	tmconf=tmux.conf
	if [[ $(uname -s) = 'Darwin' ]]; then
		tmconf=osx.conf
	elif [[ $(uname -s) = 'Linux' ]]; then 
		if [[ ! -n ${DISPLAY+1} ]]; then
			tmconf=x11.conf
		fi
	fi
	command tmux -f ~/.config/tmux/${tmconf} ${@}
}
