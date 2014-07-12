function vim --description 'vim wrapper'
	set rtus reattach-to-user-namespace
	if [ ! -x "(which $rtus)" ]
		set rtus command
	end
	eval $rtus vim $argv
end
