function tmux -d 'tmux config selection wrapper'
	set tmconf tmux.conf
	if [ (uname -s) = 'Darwin' ]
		set tmconf osx.conf
	else if [ (uname -s) = 'Linux' ] 
		if set -q DISPLAY
			set tmconf x11.conf
		end
	end
	command tmux -f ~/.config/tmux/{$tmconf} {$argv}
end
