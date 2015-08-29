" BaSS vimrc's 2015

" General {{{
set nocompatible
filetype on

" Vundle {{{
call plug#begin('~/.vim/plugged')
Plug 'genutils'
Plug 'L9'
Plug 'xolox/vim-misc'
Plug 'sheerun/vim-polyglot'
" Add repeat support to other plugins
Plug 'tpope/vim-repeat'

" Plug 'romainl/Apprentice'
" Plug 'molokai'
Plug 'chriskempson/base16-vim'
Plug 'bling/vim-airline'
Plug 'paranoida/vim-airlineish'

Plug 'Toggle'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
" Plug 'rking/ag.vim'
Plug 'gabesoft/vim-ags', { 'on': 'Ags' }
Plug 't9md/vim-choosewin'
" overlay windows with - (dash)
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/vim-easy-align'
" save session :Obsess / Obsess!
Plug 'tpope/vim-obsession'
" increase/decrease dates with ctrl-a/x
Plug 'tpope/vim-speeddating'
" show index in search results: N of NN
Plug 'henrik/vim-indexed-search'
" Auto set paste
Plug 'conradIrwin/vim-bracketed-paste'
Plug '907th/vim-auto-save'
" open file:line_number
Plug 'bogado/file-line'
" search occurences in visual selection
Plug 'nelstrom/vim-visual-star-search'

" show verticla guides with <leader>ig
Plug 'nathanaelkane/vim-indent-guides', { 'on': 'IndentGuidesToggle' }
" expand texobj
" Plug 'gcmt/wildfire.vim'
" abrevations on steroids
" Plug 'tpope/vim-abolish'
Plug 'tpope/vim-endwise'
" add mor selectors to %
Plug 'vim-scripts/matchit.zip'
" autoclsoe (,{,...
Plug 'Raimondi/delimitMate'
Plug 'ervandew/supertab'
Plug 'Shougo/neocomplete'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'tComment'
" lint syntax
Plug 'Syntastic'
Plug 'Tagbar'
" skip half each time with s or to center with gs
Plug 'jayflo/vim-skip'
" Plug 't9md/vim-smalls'
Plug 'tpope/vim-surround'
Plug 'textobj-user'
Plug 'EasyMotion'
Plug 'gorkunov/smartpairs.vim'
Plug 'tpope/vim-ragtag'
Plug 'gabrielelana/vim-markdown'
Plug 'mustache/vim-mustache-handlebars'
" search in zeal <leader>z
Plug 'KabbAmine/zeavim.vim'
" Send to terminal
Plug 'jpalardy/vim-slime'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" highlight newst git change
Plug 'joeytwiddle/git_shade.vim', { 'on': 'GitShade' }
Plug 'gregsexton/gitv', { 'on': 'Gitv' }

Plug 'Haml'
Plug 'avakhov/vim-yaml'
" spli/join blocks with gS gJ
Plug 'AndrewRadev/splitjoin.vim'
Plug 'textobj-rubyblock', {'for': 'ruby'}
Plug 'sunaku/vim-ruby-minitest', {'for': 'ruby'}
Plug 'rake.vim', {'for': 'ruby'}
Plug 'ruby-matchit', {'for': 'ruby'}
Plug 'bundler', {'for': 'ruby'}
Plug 'rails.vim', {'for': 'ruby'}
" run tests with <leader>r/R
Plug 'skalnik/vim-vroom', { 'for': 'ruby' }
Plug 'gorkunov/smartgf.vim', {'for': 'ruby'}
Plug 'stefanoverna/vim-i18n', {'for': 'ruby'}
" convert hash keys to symbol, strings or 1.9 style with rs rt rr
Plug 'rorymckinley/vim-rubyhash', {'for': 'ruby'}
Plug 'danchoi/ri.vim', {'for': 'ruby'}

call plug#end()
" }}}

filetype plugin indent on

syntax on
set antialias
set modeline
set mousehide
set nobackup
set showcmd " Show us the command we're typing
" set hidden  " Allow edit buffers to be hidden
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

" if buffer is in tab use that tab
set switchbuf=usetab,newtab

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=1200

" Sessions {{{
set ssop-=options
" }}}

" ToolBar {{{
tmenu ToolBar.reducefont Reduce font size
amenu ToolBar.reducefont :set guifont=Source\ Code\ Pro\ Medium\ 11<CR>
"}}}

