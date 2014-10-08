function sw -d 'Connects to an OFS switch'
	set -l arg (echo $argv | sgrep -o '[0-9a-zA-Z]' | tr 'A-Z' 'a-z' | tr -d '\n')
	set -lx num (echo $arg | sgrep -oE '^[0-9]+')
	set -lx blk (echo $arg | sed -E 's|^[0-9]+([^0-9]+).*$|\1|')
	command tmux -f ~/config/tmux/sw.conf new-session -s "sw{$num}.pat{$blk}" "ssh sw{$num}.pat{$blk}.ofs.edu.sg"
end
