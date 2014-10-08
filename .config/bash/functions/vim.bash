vim() {
	rtus=reattach-to-user-namespace
	if [[ ! -x $(which ${rtus}) ]]; then
		rtus=command
	fi
	eval ${rtus} vim ${@}
}
