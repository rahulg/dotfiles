sw() {
	arg=$(echo ${@} | sgrep -o '[0-9a-zA-Z]' | tr 'A-Z' 'a-z' | tr -d '\n')
	num=$(echo ${arg} | sgrep -oE '^[0-9]+')
	blk=$(echo ${arg} | sed -E 's|^[0-9]+([^0-9]+).*$|\1|')
	command tmux -f ~/config/tmux/sw.conf new-session -s "sw$num-pat$blk" "ssh sw$num.pat$blk.ofs.edu.sg"
}
