call utils#SourceIfExists('local/pre.vim')

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


set nobackup
set noswapfile
set writebackup

set shortmess+=I

set clipboard+=unnamedplus

set lazyredraw
set cursorline

set mouse=a

set termguicolors
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
inoremap <C-Space> <Esc>

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

" bundled
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_winsize = 25

" navigation
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-unimpaired'

" utilities
let g:lightline = {
	\ 'colorscheme': 'base16',
	\ }
Plug 'itchyny/lightline.vim'
	set laststatus=2
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
	nmap <F6> :TagbarToggle<cr>
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
	autocmd FileType spec setlocal commentstring=#\ %s

" search
Plug 'jremmen/vim-ripgrep', { 'on': 'Rg' }

" lsp: lint, completion, formatting
Plug 'dense-analysis/ale'
	let g:ale_floating_preview = 1
	let g:ale_open_list = 1
	let g:ale_sign_column_always = 1
	let g:ale_sign_error = "\u2622"
	let g:ale_sign_warning = "\u26a0"
	let g:ale_fix_on_save = 1
	nmap <silent> <C-k> <Plug>(ale_next_wrap)
	nmap <silent> <C-j> <Plug>(ale_previous_wrap)
	nmap <F3> :ALEFix<cr>
	nnoremap <silent> K :ALEHover<CR>
	nnoremap <silent> gd :ALEGoToDefinition<CR>
	nnoremap <M-LeftMouse> <LeftMouse>:ALEGoToDefinition<CR>
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	let g:deoplete#enable_at_startup = 1
	inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" languages
Plug 'kballard/vim-fish'
	autocmd FileType fish compiler fish
	autocmd FileType fish setlocal textwidth=79
	autocmd FileType fish setlocal foldmethod=expr
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'chase/vim-ansible-yaml'
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'leshill/vim-json'
Plug 'othree/html5.vim'
Plug 'mutewinter/nginx.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'rust-lang/rust.vim'
	let g:rustfmt_autosave = 1
Plug 'cespare/vim-toml'
Plug 'ledger/vim-ledger'
Plug 'plasticboy/vim-markdown'
Plug 'darfink/vim-plist'
	let g:plist_json_filetype = 'json'
Plug 'Peaches491/vim-glog-syntax'
Plug 'solarnz/thrift.vim'
Plug 'inkarkat/diff-fold.vim'
Plug 'vim-python/python-syntax'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
function! ConfigureSemshiHighlights()
	hi semshiLocal           ctermfg=209 guifg=#ff875f
	hi semshiGlobal          ctermfg=215 guifg=#ffaf5f
	hi semshiImported        ctermfg=222 guifg=#ffd787 cterm=bold gui=bold
	hi semshiParameter       ctermfg=74  guifg=#5fafd7
	hi semshiParameterUnused ctermfg=117 guifg=#87d7ff cterm=underline gui=underline
	hi semshiFree            ctermfg=218 guifg=#ffafd7
	hi semshiBuiltin         ctermfg=210 guifg=#ff8787
	hi semshiAttribute       ctermfg=79  guifg=#5fd7af
	hi semshiSelf            ctermfg=249 guifg=#b2b2b2
	hi semshiUnresolved      ctermfg=228 guifg=#fffc87 cterm=underline gui=underline
	hi semshiSelected        ctermfg=231 guifg=#ffffff ctermbg=241 guibg=#626262

	hi semshiErrorSign       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d71e00
	hi semshiErrorChar       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d71e00
	sign define semshiError text=E> texthl=semshiErrorSign
endfunction

call utils#SourceIfExists('local/plug.vim')

call plug#end()

call ConfigureSemshiHighlights()
call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])
call deoplete#custom#option('sources', {'_': ['ale'] })

" }

call utils#SourceIfExists('local/post.vim')
