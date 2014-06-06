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

map <c-n> :tabn<CR>
map <c-t> :Te<CR>
map <c-f> :Ex<CR>

set clipboard=unnamed

set laststatus=2

if has("mouse")
	set mouse=a
endif

autocmd Filetype python setl expandtab
autocmd Filetype yaml setl expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd BufRead,BufNewFile *.md set filetype=markdown

set nocompatible
filetype off

set shell=/bin/bash

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
" fish-shell
Bundle 'dag/vim-fish'
autocmd FileType fish compiler fish
autocmd FileType fish setlocal textwidth=79
autocmd FileType fish setlocal foldmethod=expr
" the_silver_searcher
Bundle 'rking/ag.vim'
" Ansible-YAML
Bundle 'chase/vim-ansible-yaml'
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
" status line
Bundle 'itchyny/lightline.vim'
" readline
Bundle 'tpope/vim-rsi'
filetype plugin indent on
