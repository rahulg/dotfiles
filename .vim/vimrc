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

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
" fish-shell
Plugin 'dag/vim-fish'
autocmd FileType fish compiler fish
autocmd FileType fish setlocal textwidth=79
autocmd FileType fish setlocal foldmethod=expr
" the_silver_searcher
Plugin 'rking/ag.vim'
" ansible-yaml
Plugin 'chase/vim-ansible-yaml'
" js
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'leshill/vim-json'
" html
Plugin 'othree/html5.vim'
Plugin 'indenthtml.vim'
" obj-c
Plugin 'msanders/cocoa.vim'
" nginx
Plugin 'mutewinter/nginx.vim'
" status line
Plugin 'itchyny/lightline.vim'
" readline
Plugin 'tpope/vim-rsi'
" ctrl-p
Plugin 'kien/ctrlp.vim'
" golang
Plugin 'fatih/vim-go'
let g:go_disable_autoinstall = 1
" autocomplete
Plugin 'Valloric/YouCompleteMe'
" ctags-nav
Plugin 'majutsushi/tagbar'
" surrounding things with tokens
Plugin 'tpope/vim-surround'
call vundle#end()
filetype plugin indent on
