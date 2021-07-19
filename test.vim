" nvim -NU test.vim

set nocompatible hidden laststatus=2

if !filereadable('/tmp/plug.vim')
  silent !curl --insecure -fLo /tmp/plug.vim
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

source /tmp/plug.vim
call plug#begin('/tmp/plugged')
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
call plug#end()

autocmd VimEnter * PlugClean! | PlugUpdate --sync | close
lua require('telescope').setup()
