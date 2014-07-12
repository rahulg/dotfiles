function vim --description 'vim wrapper'
	set -x rtus reattach-to-user-namespace
	if [ ! -x "(which $rtus)" ]
		set -x rtus command
	end
	eval $rtus vim $argv
end
