" =============================================================================
" Filename: autoload/lightline/colorscheme/powerline.vim
" Author: itchyny
" License: MIT License
" Last Change: 2013/09/07 15:54:41.
" =============================================================================
let s:base00 = [ '#181818', 0 ]
let s:base01 = [ '#282828', 18 ]
let s:base02 = [ '#383838', 19 ]
let s:base03 = [ '#505050', 8 ]
let s:base04 = [ '#b8b8b8', 20 ]
let s:base05 = [ '#d8d8d8', 7 ]
let s:base06 = [ '#e8e8e8', 21 ]
let s:base07 = [ '#f8f8f8', 15 ]
let s:base08 = [ '#ab4642', 1 ]
let s:base09 = [ '#dc9656', 16 ]
let s:base0A = [ '#f7ca88', 3 ]
let s:base0B = [ '#a1b56c', 2 ]
let s:base0C = [ '#86c1b9', 6 ]
let s:base0D = [ '#7cafc2', 4 ]
let s:base0E = [ '#ba8baf', 5 ]
let s:base0F = [ '#a16946', 17 ]

let s:white = copy(s:base07)
let s:black = copy(s:base00)

if &background ==# 'light'
	let s:white = copy(s:base06)
	let [s:base00, s:base07] = [s:base07, s:base00]
	let [s:base01, s:base06] = [s:base06, s:base01]
	let [s:base02, s:base05] = [s:base05, s:base02]
	let [s:base03, s:base04] = [s:base04, s:base03]
endif

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:base00 , s:base0D, 'bold' ], [ s:base07, s:base02 ] ]
let s:p.normal.right = [ [ s:base07 , s:base03 ], [ s:base07, s:base02 ], [ s:base07 , s:base01 ] ]
let s:p.normal.middle = [ [ s:base07, s:base01 ] ]
let s:p.inactive.right = [ [ s:base04, s:base03 ], [ s:base04, s:base02 ], [ s:base04, s:base01 ] ]
let s:p.inactive.left = s:p.inactive.right[1:]
let s:p.insert.left = [ [ s:base09, s:white, 'bold' ], [ s:black, s:base0A ] ]
let s:p.insert.middle = [ [ s:base07, s:base09 ] ]
let s:p.insert.right = [ [ s:base09 , s:white ], [ s:black, s:base0A ], [ s:base07 , s:base09 ] ]
let s:p.replace.left = [ [ s:base00, s:base08, 'bold' ], [ s:base07, s:base02 ] ]
let s:p.replace.middle = copy(s:p.normal.middle)
let s:p.replace.right = copy(s:p.normal.right)
let s:p.visual.left = [ [ s:base00, s:base09, 'bold' ], [ s:base07, s:base02 ] ]
let s:p.tabline.left = [ [ s:base07, s:base02 ] ]
let s:p.tabline.tabsel = [ [ s:base00, s:base04 ] ]
let s:p.tabline.middle = [ [ s:base07, s:base01 ] ]
let s:p.tabline.right = [ [ s:base07, s:base03 ] ]
let s:p.normal.error = [ [ s:base04, s:base08 ] ]
let s:p.normal.warning = [ [ s:base00, s:base0A ] ]

let g:lightline#colorscheme#base16#palette = lightline#colorscheme#flatten(s:p)
