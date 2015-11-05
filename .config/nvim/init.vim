" vim: foldmethod=marker foldmarker={,} foldlevel=0

" options {

syntax enable

set noshowmode
set modeline

set number
set nowrap
set showmatch

set ignorecase
set smartcase

set noexpandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

set autowrite
set autochdir

set lazyredraw

set nobackup
set noswapfile
set writebackup

set shortmess+=I

set clipboard+=unnamedplus

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

set background=dark
let base16colorspace=256
colorscheme base16-default

" }

" bindings {

nnoremap <c-t> :tabnew<cr>
nnoremap <c-left> :tabprev<cr>
nnoremap <c-right> :tabnext<cr>
nnoremap <F1> <nop>
inoremap <F1> <nop>
nnoremap Q <nop>

nmap <F2> :call nonprint#toggle()<cr>

" }

" plugins {

" automatically install plug.vim
if empty(glob('$XDG_DATA_HOME/nvim/site/autoload/plug.vim'))
	silent !curl -fLo $XDG_DATA_HOME/nvim/site/autoload/plug.vim --create-dirs
	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin('$XDG_DATA_HOME/nvim/site/bundle')
let g:plug_timeout=120
let g:plug_window='tabnew'

" navigation
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-unimpaired'

" utilities
let g:lightline = {
	\ 'colorscheme': 'base16',
	\ }
Plug 'itchyny/lightline.vim'
	set laststatus=2
Plug 'rking/ag.vim', { 'on': 'Ag' }
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
	nmap <F6> :TagbarToggle<cr>
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'

" language support, auto-formatting, linting, etc.
Plug 'Valloric/YouCompleteMe', { 'do': function('plug_setup#BuildYouCompleteMe') }
Plug 'kballard/vim-fish'
	autocmd FileType fish compiler fish
	autocmd FileType fish setlocal textwidth=79
	autocmd FileType fish setlocal foldmethod=expr
Plug 'fatih/vim-go', { 'do': function('plug_setup#BuildVimGo') }
Plug 'chase/vim-ansible-yaml'
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'leshill/vim-json'
Plug 'othree/html5.vim'
Plug 'indenthtml.vim'
Plug 'mutewinter/nginx.vim'
Plug 'rhysd/vim-clang-format'
	let g:clang_format#code_style = 'file'
	let g:clang_format#detect_style_file = 1
	let g:clang_format#auto_format = 1
	let g:clang_format#auto_format_on_insert_leave = 1
	let g:clang_format#auto_formatexpr = 1
Plug 'nvie/vim-flake8'
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'ledger/vim-ledger'

call plug#end()
filetype plugin indent on

" }
