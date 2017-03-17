function! os_dep#system_python()
	if filereadable('/usr/local/bin/python3')
		return '/usr/local/bin/python3'
	elseif filereadable('/usr/bin/python3')
		return '/usr/bin/python3'
	elseif filereadable('/usr/local/bin/python2')
		return '/usr/local/bin/python2'
	elseif filereadable('/usr/bin/python2')
		return '/usr/bin/python2'
	else
		echoerr 'cannot find python'
	endif
endfunction
