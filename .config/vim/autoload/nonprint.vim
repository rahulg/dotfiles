" vim: foldmethod=marker foldlevel=0

function! nonprint#setup()
	if exists('g:nonprint#has_setup')
		return
	endif

	if !exists('g:nonprint#listchars')
		let g:nonprint#listchars='eol:¬,tab:>-,trail:.,extends:>,precedes:<,nbsp:.'
	endif
	let &listchars=g:nonprint#listchars

	highlight SpecialKey ctermfg=12

	if has('conceal')
		setlocal conceallevel=2 concealcursor=inv
		highlight Conceal ctermbg=none ctermfg=12
	endif

	let g:nonprint#has_setup = 1
endfunction

function! nonprint#enable()
	call nonprint#setup()
	if exists('g:nonprint#enabled') && g:nonprint#enabled == 1
		return
	endif

	set list
	if has('conceal')
		syntax match LeadingSpaces /\(^ *\)\@<= / conceal cchar=.
	endif

	let g:nonprint#enabled = 1
endfunction

function! nonprint#disable()
	call nonprint#setup()
	if exists('g:nonprint#enabled') && g:nonprint#enabled == 0
		return
	endif
	
	set nolist
	if has('conceal')
		syntax match LeadingSpaces /\(^ *\)\@<= /
	endif

	let g:nonprint#enabled = 0
endfunction

function! nonprint#toggle()
	if exists('g:nonprint#enabled')
		if g:nonprint#enabled == 0
			call nonprint#enable()
		else
			call nonprint#disable()
		endif
	else
		call nonprint#enable()
	endif
endfunction
