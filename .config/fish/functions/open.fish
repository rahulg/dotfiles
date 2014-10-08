function open -d 'Open file'
	set rtus reattach-to-user-namespace
	if [ ! -x "(which $rtus)" ]
		set rtus command
	end
	if [ (uname -s) = 'Darwin' ]
		set open open
	else
		set open xdg-open
	end
	eval $rtus $open $argv
end
