" BaSS vimrc's 2012

" General {{{
set nocompatible
call pathogen#infect() " add external plugins (.vim/bundle)
syntax on
filetype plugin indent on
set antialias
set modeline
set mousehide
set nobackup
set showcmd " Show us the command we're typing
set hidden  " Allow edit buffers to be hidden
runtime macros/matchit.vim

" Show pairs
set showmatch
set mat=5

" set leader to space
let mapleader = " "

" Enable a nice big viminfo file
set viminfo='1000,f1,:1000,/1000
set history=500
set undolevels=500

" Make backspace delete lots of things
set backspace=indent,eol,start

" Enable folds
if has("folding")
  set foldenable
  set foldmethod=syntax
endif
" }}}

" Misc {{{
let loaded_minibufexplorer = 1 "dont load miniBufferExplorer
set lazyredraw     " Speed up macros
set winminheight=1 " 1 height windows
set popt+=syntax:y " Syntax when printing

" Try to show at least three lines and two columns of context when
" scrolling
set scrolloff=3
set sidescrolloff=2

set cf                  " Enable error files & error jumping.
set clipboard+=unnamedplus  " Yanks go on clipboard instead.
set autowrite           " Writes on make/shell commands

set visualbell           " don't beep
set noerrorbells         " don't beep
" }}}

" MoveTabs {{{
function TabLeft()
   let tab_number = tabpagenr() - 1
   if tab_number == 0
      execute "tabm" tabpagenr('$') - 1
   else
      execute "tabm" tab_number - 1
   endif
endfunction

function TabRight()
   let tab_number = tabpagenr() - 1
   let last_tab_number = tabpagenr('$') - 1
   if tab_number == last_tab_number
      execute "tabm" 0
   else
      execute "tabm" tab_number + 1
   endif
endfunction

map <silent><C-S-Right> :execute TabRight()<CR>
map <silent><C-S-Left> :execute TabLeft()<CR>
" }}}

" spaces, tabs, indent {{{
" Do clever indent things. Don't make a # force column zero.
set autoindent
set copyindent    " copy the previous indentation on autoindenting
set smartindent
inoremap # X<BS>#

set smarttab
set softtabstop=2
set tabstop=4
set shiftwidth=2    "num colums
set expandtab       "use spaces
" }}}

" Fonts, Colors, Theming {{{

" Encoding {{{
scriptencoding utf-8
set encoding=utf-8
" }}}

set background=dark
let g:solarized_visibility="low" " Visibility of special chars
let g:solarized_contrast="high"

if has("gui_running")
  set guifont=Source\ Code\ Pro\ Medium\ 13
  colorscheme molokai
else
  colorscheme solarized
endif

" OSX stuff
if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    set guifont=Source\ Code\ Pro:h14
  endif
endif

" Highlight current line and col
autocmd WinLeave * setlocal nocursorcolumn nocursorline
autocmd WinEnter * setlocal cursorline cursorcolumn
autocmd BufLeave * setlocal nocursorcolumn nocursorline
autocmd BufEnter * setlocal cursorline cursorcolumn

" Special chars {{{
" highlight Problematic whitespaces
highlight RedundantSpaces term=standout ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t/ "\ze sets end of match so only spaces highlighted
" Show tabs and trailing whitespace visually
if (&termencoding == "utf-8") || has("gui_running")
  set list listchars=tab:\»\ ,trail:·,extends:…,nbsp:‗,eol:¶
else
  set list listchars=tab:>-,trail:.,extends:>,nbsp:_,eol:$
endif
" }}}

" Window title {{{
if has('title') && (has('gui_running') || &title)
  set titlestring=
  set titlestring+=%f\                  " file name
  set titlestring+=%h%m%r%w             " flags
  " set titlestring+=\ -\ %{v:progname} " program name
endif
" }}}

" StatusLine (uses powerline plugin) {{{
set ruler " cursor position in status
set laststatus=2
let g:Powerline_symbols = 'fancy'
" }}}

" {{{ Cursor
" highlight Cursor guifg=black guibg=Red
highlight iCursor guifg=black guibg=Orange
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10
" }}}

" }}}

" Search {{{
set incsearch " live search
set hlsearch  " highlight search

" Selective case insensitivity
set ignorecase
set infercase
set smartcase "only ignores case when minus words

