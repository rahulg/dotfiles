function ssh --description 'Wraps ssh to replace environment variables'
	if begin set -q TMUX; and test "$TERM" = 'tmux-256color'; end
		set -x TERM screen-256color
	end
	command ssh $argv
end
