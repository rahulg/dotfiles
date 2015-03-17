function venv -d 'Activates the virtualenv in the current directory, creates one if necessary.'
	if set -q argv[1]
		switch {$argv[1]}
			case 2
				set vpython python2
				set virt venv2
			case 3
				set vpython python3
				set virt venv3
			case py
				set vpython pypy
				set virt venvpy
		end
	else
		set virt (ls | grep -oE 'venv(2|3|py)' ^/dev/null | head -n1)
		if [ -z {$virt} ]
			echo 'no venv found, and no version given'
			return 1
		end
	end
	if [ ! -d {$virt} ]
		virtualenv --python={$vpython} {$virt}
	end
	source {$virt}/bin/activate.fish
end
