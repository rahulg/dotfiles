setlocal expandtab
" ale settings
let g:ale_rust_cargo_use_check = 1

" ale+cargo effectively runs cargo check, so we can only run on save
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 1
" use quickfix instead of location list since errors span across files
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1
