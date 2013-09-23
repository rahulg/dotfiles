function venv3 -d 'Activates the python3 virtualenv in the current directory, creates one if necessary.'
	if [ ! -d venv3 ]
		rm -f venv3
		virtualenv --python=python3.3 venv3
	end
	. venv3/bin/activate.fish
end
