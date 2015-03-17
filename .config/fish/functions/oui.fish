function oui -d 'OUI lookup'
	curl "http://oui.rahul.ag/{$argv[1]}"
end
