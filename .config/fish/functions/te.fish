function te --description 'Edits your .plan'
	vim ~/.plan
	set -lx date (date)
	sed -i '' -e "2s/.*/$date/" ~/.plan
end
