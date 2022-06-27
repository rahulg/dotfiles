function lipsum --description 'Lorem Ipsum for the times when you need slackfill'
	curl -fsSL https://loripsum.net/api/1/short | sed -r 's#</?[^>]*>##g'
end

