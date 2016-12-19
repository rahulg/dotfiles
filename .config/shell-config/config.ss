(load "shell.ss")

(var 'XDG_CONFIG_HOME "$HOME/.config")
(var 'XDG_CACHE_HOME "$HOME/.cache")
(var 'XDG_DATA_HOME "$HOME/.local/share")

(var 'LANG "en_GB.UTF-8")
(var 'EDITOR "nvim")
(var 'MANPAGER (dquote "/bin/sh -c \\\"col -b | nvim -c 'set ft=man ts=8 fdm=indent nomod nolist nonu noma nofoldenable nohlsearch' -\\\""))

(array-var 'PATH
           "$HOME/tools"
           "/usr/local/sbin"
           "/usr/local/bin"
           "/usr/sbin"
           "/usr/bin")

(var 'GOPATH "$HOME/scratch/go")

(var 'MAKEFLAGS (string-append "-j" (number->string (total-processor-count))))

(var 'HOMEBREW_NO_ANALYTICS "1")
(var 'HOMEBREW_NO_AUTO_UPDATE "1")
(var 'HOMEBREW_NO_EMOJI "1")

(abbr 'digs "dig +short")

(alias 'weechat "weechat -d $XDG_CONFIG_HOME/weechat")

(if (and (getenv "TMUX") (string=? (getenv "TERM") "tmux-256color"))
    (alias 'ssh "env TERM=screen-256color ssh"))

(cond
  [(eq? os 'darwin)
   (suffix 'PATH "/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources")
   (suffix 'PATH "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources")])

(cond

  [(eq? shell 'posix)
   (var 'HISTCONTROL "ignoreboth")
   (var 'HISTFILE "$XDG_DATA_HOME/bash/history")
   (var 'PS1 "\\u@\\h \\W\\$ ")
   (for-file-in-tree (string-append (env 'HOME) "/.config/bash/functions") (lambda (name stat)
                                                                             (source name)))
   (source-if-exists (string-append (env 'HOME) "/.config/bash/local.bash"))
   (print "guile ~/tools/ccc-base16.ss 2>/dev/null")]

  [(eq? shell 'fish)
   (cond
     [(getenv "Apple_PubSub_Socket_Render")
      (print "bind \\e\\[5D prevd-or-backward-word")
      (print "bind \\e\\[5C nextd-or-forward-word")])
   (source-if-exists (string-append (env 'HOME) "/.config/fish/local.fish"))
   (varl 'fish_color_normal "normal")
   (varl 'fish_color_command "7cafc2")
   (varl 'fish_color_quote "f7ca88")
   (varl 'fish_color_redirection "normal")
   (varl 'fish_color_end "7cafc2")
   (varl 'fish_color_error "ab4642")
   (varl 'fish_color_param "ba8baf")
   (varl 'fish_color_comment "b8b8b8")
   (varl 'fish_color_match "7cafc2")
   (varl 'fish_color_search_match "--background=383838")
   (varl 'fish_color_operator "7cafc2")
   (varl 'fish_color_escape "a1b56c")
   (varl 'fish_color_cwd "a1b56c")
   (varl 'fish_color_cwd_root "ab4642")
   (varl 'fish_color_autosuggestion "585858")
   (varl 'fish_color_valid_path "--underline")
   (varl 'fish_pager_color_prefix "86c1b9")
   (varl 'fish_pager_color_completion "normal")
   (varl 'fish_pager_color_description "b8b8b8")
   (varl 'fish_pager_color_progress "86c1b9")
   (varl '__fish_git_prompt_showdirtystate "yes")
   (varl '__fish_git_prompt_showstashstate "yes")
   (varl '__fish_git_prompt_showupstream "auto")
   (varl '__fish_git_prompt_showuntrackedfiles "yes")
   (varl '__fish_git_prompt_color_branch "yellow")
   (varl '__fish_git_prompt_char_dirtystate "d")
   (varl '__fish_git_prompt_char_stagedstate "s")
   (varl '__fish_git_prompt_char_upstream_ahead "+")
   (varl '__fish_git_prompt_char_upstream_behind "-")
   (varl '__fish_git_prompt_char_upstream_equal ".")
   (varl '__fish_git_prompt_char_upstream_diverged "X")
   (varl 'fish_greeting "")
   (if (and (eq? os 'linux) (getenv "XDG_SESSION_TYPE") (string=? (getenv "XDG_SESSION_TYPE") "wayland"))
       (varl 'FISH_CLIPBOARD_CMD "cat"))
   (print "guile ~/tools/ccc-base16.ss ^/dev/null")])
