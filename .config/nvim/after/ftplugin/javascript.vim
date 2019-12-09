setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal expandtab

let b:ale_linters = ['eslint', 'flow-language-server', 'prettier']
let b:ale_fixers = ['prettier']
