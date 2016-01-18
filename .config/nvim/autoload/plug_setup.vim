" vim: foldmethod=marker foldlevel=0

function! plug_setup#BuildYouCompleteMe(info)
	!python2 ./install.py --clang-completer --system-libclang --gocode-completer --system-boost
endfunction

function! plug_setup#BuildVimGo(info)
	call plug#load('vim-go')
	GoUpdateBinaries
endfunction
