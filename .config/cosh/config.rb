var XDG_CONFIG_HOME, "#{env.HOME}/.config"
var XDG_CACHE_HOME, "#{env.HOME}/.cache"
var XDG_DATA_HOME, "#{env.HOME}/.local/share"

var LANG, 'en_GB.UTF-8'
var EDITOR, 'vim'
var MANPAGER, dq('/bin/sh -c "col -b | vim -c \'set ft=man ts=8 fdm=indent nomod nolist nonu noma nofoldenable nohlsearch\' -"')

var GOPATH, "#{env.HOME}/scratch/go"

prefix PATH, "#{env.HOME}/tools", '/usr/local/bin', '/usr/local/sbin'

if Platform.darwin?
  ncpu = run 'sysctl -n hw.ncpu'
  suffix PATH, '/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources'
elsif Platform.linux?
  ncpu = run 'nproc'
end

var MAKEFLAGS, "-j#{ncpu}"

abbr digs, 'dig +short'

if shell == :fish
  if env.to_h.key? 'Apple_PubSub_Socket_Render'
    puts 'bind \e\[5D prevd-or-backward-word'
    puts 'bind \e\[5C nextd-or-forward-word'
  end

  lvar fish_greeting, ''

  lvar __fish_git_prompt_showdirtystate, 'yes'
  lvar __fish_git_prompt_showstashstate, 'yes'
  lvar __fish_git_prompt_showupstream, 'auto'
  lvar __fish_git_prompt_showuntrackedfiles, 'yes'
  lvar __fish_git_prompt_color_branch, 'yellow'

  lvar __fish_git_prompt_char_dirtystate, 'd'
  lvar __fish_git_prompt_char_stagedstate, 's'
  lvar __fish_git_prompt_char_upstream_ahead, '+'
  lvar __fish_git_prompt_char_upstream_behind, '-'
  lvar __fish_git_prompt_char_upstream_equal, '.'
  lvar __fish_git_prompt_char_upstream_diverged, 'X'

  source "#{Dir.home}/.config/fish/local.fish"
elsif shell == :posix
  var HISTCONTROL, 'ignoreboth'
  var HISTFILE, "#{env.XDG_DATA_HOME}/bash/history"

  var PS1, '\u@\h \W\\$ '

  Dir["#{Dir.home}/.config/bash/functions/*.bash"].each do |func|
    source func
  end

  source "#{Dir.home}/.config/bash/local.bash"
end
