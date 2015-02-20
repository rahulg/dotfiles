# ignore duplicates in bash history
export HISTCONTROL=ignoreboth

# env
export LANG='en_GB.UTF-8'
export EDITOR='vim'

if [[ $(uname -s) = 'Darwin' ]]; then

	export MAKEFLAGS="-j$(sysctl -n hw.ncpu)"

	# path::airport
	export PATH=$PATH:/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources
	# path::/usr/local
	export PATH=/usr/local/bin:/usr/local/sbin:$PATH

else

	if [[ ! -n ${TMUX+1} ]]; then
		if [[ ($COLORTERM = 'gnome-terminal') || ($COLORTERM = 'xfce4-terminal') ]]; then
			export TERM='xterm-256color'
		fi
	fi

	export MAKEFLAGS="-j$(nproc)"

	alias pbcopy='xsel -ibk'
	alias pbpaste='xsel -ob'

fi

export ANSIBLE_NOCOWS=1
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 fdm=indent nomod nolist nonu noma nofoldenable' -\""

# path::scripts
export PATH="$PATH:$HOME/tools"

# set prompt
export PS1='\u@\h \W\\$ '

# load functions, a la fish
for func in ~/.config/bash/functions/*; do
	source $func
done

if [[ -f ~/.config/bash/local.bash ]]; then
	source ~/.config/bash/local.bash
fi