" Show full tags when doing search completion
set showfulltag
" }}}

" Autocomplete {{{
" Use the cool tab complete menu
set wildmenu " show complete menu at bottom
" set wildmode=list:longest,full
set wildignore+=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif
set suffixes+=.in,.a

" Wrap on these
set whichwrap+=<,>,[,]

" load abbr if exist
if filereadable(expand("~/.vim/abbr"))
  source ~/.vim/abbr
endif

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

autocmd FileType ruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
" }}}

" Snippets {{{
" Append modeline after last line in buffer (<leader>ml).
function! AppendModeline()
  let save_cursor = getpos('.')
  let append = ' vim: set ts='.&tabstop.' sw='.&shiftwidth.' tw='.&textwidth.' fdm='.&foldmethod.':'
  $put =substitute(&commentstring,\"%s\",append,\"\")
  call setpos('.', save_cursor)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>
" }}}

" AutoCmd & other auto stuff {{{
" If we're in a wide window, enable line numbers.
if winwidth(0) > 80
  " setlocal foldcolumn=1
  setlocal number
else
  setlocal nonumber
  " setlocal foldcolumn=0
endif

" Auto add shebang
if has("autocmd")
  augroup content
    autocmd!

    autocmd BufNewFile *.rb 0put ='# vim: set sw=2 sts=2 tw=80 :' |
          \ 0put ='#!/usr/bin/ruby' | set sw=2 sts=2 tw=80 |
          \ norm G

    autocmd BufNewFile *.sh 0put ='# vim: set sw=2 sts=2 tw=80 :' |
          \ 0put ='#!/bin/bash' | set sw=2 sts=2 tw=80 |
          \ norm G
  augroup END
endif

" Python folder
au FileType python set foldmethod=indent
" Sgml,htmls,xml y xsl folder
au Filetype html,xml,xsl,sgml,docbook
" JavaScript fold
au FileType javascript call JavaScriptFold()
" Coffeescript folder
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

" }}}

" Keyboard shortcuts{{{
" F-Keys {{{
map <silent> <S-F1> :40vsplit ~/.vim/tips.md<CR>
map <silent> <C-F1> :vsplit ~/.vim/abbr<CR>

map <silent> <F2> :NERDTreeToggle<CR>
map <S-F2> :NeoComplCacheToggle<CR>

let g:ctrlp_map = '<F3>'
let g:ctrlp_cmd = 'CtrlP'
nmap <silent> <S-F3> :CtrlPTag<CR>

nmap <silent> <F4> :TagbarToggle<CR>
nmap <S-F4> :!ctags --extra=+f -R *<CR><CR>   " Regenerate tags in current dir
nmap <C-F4> :!ctags -R `bundle show rails`/../*<CR><CR> " Regenare gem tags for current dir proj

map   <F5> :set list!<CR>
map <S-F5> :set nu!<CR>
map <C-F5> :set cursorline! cursorcolumn!<CR>
map <T-F5> :NoMatchParen<CR>    " disable parenthesis hilite

map <silent> <F6> :set hlsearch!<CR>
map <C-F6> :set fenc=utf-8<CR>
map <S-F6> :set fenc=iso8859-15<CR>

map   <F7> :set spell!<CR>
map <S-F7> :setlocal spell spelllang=es<CR>
map <C-F7> :setlocal spell spelllang=en<CR>

map   <F8> :VCSStatus<CR>
map <T-F8> :VCSCommit<CR>
map <S-F8> :VCSUpdate<CR>

set pastetoggle=<F9>

" vinfruby
nmap     <F12> <Plug>Ropenterm
nmap   <S-F12> <Plug>Revalfile
nmap   <C-F12> <Plug>Revaldef
vmap   <T-F12> <Plug>Revalvisual
"nmap   <C-F12>   <Plug>Revalline
"nmap   <Leader>rc   <Plug>Revalclass
" }}}

" Leader {{{
" change color
nmap <Leader>rg :color relaxedgreen<CR>
nmap <Leader>ip :color inkpot<CR>
nmap <Leader>sol :color solarized<CR>
" Select everything
nmap <Leader>gg ggVG
" Delete blank lines
nmap <Leader>dbl :g/^$/d<CR>:nohls<CR>
" }}}

" Align {{{
vnoremap <silent> <Enter> :EasyAlign<Enter>
" }}}

" move in buffers and tabs
nmap <S-LEFT>  :bN<cr>
nmap <S-RIGHT> :bn<cr>
nmap <C-RIGHT> :tabnext<cr>
nmap <C-LEFT>  :tabprevious<cr>

" Avoid mistakes
nmap  :X        :x
nmap  :W        :w
nmap  :Q        :q
nmap  q:        :q
nmap  :aw       :wa
nmap  :qw       :wq

" <CTRL>+t new tab
imap <C-t> <esc>:tabnew<cr> a
map  <C-t> :tabnew<cr> i

"use \rci in normal mode to indent ruby code,should install gem kode
nmap <leader>rci :%!ruby-code-indenter<cr>

" Easy window navigation
map  <C-h>      <C-w>h
map  <C-j>      <C-w>j
map  <C-k>      <C-w>k
map  <C-l>      <C-w>l
nmap <tab><tab> <C-w>w

" }}}

" Ruby - Rails {{{
" Set FileType {{{
augroup filetypedetect
  au! BufNewFile,BufRead *.ch setf cheat
  au! BufNewFile,BufRead *.liquid setf liquid
  au! BufNewFile,BufRead *.haml setf haml
  au! BufNewFile,BufRead *.html.haml setf haml
  au! BufNewFile,BufRead *.yml setf eruby
  au! BufNewFile,BufRead *.erb setf eruby
  au! BufNewFile,BufRead *.html.erb setf eruby
  au! BufNewFile,BufRead *.rhtml setf eruby
augroup END
" }}}
" }}}

" Plugins {{{
" tagBar {{{
let g:tagbar_width = 30
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
" }}}
" explorer.vim {{{
let g:explHideFiles='^\.'
" }}}
" :TOhtml {{{
let html_number_lines=1
let html_use_css=1
let use_xhtml=1
" }}}
" cscope {{{
if has('cscope') && filereadable("/usr/bin/cscope")
  set csto=0
  set cscopetag
  set nocsverb
  if filereadable("cscope.out")
    cs add cscope.out
  endif
  set csverb

  let x = "sgctefd"
  while x != ""
    let y = strpart(x, 0, 1) | let x = strpart(x, 1)
    exec "nmap <C-j>" . y . " :cscope find " . y .
          \ " <C-R>=expand(\"\<cword\>\")<CR><CR>"
    exec "nmap <C-j><C-j>" . y . " :scscope find " . y .
          \ " <C-R>=expand(\"\<cword\>\")<CR><CR>"
  endwhile
  nmap <C-j>i      :cscope find i ^<C-R>=expand("<cword>")<CR><CR>
  nmap <C-j><C-j>i :scscope find i ^<C-R>=expand("<cword>")<CR><CR>
endif
" }}}
" VCSCommand {{{
let g:VCSCommandCommitOnWrite = 0
" }}}
" Debugger {{{
let g:DBGRconsoleHeight = 7
let g:DBGRlineNumbers   = 1
" }}}
" Surronding {{{
let g:rails_dbext=1
" }}}
" neocomplcache & neosnippets {{{
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1             " Use smartcase.
let g:neocomplcache_enable_camel_case_completion = 1  " Use camel case completion.
let g:neocomplcache_enable_underbar_completion = 1    " Use underbar completion.
let g:neocomplcache_min_syntax_length = 3             " Set minimum syntax keyword length.
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neosnippet#snippets_directory='~/.vim/snippets/snippets/'
" Plugin key-mappings.
imap <C-s>     <Plug>(neosnippet_expand_or_jump)
smap <C-s>     <Plug>(neosnippet_expand_or_jump)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" Supertab completion
let g:SuperTabDefaultCompletionType = "<c-x><c-u>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" }}}
" NerdCommenter {{{
"let NERDCreateDefaultMappings=0
let NERDSpaceDelims=1
" }}}
" autoclose {{{
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'"}
let g:AutoCloseProtectedRegions = ["String", "Character"]
" }}}
" coffeescript {{{
let coffee_compile_vert = 1
" }}}
" airline {{{
let g:airline_theme = 'airlineish'
" }}}
" }}}

" Modeline {{{
" vim: set fdm=marker ts=4 sw=2 tw=78:
" }}}

