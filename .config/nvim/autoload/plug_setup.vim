" vim: foldmethod=marker foldlevel=0

function! plug_setup#BuildYouCompleteMe(info)
	!python2 ./install.py --clang-completer --gocode-completer --racer-completer
endfunction

function! plug_setup#BuildVimGo(info)
	call plug#load('vim-go')
	GoUpdateBinaries
endfunction
