function pprint
	eval $argv | python -m json.tool
end
