# Shut up, fish.
set -x fish_greeting ''

# Env
set -x LANG 'en_GB.UTF-8'
set -x LC_ALL 'en_GB.UTF-8'
set -x EDITOR 'vim'

if set -q Apple_PubSub_Socket_Render

	# bind \cleft and \cright
	bind \e\[5D prevd-or-backward-word
	bind \e\[5C nextd-or-forward-word

end

if [ (uname -s) = 'Darwin' ]

	set -x GOHOSTOS 'darwin'
	set -x GOOS 'darwin'

	set -x MAKEFLAGS '-j'(sysctl -n hw.ncpu)

	# Path.Airport
	set -x PATH $PATH /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources

else

	if [ $COLORTERM = 'gnome-terminal' -o $COLORTERM = 'xfce4-terminal' ]
		set -x TERM 'xterm-256color'
	end

	set -x GOHOSTOS 'linux'
	set -x GOOS 'linux'
	
	set -x MAKEFLAGS '-j'(nproc)

	# Clipboard helpers
	functions -c __pbcopy_x11 pbcopy
	functions -c __pbpaste_x11 pbpaste

end

set -x GOHOSTARCH 'amd64'
set -x GOARCH 'amd64'
set -x GOARM '7'

set -x ANSIBLE_COW_SELECTION random

# Path.usr-local
set -x PATH /usr/local/bin /usr/local/sbin $PATH
# Path.Scripts
set -x PATH $PATH $HOME/tools

# cd path
set -x CDPATH . ~

# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showupstream 'auto'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_color_branch yellow
# Status Chars
set __fish_git_prompt_char_dirtystate 'd' 
set __fish_git_prompt_char_stagedstate 's' 
set __fish_git_prompt_char_upstream_ahead '+' 
set __fish_git_prompt_char_upstream_behind '-' 
set __fish_git_prompt_char_upstream_equal '.'
set __fish_git_prompt_char_upstream_diverged 'X'

