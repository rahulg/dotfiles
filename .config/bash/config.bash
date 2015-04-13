if [[ $(uname -s) = 'Darwin' ]]; then

	export MAKEFLAGS="-j$(sysctl -n hw.ncpu)"

	# airport binary
	export PATH=${PATH}:/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources
	export PATH=/usr/local/bin:/usr/local/sbin:${PATH}

else

	export MAKEFLAGS="-j$(nproc)"

fi

export HISTCONTROL=ignoreboth

export LANG='en_GB.UTF-8'
export EDITOR='vim'
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 fdm=indent nomod nolist nonu noma nofoldenable' -\""

export XDG_CONFIG_HOME=~/.config
export XDG_CACHE_HOME=~/.cache
export XDG_DATA_HOME=~/.local/share

export ANSIBLE_NOCOWS=1

export PATH="${PATH}:${HOME}/tools"

export PS1='\u@\h \W\\$ '

# load functions, a la fish
for func in ~/.config/bash/functions/*; do
	source ${func}
done

if [[ -f ~/.config/bash/local.bash ]]; then
	source ~/.config/bash/local.bash
fi
