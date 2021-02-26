function mytz --description 'Sets the TZ env variable to SSH_CLIENT_TZ and executes commands'
	env TZ=$SSH_CLIENT_TZ $argv
end

