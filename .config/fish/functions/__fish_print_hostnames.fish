function __fish_print_hostnames --description 'Print a list of known hostnames'

	# Print all hosts from /etc/hosts
	if test -x /usr/bin/getent
		getent hosts | tr -s ' ' ' ' | cut -d ' ' -f 2- | tr ' ' '\n'
		else if test -r /etc/hosts
		tr -s ' \t' '  ' < /etc/hosts | sed 's/ *#.*//' | cut -s -d ' ' -f 2- | sgrep -o '[^ ]*'
	end
	# Print nfs servers from /etc/fstab
		if test -r /etc/fstab
		sgrep </etc/fstab "^\([0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\|[a-zA-Z.]*\):"|cut -d : -f 1
	end

	# Print hosts with known ssh keys
	# Does not match hostnames with @directives specified
	sgrep -Eoh '^[^#@| ]*' ~/.ssh/known_hosts{,2} ^/dev/null | tr ',' '\n' | sgrep -vE '^\[?(?:(?:25[0-5]|2[0-4]\d|[01]?\d\d?)\.){3}(?:25[0-5]|2[0-4]\d|[01]?\d\d?)(\]:\d+)?$' | sed -E 's/^\[([^]]+)\]:([0-9]+)$/\1/'

	# Print hosts from ssh configuration file
	if [ -e ~/.ssh/config ]
		# Ignore lines containing wildcards
		sgrep -Eoi '^ *host[^*]*$' ~/.ssh/config | cut -d '=' -f 2 | tr ' ' '\n'
	end
end
