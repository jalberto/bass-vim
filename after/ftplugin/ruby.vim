iabbr bpry require'pry';binding.pry
iabbr froz # frozen_string_literal: true

" Make those debugger statements painfully obvious
au BufEnter *.rb syn match error contained "\<binding.pry\>"
au BufEnter *.rb syn match error contained "\<debugger\>"
