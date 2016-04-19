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
