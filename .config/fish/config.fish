# shut up, fish.
set -x fish_greeting ''

# env
set -x LANG 'en_GB.UTF-8'
set -x EDITOR 'vim'

if set -q Apple_PubSub_Socket_Render

	# bind \cleft and \cright
	bind \e\[5D prevd-or-backward-word
	bind \e\[5C nextd-or-forward-word

end

if [ (uname -s) = 'Darwin' ]

	set -x MAKEFLAGS '-j'(sysctl -n hw.ncpu)

	# path::airport
	set -x PATH $PATH /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources
	# path::/usr/local
	set -x PATH /usr/local/bin /usr/local/sbin $PATH

else

	if not set -q TMUX
		if [ $COLORTERM = 'gnome-terminal' -o $COLORTERM = 'xfce4-terminal' ]
			set -x TERM 'xterm-256color'
		end
	end

	set -x MAKEFLAGS '-j'(nproc)

	# clipboard helpers
	functions -c __pbcopy_x11 pbcopy
	functions -c __pbpaste_x11 pbpaste

end

set -x ANSIBLE_NOCOWS 1

# path::scripts
set -x PATH $PATH $HOME/tools

# fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showupstream 'auto'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_color_branch yellow
# status chars
set __fish_git_prompt_char_dirtystate 'd' 
set __fish_git_prompt_char_stagedstate 's' 
set __fish_git_prompt_char_upstream_ahead '+' 
set __fish_git_prompt_char_upstream_behind '-' 
set __fish_git_prompt_char_upstream_equal '.'
set __fish_git_prompt_char_upstream_diverged 'X'

if [ -f ~/.config/fish/local.fish ]
	source ~/.config/fish/local.fish
end
