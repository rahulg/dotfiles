setlocal expandtab
" ale settings
let g:ale_rust_cargo_use_check = 1

" use quickfix instead of location list since errors span across files
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
