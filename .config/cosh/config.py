env.XDG_CONFIG_HOME = dq(var('HOME') + '/.config')
env.XDG_CACHE_HOME = dq(var('HOME') + '/.cache')
env.XDG_DATA_HOME = dq(var('HOME') + '/.local/share')

env.LANG = 'en_GB.UTF-8'
env.EDITOR = 'vim'
env.MANPAGER = dq('/bin/sh -c "col -b | vim -c \'set ft=man ts=8 fdm=indent nomod nolist nonu noma nofoldenable nohlsearch\' -"')

env.ANSIBLE_NOCOWS = 1

env.GOPATH = dq(var('HOME') + '/scratch/go')

env.VIMINIT = 'let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'

if platform == 'darwin':
    ncpu = run('sysctl', '-n', 'hw.ncpu')
    env.MAKEFLAGS = '-j' + ncpu

    env.path_s('/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources')
    env.path_p('/usr/local/bin', '/usr/local/sbin')
else:
    ncpu = run('nproc')
    env.MAKEFLAGS = '-j' + ncpu

env.path_p('/usr/local/sbin')
env.path_p('/usr/local/bin')
env.path_p(var('HOME') + '/tools')

env.digs = Abbr('dig +short')

if shell is Fish:

    if 'Apple_PubSub_Socket_Render' in env:
        verbatim('bind \e\[5D prevd-or-backward-word')
        verbatim('bind \e\[5C nextd-or-forward-word')

    env.fish_greeting = LVar('')

    env.__fish_git_prompt_showdirtystate = LVar('yes')
    env.__fish_git_prompt_showstashstate = LVar('yes')
    env.__fish_git_prompt_showupstream = LVar('auto')
    env.__fish_git_prompt_showuntrackedfiles = LVar('yes')
    env.__fish_git_prompt_color_branch = LVar('yellow')

    env.__fish_git_prompt_char_dirtystate = LVar('d')
    env.__fish_git_prompt_char_stagedstate = LVar('s')
    env.__fish_git_prompt_char_upstream_ahead = LVar('+')
    env.__fish_git_prompt_char_upstream_behind = LVar('-')
    env.__fish_git_prompt_char_upstream_equal = LVar('.')
    env.__fish_git_prompt_char_upstream_diverged = LVar('X')

    verbatim('''
    if [ -f ~/.config/fish/local.fish ]
            source ~/.config/fish/local.fish
    end
    ''')

if shell is Posix:

    env.HISTCONTROL = 'ignoreboth'
    env.HISTFILE = dq(var('XDG_DATA_HOME') + '/bash/history')

    env.PS1 = r'\u@\h \W\\$ '

    verbatim('''
    for func in ~/.config/bash/functions/*; do
            source ${func}
    done

    if [[ -f ~/.config/bash/local.bash ]]; then
            source ~/.config/bash/local.bash
    fi
    ''')
