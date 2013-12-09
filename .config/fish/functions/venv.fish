function venv -d 'Activates the virtualenv in the current directory, creates one if necessary.'

	if set -q argv[1]
		switch $argv[1]
			case 27
				set vpython python2.7
				set virt venv27
			case 33
				set vpython python3.3
				set virt venv33
			case py
				set vpython pypy
				set virt venvpy
		end
	else
		set vpython python2.7
		set virt venv27
	end

	if test ! -d {$virt}
		virtualenv --python={$vpython} {$virt}
	else
		source {$virt}/bin/activate.fish
	end

end
