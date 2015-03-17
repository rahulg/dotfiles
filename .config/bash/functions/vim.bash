vim() {
	cmd=command
	which reattach-to-user-namespace >/dev/null 2>/dev/null
	if [[ ${?} -eq 0 ]]; then
		cmd=reattach-to-user-namespace
	fi
	eval ${cmd} vim ${@}
}