" Misc {{{
" let loaded_minibufexplorer = 0 "dont load miniBufferExplorer
set lazyredraw     " Speed up macros
set winminheight=1 " 1 height windows
set popt+=syntax:y " Syntax when printing

set linespace=0                 " number of pixels between the lines
set splitright                  " open vertical splits on the right
set splitbelow                  " open the horizontal split below
" set wrap                        " wrap long lines
set linebreak                   " break lines at word end

" The "Press ENTER or type command to continue" prompt is jarring and usually unnecessary.
set shortmess=atI

" Try to show at least three lines and two columns of context when
" scrolling
set scrolloff=3
set sidescrolloff=2
" Improve vim's scrolling speed
set ttyfast
set ttyscroll=3

set cf                  " Enable error files & error jumping.
set clipboard+=unnamedplus  " Yanks go on clipboard instead.
set autowrite           " Writes on make/shell commands

set visualbell           " don't beep
set noerrorbells         " don't beep

set tags+=gems.tags
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

if has("gui_running")
  " set guifont=Source\ Code\ Pro\ For\ Powerline\ 11
  set guifont=Hack\ 12
  " colorscheme molokai
  " colorscheme apprentice
  colorscheme base16-default
else
  colorscheme base16-default
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
" if (&termencoding == "utf-8") || has("gui_running")
"   set list listchars=tab:\»\ ,trail:·,extends:…,nbsp:‗,eol:¶
" else
"   set list listchars=tab:>-,trail:.,extends:>,nbsp:_,eol:$
" endif
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
" if winwidth(0) > 80
"   " setlocal foldcolumn=1
"   setlocal number
" else
"   setlocal nonumber
"   " setlocal foldcolumn=0
" endif
setlocal number

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

" Autoload vimrc
" au BufWritePost .vimrc so $MYVIMRC

" Python folder
au FileType python set foldmethod=indent
" Sgml,htmls,xml y xsl folder
au Filetype html,xml,xsl,sgml,docbook
" JavaScript fold
au FileType javascript call JavaScriptFold()
" Coffeescript folder
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

autocmd Filetype gitcommit setlocal spell textwidth=72

" Some file types use real tabs
au FileType {make,gitconfig} set noexpandtab sw=4

" Treat JSON files like JavaScript
au BufNewFile,BufRead *.json setf javascript

" Make Python follow PEP8
au FileType python set sts=4 ts=4 sw=4 tw=79

" Make sure all markdown files have the correct filetype
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown

" MultiMarkdown requires 4-space tabs
au FileType markdown set sts=4 ts=4 sw=4

" }}}

" Keyboard shortcuts{{{
" F-Keys {{{
map <silent> <S-F1> :40vsplit ~/.vim/tips.md<CR>
map <silent> <C-F1> :vsplit ~/.vim/abbr<CR>

map <silent>  <F2> :NERDTreeToggle<CR>
map         <S-F2> :NeoCompleteToggle<CR>
map         <C-F2> :GitGutterToggle<CR>

let g:ctrlp_map = '<F3>'
let g:ctrlp_cmd = 'CtrlP'
nmap <silent> <S-F3> :CtrlPTag<CR>
nmap <silent> <C-F3> :CtrlPBuffer<CR>

nmap <silent> <F4> :TagbarToggle<CR>
nmap <S-F4> :!ctags --extra=+f -R *<CR><CR>   " Regenerate tags in current dir
" nmap <C-F4> :!ctags -R `bundle show rails`/../*<CR><CR> " Regenare gem tags for current dir proj
nmap <C-F4> :!ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)<CR><CR> " Regenare gem tags for current dir proj

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
" Select everything
nmap <Leader>gg ggVG
" Delete blank lines
nmap <Leader>dbl :g/^$/d<CR>:nohls<CR>
" Align
vnoremap <silent> <Leader><Enter> :EasyAlign<Enter>
" Open file
nnoremap <Leader>o :CtrlP<CR>
" Save file
nnoremap <Leader>w :w<CR>
" Copy ans paste to clipboard
" vnoremap <C-c> "+y
" noremap <T-v> "+gP
" imap <T-v> "+gP
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
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

nmap <C-Enter> <C-w><C-]><C-w>T

" Visually select the text that was last edited/pasted
nnoremap gV `[v`]
" selelct what you've just pasted
nnoremap gp `[v`]
" nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'
" reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv


