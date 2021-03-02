" Insert a newline after each specified string (or before if use '!').
" If no arguments, use previous search.
" :LineBreakAt ( ) 	Insert newline after each '(' and ')' in current line.
" :10,20LineBreakAt ( ) 	Same, in lines 10 to 20 inclusive.
" :%LineBreakAt ( ) 	Same, whole buffer.
" :LineBreakAt! ( ) 	Insert newline before each '(' and ')' in current line.
" :%LineBreakAt 	Insert newline after each occurrence of last-used search pattern.
" :%LineBreakAt! 	Insert newline before each occurrence of last-used search pattern.
command! -bang -nargs=* -range LineBreakAt <line1>,<line2>call LineBreakAt('<bang>', <f-args>)
function! LineBreakAt(bang, ...) range
  let save_search = @/
  if empty(a:bang)
    let before = ''
    let after = '\ze.'
    let repl = '&\r'
  else
    let before = '.\zs'
    let after = ''
    let repl = '\r&'
  endif
  let pat_list = map(deepcopy(a:000), "escape(v:val, '/\\.*$^~[')")
  let find = empty(pat_list) ? @/ : join(pat_list, '\|')
  let find = before . '\%(' . find . '\)' . after
  " Example: 10,20s/\%(arg1\|arg2\|arg3\)\ze./&\r/ge
  execute a:firstline . ',' . a:lastline . 's/'. find . '/' . repl . '/ge'
  let @/ = save_search
endfunction
