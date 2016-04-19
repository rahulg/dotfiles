" vim: foldmethod=marker foldlevel=0

function! plug_setup#BuildYouCompleteMe(info)
	execute '!' os_dep#system_python() './install.py --clang-completer --gocode-completer --racer-completer'
endfunction

function! plug_setup#BuildVimGo(info)
	call plug#load('vim-go')
	GoUpdateBinaries
endfunction
