function open --description 'Open with fancy stuff'
	set rtus reattach-to-user-namespace
	if [ ! -x "(which $rtus)" ]
		set rtus command
	end
	if [ (uname) = "Darwin" ]
		set open open
	else
		set open xdg-open
	end
	eval $rtus $open $argv
end
