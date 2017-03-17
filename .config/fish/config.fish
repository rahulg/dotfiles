set -x XDG_CONFIG_HOME "$HOME/.config"
set -x XDG_CACHE_HOME "$HOME/.cache"
set -x XDG_DATA_HOME "$HOME/.local/share"

set -x LANG 'en_GB.UTF-8'
set -x EDITOR 'nvim'
set -x MANPAGER '/bin/sh -c "col -b | nvim -c \'set ft=man ts=8 fdm=indent nomod nolist nonu noma nofoldenable nohlsearch\' -"'

set -x PATH '/usr/local/sbin' '/usr/local/bin' '/usr/sbin' '/usr/bin' '/sbin' '/bin' "$HOME/.cargo/bin" "$HOME/tools"

set -x GOPATH "$HOME/scratch/go"
set -x GOBIN "$HOME/scratch/go/bin/"(eval $HOME/tools/go-arch)

set -x HOMEBREW_NO_ANALYTICS 1
set -x HOMEBREW_NO_AUTO_UPDATE 1
set -x HOMEBREW_NO_EMOJI 1

abbr digs 'dig +short'

if begin set -q TMUX; and test $TERM = 'tmux-256color'; end
	alias ssh "env TERM=screen-256color ssh"
end

if test (uname) = Darwin
	set -x MAKEFLAGS "-j"(sysctl -n hw.ncpu)
	set -x PATH $PATH "/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources"
	set -x PATH $PATH "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources"
	bind \e\[5D prevd-or-backward-word
	bind \e\[5C nextd-or-forward-word
else if test (uname) = Linux
	set -x MAKEFLAGS "-j"(nproc --all)
end

set fish_greeting ""
set fish_color_normal "normal"
set fish_color_command "7cafc2"
set fish_color_quote "f7ca88"
set fish_color_redirection "normal"
set fish_color_end "7cafc2"
set fish_color_error "ab4642"
set fish_color_param "ba8baf"
set fish_color_comment "b8b8b8"
set fish_color_match "7cafc2"
set fish_color_search_match "--background=383838"
set fish_color_operator "7cafc2"
set fish_color_escape "a1b56c"
set fish_color_cwd "a1b56c"
set fish_color_cwd_root "ab4642"
set fish_color_autosuggestion "585858"
set fish_color_valid_path "--underline"
set fish_pager_color_prefix "86c1b9"
set fish_pager_color_completion "normal"
set fish_pager_color_description "b8b8b8"
set fish_pager_color_progress "86c1b9"

set __fish_git_prompt_showdirtystate "yes"
set __fish_git_prompt_showstashstate "yes"
set __fish_git_prompt_showupstream "auto"
set __fish_git_prompt_showuntrackedfiles "yes"
set __fish_git_prompt_color_branch "yellow"
set __fish_git_prompt_char_dirtystate "d"
set __fish_git_prompt_char_stagedstate "s"
set __fish_git_prompt_char_upstream_ahead "+"
set __fish_git_prompt_char_upstream_behind "-"
set __fish_git_prompt_char_upstream_equal "."
set __fish_git_prompt_char_upstream_diverged "X"

if begin test (uname) = Linux; and set -q XDG_SESSION_TYPE; and test $XDG_SESSION_TYPE = wayland; end
	set FISH_CLIPBOARD_CMD wayclip
end

# colour scheme
if test -t 1
	python ~/tools/ccc-base16.py
end

if test -f "$HOME/.config/fish/local.fish"
	source "$HOME/.config/fish/local.fish"
end
