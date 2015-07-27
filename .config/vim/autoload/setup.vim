" vim: foldmethod=marker foldlevel=0

function! setup#BuildYouCompleteMe(info)
	if a:info.status == 'installed' || a:info.force
		!./install.sh --clang-completer --gocode-completer
	endif
endfunction

function! setup#BuildVimGo(info)
	if a:info.status == 'installed' || a:info.force
		call plug#load('vim-go')
		GoUpdateBinaries
	endif
endfunction
