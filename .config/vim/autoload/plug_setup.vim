" vim: foldmethod=marker foldlevel=0

function! plug_setup#BuildYouCompleteMe(info)
	if a:info.status == 'installed' || a:info.force
		!./install.sh --clang-completer --gocode-completer
	endif
endfunction

function! plug_setup#BuildVimGo(info)
	if a:info.status == 'installed' || a:info.force
		call plug#load('vim-go')
		GoUpdateBinaries
	endif
endfunction
