function sw --description 'Connects to an OFS switch'
	set -l arg (echo $argv | grep -o '[0-9a-zA-Z]' | tr 'A-Z' 'a-z' | tr -d '\n')
	set -lx num (echo $argv | grep -oE '^[0-9]+')
	set -lx blk (echo $argv | sed -E 's|^[0-9]+([^0-9]+).*$|\1|')
	tmux -f ~/.sw.tmux.conf new-session -s "sw$num-pat$blk" "switch-ssh sw$num.pat$blk.ofs.edu.sg"
end
