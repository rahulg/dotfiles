function sudo! --description 'Execute last command with superuser permissions'
	eval sudo $history[1]
end
