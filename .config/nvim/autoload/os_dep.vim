function! os_dep#set_rust_src_path()
	if has('mac')
		let a:src_path = '/usr/local/src/rust/src'
	elseif has('unix')
		let a:src_path = '/usr/src/rust/src'
	else
		let a:src_path = ''
		echoerr 'init: bad OS'
	endif
	let g:ycm_rust_src_path = a:src_path
endfunction

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