" }}}

" Ruby - Rails {{{
" Set FileType {{{
augroup filetypedetect
  au! BufNewFile,BufRead *.ch setf cheat
  au! BufNewFile,BufRead *.liquid setf liquid
  au! BufNewFile,BufRead *.haml setf haml
  au! BufNewFile,BufRead *.html.haml setf haml
  au! BufNewFile,BufRead *.hamljs setf haml
  au! BufNewFile,BufRead *.yml setf eruby
  au! BufNewFile,BufRead *.erb setf eruby
  au! BufNewFile,BufRead *.html.erb setf eruby
  au! BufNewFile,BufRead *.rhtml setf eruby
  au! BufNewFile,BufRead Vagrantfile* setf ruby
augroup END
" }}}
" scss to sass
command Scss2Sass %s/\s\?{\|;\|}//g

" Autocomplete ids and classes in CSS
autocmd FileType css,scss set iskeyword=@,48-57,_,-,?,!,192-255
" Add the '-' as a keyword in erb files
autocmd FileType eruby set iskeyword=@,48-57,_,192-255,$,-
" Make those debugger statements painfully obvious
au BufEnter *.rb syn match error contained "\<binding.pry\>"
au BufEnter *.rb syn match error contained "\<debugger\>"
" }}}

" Plugins {{{
" slime {{{
let g:slime_target = "tmux"
vnoremap <Leader>t :SlimeSend<Cr>
" }}}
" ident-guides {{{
let g:indent_guides_guide_size = 1
" }}}

" autosave {{{
let g:auto_save = 1
let g:auto_save_no_updatetime = 1  " do not change the 'updatetime' option
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode
""let g:auto_save_silent = 1  " do not display the auto-save notification
" }}}

" fugitive {{{
" delete hidden fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete
" }}}
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
" neocomplcache & multiple cursor fix {{{
" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
  if exists(':AutoSaveToggle')==2
    exe 'AutoSaveToggle'
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
  if exists(':AutoSaveToggle')==2
    exe 'AutoSaveToggle'
  endif
endfunction
" }}}
" neocomplcache & neosnippets {{{
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1             " Use smartcase.
let g:neocomplete#enable_camel_case_completion = 1  " Use camel case completion.
let g:neocomplete#enable_underbar_completion = 1    " Use underbar completion.
let g:neocomplete#min_syntax_length = 3             " Set minimum syntax keyword length.
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" let g:neosnippet#snppets_directory='~/.vim/snippets/snippets/'
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
" autoclose {{{
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'"}
let g:AutoCloseProtectedRegions = ["String", "Character"]
" }}}
" coffeescript {{{
let coffee_compile_vert = 1
" }}}
" airline {{{
let g:airline_theme = 'base16'
let g:airline_powerline_fonts = 1
" add buffer explorer with separator
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
set showtabline=0 " remove tab bar
" shows obsession status
let g:airline_section_z = airline#section#create(['%{ObsessionStatus(''$'','''')}', 'windowswap', '%3p%% ', 'linenr', ':%3v '])
" }}}
" Choosewin {{{
nmap  -  <Plug>(choosewin)
" }}}
" Small {{{
" map normal-mode 's' for simple search
" map m <Plug>(smalls)
" if you want to use smalls in visual/operator or both mode.
" omap m <Plug>(smalls)
" xmap m <Plug>(smalls)
" }}}
" SplitJoin {{{
" nmap ss :SplitjoinSplit<cr>
" nmap sj :SplitjoinJoin<cr>
" }}}
" CtrlP {{{
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git\|node_modules\|bin\|\.hg\|\.svn\|build\|log\|docker\|data\|resources\|coverage\|doc\|tmp\|public/assets\|vendor\|Android',
  \ 'file': '\.jpg$\|\.exe$\|\.so$\|tags$\|\.dll$'
  \ }
let g:ctrlp_use_caching = 0
nnoremap <Leader>f :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>F :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
" }}}
" SmartGF {{{
let g:smartgf_key = 'gm'
let g:smartgf_auto_refresh_ctags = 0
" }}}
" Rails i18n {{{
vmap <Leader>8 :call I18nTranslateString()<CR>
" }}}
" }}}

" Modeline {{{
" vim: set fdm=marker ts=4 sw=2 tw=78:
" }}}
