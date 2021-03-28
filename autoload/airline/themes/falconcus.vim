" ============================================================
" falconcus
"
" URL:https://github.com/fenetikm/falconcus
" Author: Michael Welford
" License: MIT
" Last Change: 2021/01/07 07:12
" ============================================================

let g:airline#themes#falconcus#palette = {}

let s:normal1 = [ "#000004", "#B4B4B9", 0, 249 ]
let s:normal2 = [ "#B4B4B9", "#36363A", 249, 237 ]
let s:normal3 = [ "#787882", "#28282D", 243, 235 ]
let g:airline#themes#falconcus#palette.normal = airline#themes#generate_color_map(s:normal1, s:normal2, s:normal3)

let s:insert1 = [ "#000004", "#FF3600", 0, 202 ]
let s:insert2 = [ "#B4B4B9", "#36363A", 249, 237 ]
let s:insert3 = [ "#B4B4B9", "#28282D", 249, 235 ]
let g:airline#themes#falconcus#palette.insert = airline#themes#generate_color_map(s:insert1, s:insert2, s:insert3)

let s:replace1 = [ "#000004", "#FF761A", 0, 208 ]
let s:replace2 = [ "#B4B4B9", "#36363A", 249, 237 ]
let s:replace3 = [ "#B4B4B9", "#28282D", 249, 235 ]
let g:airline#themes#falconcus#palette.replace = airline#themes#generate_color_map(s:replace1, s:replace2, s:replace3)

let s:visual1 = [ "#000004", "#FFC552", 0, 221 ]
let s:visual2 = [ "#B4B4B9", "#36363A", 249, 237 ]
let s:visual3 = [ "#B4B4B9", "#28282D", 249, 235 ]
let g:airline#themes#falconcus#palette.visual = airline#themes#generate_color_map(s:visual1, s:visual2, s:visual3)

let s:inactive1 = [ "#b4b4b9", "#4f4f59", 255, 240 ]
let s:inactive2 = [ "#b4b4b9", "#2f2f3a", 255, 240 ]
let s:inactive3 = [ "#f8f8ff", "#2f2f3a", 255, 240 ]
let g:airline#themes#falconcus#palette.inactive = airline#themes#generate_color_map(s:inactive1, s:inactive2, s:inactive3)

if !get(g:, 'loaded_ctrlp', 0)
  finish
endif

let s:CP1 = [ "#787882", "#36363A", 243, 237 ]
let s:CP2 = [ "#787882", "#36363A", 243, 237 ]
let s:CP3 = [ "#787882", "#36363A", 243, 237 ]

let g:airline#themes#falconcus#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(s:CP1, s:CP2, s:CP3)
