function venv -d 'Activates the virtualenv in the current directory, creates one if necessary.'
	if [ ! -d venv ]
		rm -f venv
		virtualenv --python=python2.7 venv
	end
	. venv/bin/activate.fish
end
