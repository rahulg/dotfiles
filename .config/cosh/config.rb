var XDG_CONFIG_HOME, "#{env.HOME}/.config"
var XDG_CACHE_HOME, "#{env.HOME}/.cache"
var XDG_DATA_HOME, "#{env.HOME}/.local/share"

var LANG, 'en_GB.UTF-8'
var EDITOR, 'vim'
var MANPAGER, dq('/bin/sh -c "col -b | vim -c \'set ft=man ts=8 fdm=indent nomod nolist nonu noma nofoldenable nohlsearch\' -"')

var GOPATH, "#{env.HOME}/scratch/go"

var VIMINIT, 'let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'

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

  puts <<-END.gsub(/^ {4}/, '')
    if [ -f ~/.config/fish/local.fish ]
      source ~/.config/fish/local.fish
    end
  END

elsif shell == :posix

  var HISTCONTROL, 'ignoreboth'
  var HISTFILE, "#{env.XDG_DATA_HOME}/bash/history"

  var PS1, '\u@\h \W\\$ '

  puts <<-END.gsub(/^ {4}/, '')
    for func in ~/.config/bash/functions/*; do
      source ${func}
    done

    if [[ -f ~/.config/bash/local.bash ]]; then
      source ~/.config/bash/local.bash
    fi
  END

end
