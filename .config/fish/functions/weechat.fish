function weechat -d 'weechat wrapper'
	if not set -q XDG_CONFIG_HOME
		set -x XDG_CONFIG_HOME {$HOME}/.config
	end
	command weechat -d {$XDG_CONFIG_HOME}/weechat {$argv}
end
