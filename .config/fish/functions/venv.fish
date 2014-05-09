function venv -d 'Activates the virtualenv in the current directory, creates one if necessary.'

	if set -q argv[1]
		switch $argv[1]
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
		set vpython python2
		set virt venv2
	end

	if test ! -d {$virt}
		virtualenv --python={$vpython} {$virt}
	else
		source {$virt}/bin/activate.fish
	end

end
