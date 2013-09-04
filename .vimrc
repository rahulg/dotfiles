set number
set nowrap
set showmatch

set hlsearch
set smartcase
set ignorecase
set incsearch

set autoindent
set cindent
set noexpandtab
set shiftwidth=4
set smartindent
set smarttab
set tabstop=4
set softtabstop=4

set autochdir
set autowriteall

syntax enable

set undolevels=1000
set backspace=indent,eol,start

set ttyfast
set lazyredraw

set nobackup
set nowb
set noswapfile

set clipboard=unnamed

if has("mouse")
	set mouse=a
endif

autocmd Filetype python setl expandtab

set nocompatible
filetype off

set shell=/bin/bash

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
" the_silver_searcher
Bundle 'rking/ag.vim'
" JS
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'leshill/vim-json'
" HTML
Bundle 'othree/html5.vim'
Bundle 'indenthtml.vim'
" Obj-C
Bundle 'msanders/cocoa.vim'
" Nginx
Bundle 'mutewinter/nginx.vim'
" Floobits
Bundle 'Floobits/floobits-vim'
filetype plugin indent on
