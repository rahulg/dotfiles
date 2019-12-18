function! utils#SourceIfExists(path)
	let vimrcdir = fnamemodify($MYVIMRC, ':p:h')
	let fullpath = vimrcdir . '/' . a:path
	if filereadable(fullpath)
		exe 'source' fullpath
	endif
endfunction
