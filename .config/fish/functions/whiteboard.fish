function whiteboard --description 'Clean up whiteboard photos'
	if not set -q argv
		return 1
	end
	set -lx input $argv[1]
	set -lx output $argv[2]
	convert $input -morphology Convolve DoG:15,100,0 -negate -normalize -blur 0x1 -channel RBG -level 60%,91%,0.1 $output
end
