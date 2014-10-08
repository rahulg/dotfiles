open() {
	rtus=reattach-to-user-namespace
	if [[ ! -x $(which $rtus) ]]; then
		rtus=command
	fi
	if [[ $(uname -s) = 'Darwin' ]]; then
		open=open
	else
		open=xdg-open
	fi
	eval ${rtus} ${open} ${@}
}
