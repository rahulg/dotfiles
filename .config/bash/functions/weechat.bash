weechat() {
	command weechat -d ${XDG_CONFIG_HOME:-${HOME}/.config}/weechat ${@}
}
