# Terminal.app
if set -q Apple_PubSub_Socket_Render
	bind \e\[5D prevd-or-backward-word
	bind \e\[5C nextd-or-forward-word
end

if [ (uname -s) = 'Darwin' ]

	set -x MAKEFLAGS '-j'(sysctl -n hw.ncpu)

	# airport binary
	set -x PATH $PATH /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources
	set -x PATH /usr/local/bin /usr/local/sbin $PATH

else

	set -x MAKEFLAGS '-j'(nproc)

end

set -x fish_greeting ''

set -x LANG 'en_GB.UTF-8'
set -x EDITOR 'vim'
set -x MANPAGER "/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 fdm=indent nomod nolist nonu noma nofoldenable nohlsearch' -\""

set -x XDG_CONFIG_HOME ~/.config
set -x XDG_CACHE_HOME ~/.cache
set -x XDG_DATA_HOME ~/.local/share

set -x ANSIBLE_NOCOWS 1

set -x PATH $PATH $HOME/tools

set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showupstream 'auto'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_color_branch yellow

set __fish_git_prompt_char_dirtystate 'd' 
set __fish_git_prompt_char_stagedstate 's' 
set __fish_git_prompt_char_upstream_ahead '+' 
set __fish_git_prompt_char_upstream_behind '-' 
set __fish_git_prompt_char_upstream_equal '.'
set __fish_git_prompt_char_upstream_diverged 'X'

if [ -f ~/.config/fish/local.fish ]
	source ~/.config/fish/local.fish
end
