function vim -d 'vim wrapper'
	set cmd command
	which reattach-to-user-namespace >/dev/null ^/dev/null
	if [ {$status} -eq 0 ]
		set cmd reattach-to-user-namespace
	end
	eval {$cmd} vim {$argv}
end
