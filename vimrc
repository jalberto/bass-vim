" BaSS vimrc's 2015

" General {{{
set nocompatible
filetype on

if has('nvim')
  set runtimepath^=~/.vim runtimepath+=~/.vim/after
  let &packpath = &runtimepath
endif

" Vundle {{{
" Helper to add conditionals for nvim
function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

call plug#begin('~/.vim/plugged')
Plug 'clones/vim-genutils'
Plug 'eparreno/vim-l9'
Plug 'xolox/vim-misc'
Plug 'sheerun/vim-polyglot'
Plug 'dNitro/vim-pug-complete', {'for': 'pug'}
Plug 'Valloric/YouCompleteMe'
" Plug 'ncm2/ncm2'
" Plug 'roxma/nvim-yarp'

" Add repeat support to other plugins
Plug 'tpope/vim-repeat'
" Try to detect correct identation
Plug 'tpope/vim-sleuth'

" Plug 'romainl/Apprentice'
" Plug 'molokai'
Plug 'robbles/logstash.vim'
Plug 'itkq/fluentd-vim'
Plug 'chriskempson/base16-vim'

" Plug 'mtth/scratch.vim'
" Plug 'Toggle'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeTabsToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on':  'NERDTreeTabsToggle' }
Plug 'jistr/vim-nerdtree-tabs', { 'on': 'NERDTreeTabsToggle' }
Plug 'wincent/ferret'
" overlay windows with - (dash)
Plug 't9md/vim-choosewin'
" ctrl+n for multi cursor
Plug 'terryma/vim-multiple-cursors'
" <ldr><CR> for auto align
Plug 'junegunn/vim-easy-align'
" save session :Obsess / Obsess!
Plug 'tpope/vim-obsession'
" increase/decrease dates with ctrl-a/x
Plug 'tpope/vim-speeddating'
" show index in search results: N of NN
Plug 'henrik/vim-indexed-search'
" Auto set paste
Plug 'conradIrwin/vim-bracketed-paste'
" Plug '907th/vim-auto-save'
" open file:line_number
Plug 'bogado/file-line'
" search occurences in visual selection
Plug 'nelstrom/vim-visual-star-search'
" Display leadk mapping with <lead>fml
Plug 'ktonga/vim-follow-my-lead'
" Display undto tree with <leader>u
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-markdown'

" show verticla guides with <leader>ig
Plug 'nathanaelkane/vim-indent-guides', { 'on': 'IndentGuidesToggle' }
" expand texobj
" Plug 'gcmt/wildfire.vim'
" abrevations on steroids
" Plug 'tpope/vim-abolish'
Plug 'tpope/vim-endwise'
" add more selectors to %
Plug 'vim-scripts/matchit.zip'
" autoclose (,{,...
Plug 'Raimondi/delimitMate'
Plug 'ervandew/supertab'
Plug 'Quramy/vison'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tomtom/tcomment_vim'
Plug 'w0rp/ale' " async lint
Plug 'majutsushi/tagbar'
" skip half each time with s or to center with gs
Plug 'jayflo/vim-skip'
" Plug 't9md/vim-smalls'
Plug 'tpope/vim-surround'
Plug 'kana/vim-textobj-user'
Plug 'gorkunov/smartpairs.vim'
Plug 'tpope/vim-ragtag'
Plug 'mustache/vim-mustache-handlebars'
" search in zeal <leader>z
Plug 'KabbAmine/zeavim.vim'
" Send to terminal
Plug 'jpalardy/vim-slime', Cond(!has('nvim'))
Plug 'kassio/neoterm', Cond(has('nvim'))
Plug 'roxma/vim-tmux-clipboard', Cond(has('nvim'))
Plug 'christoomey/vim-tmux-navigator'
" Underline word under cursor
Plug 'itchyny/vim-cursorword'
" auto generate tags async
Plug 'ludovicchabant/vim-gutentags'
Plug 'rhysd/clever-f.vim'
Plug 'kshenoy/vim-signature'

Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
" highlight newst git change
Plug 'joeytwiddle/git_shade.vim', { 'on': 'GitShade' }
Plug 'gregsexton/gitv', { 'on': 'Gitv' }
" git config --global core.editor "$(which nvim)"
Plug 'rhysd/committia.vim'
Plug 'whiteinge/diffconflicts'

Plug 'tpope/vim-rbenv'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-haml'
" Plug 'avakhov/vim-yaml'
Plug 'towolf/vim-helm'
Plug 'christianrondeau/vim-base64'
" spli/join blocks with gS gJ
Plug 'AndrewRadev/splitjoin.vim'
" Ruby objs select: ar/ir
" Plug 'nelstrom/vim-textobj-rubyblock', {'for': 'ruby'}
" Plug 'sunaku/vim-ruby-minitest', {'for': 'ruby'}
" Plug 'rake.vim', {'for': 'ruby'}
Plug 'tpope/vim-rake', {'for': 'ruby'}
Plug 'vim-scripts/ruby-matchit', {'for': 'ruby'}
Plug 'tpope/vim-bundler', {'for': 'ruby'}
Plug 'tpope/vim-rails', {'for': 'ruby'}
" run tests with <leader>r/R
" Plug 'skalnik/vim-vroom', { 'for': 'ruby' }
Plug 'gorkunov/smartgf.vim', {'for': 'ruby'}
Plug 'stefanoverna/vim-i18n', {'for': 'ruby'}
" convert hash keys to symbol, strings or 1.9 style with rs rt rr
Plug 'rorymckinley/vim-rubyhash', {'for': 'ruby'}
Plug 'danchoi/ri.vim', {'for': 'ruby'}
Plug 'janko-m/vim-test'

" Plug 'ryanoasis/vim-devicons'

Plug 'slashmili/alchemist.vim', {'for': 'elixir'}
Plug 'c-brenn/phoenix.vim', {'for': 'elixir'}
Plug 'tpope/vim-projectionist' " required for some navigation features

Plug 'vimwiki/vimwiki', {'branch': 'dev'}

" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'andrewstuart/vim-kubernetes', {'for': 'yaml'}
" Pomodoro
" Plug 'l04m33/vim-skuld'

Plug 'kristijanhusak/vim-hybrid-material'
Plug 'fenetikm/falcon'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()
" }}}

" filetype plugin indent on

" syntax on
if !has('nvim')
  set antialias
endif
set modeline
set mousehide
set nobackup
set showcmd " Show us the command we're typing
" set hidden  " Allow edit buffers to be hidden
runtime macros/matchit.vim
set backupdir=/tmp//
set directory=/tmp//

" Try to autoreload files on external changes
autocmd FocusGained * silent! checktime

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

" no more annoying startup msg
set shortmess=aoOtI
" set cmdheight=2
let g:bufferline_echo=0

" {{{ Folding & syntax
if has("folding")
  set foldenable
  set foldmethod=syntax
  set foldlevelstart=2   " open most folds by default
endif

" Sgml,htmls,xml y xsl folder
au Filetype html,xml,xsl,sgml,docbook

" Yaml and company
autocmd FileType yaml setlocal foldmethod=indent
autocmd BufRead,BufNewFile */templates/*.yaml,*/templates/*.tpl set ft=helm
autocmd FileType helm setlocal foldmethod=indent

" JavaScript fold
autocmd FileType javascript setlocal foldmethod=syntax
autocmd FileType javascript setlocal foldlevelstart=1
" autocmd FileType javascript syntax region foldBraces
" Apply schema to json
autocmd BufRead,BufNewFile swagger.json Vison
" Treat JSON files like JavaScript
au BufNewFile,BufRead *.json setf javascript
" Coffeescript folder
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

" Some file types use real tabs
au FileType {make,gitconfig} set noexpandtab sw=4

" Make Python follow PEP8
au FileType python set foldmethod=indent
au FileType python set sts=4 ts=4 sw=4 tw=79

" Make sure all markdown files have the correct filetype
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown
" MultiMarkdown requires 4-space tabs
au FileType markdown set sts=4 ts=4 sw=4
let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'sql']

autocmd Filetype gitcommit setlocal spell textwidth=72
" "}}}

" if buffer is in tab use that tab
set switchbuf=usetab,newtab

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=1200

" Sessions {{{
set ssop-=options
augroup sourcesession
  autocmd!
  autocmd VimEnter * nested
        \ if !argc() && empty(v:this_session) && filereadable('Session.vim') |
        \   source Session.vim |
        \ endif
augroup END
" }}}

" Misc {{{
" let loaded_minibufexplorer = 0 "dont load miniBufferExplorer
set lazyredraw     " Speed up macros
set winminheight=1 " 1 height windows
set popt+=syntax:y " Syntax when printing

set linespace=0                 " number of pixels between the lines
set splitright                  " open vertical splits on the right
set splitbelow                  " open the horizontal split below
" set wrap                      " wrap long lines
set linebreak                   " break lines at word end

" Try to show at least three lines and two columns of context when scrolling
set scrolloff=5
set sidescrolloff=3
" Improve vim's scrolling speed
set ttyfast
if !has('nvim')
  set ttyscroll=3
endif

set cf                  " Enable error files & error jumping.
set clipboard+=unnamedplus  " Yanks go on clipboard instead.
set autowrite           " Writes on make/shell commands

set visualbell           " don't beep
set noerrorbells         " don't beep

" set tags+=gems.tags
" }}}

" MoveTabs {{{
" function TabLeft()
"    let tab_number = tabpagenr() - 1
"    if tab_number == 0
"       execute "tabm" tabpagenr('$') - 1
"    else
"       execute "tabm" tab_number - 1
"    endif
" endfunction
"
" function TabRight()
"    let tab_number = tabpagenr() - 1
"    let last_tab_number = tabpagenr('$') - 1
"    if tab_number == last_tab_number
"       execute "tabm" 0
"    else
"       execute "tabm" tab_number + 1
"    endif
" endfunction

" map <silent><C-S-Right> :execute TabRight()<CR>
" map <silent><C-S-Left> :execute TabLeft()<CR>
" }}}

" spaces, tabs, indent {{{
" Do clever indent things. Don't make a # force column zero.
set autoindent
set copyindent    " copy the previous indentation on autoindenting
set smartindent
inoremap # X<BS>#

set smarttab
set softtabstop=2
set tabstop=2
set shiftwidth=2    "num colums
set expandtab       "use spaces
" }}}

" Fonts, Colors, Theming {{{

" Encoding {{{
scriptencoding utf-8
set encoding=utf-8
" }}}

" Terminal true colour support
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif
" if exists('$TMUX')
"   let &t_8f = "<Esc>[38;2;%lu;%lu;%lum"
"   let &t_8b = "<Esc>[48;2;%lu;%lu;%lum"
" endif
if has("nvim") || has("termguicolors")
  " clean BCE in tmux for propper colours
  " set t_ut=
  set termguicolors
endif

set background=dark
let g:enable_bold_font = 1
let g:falcon_background = 1
let g:falcon_inactive = 0
if has("gui_running")
  set guifont=Hack\ 12
  colorscheme falcon
else
  colorscheme falcon
endif
" fix falcon bg colour
" hi Normal guifg=#d4d4d9 ctermfg=188 guibg=#0b0b1a ctermbg=NONE gui=NONE cterm=NONE

"{{{ OSX stuff
" if has("unix")
"   let s:uname = system("uname")
"   if s:uname == "Darwin\n"
"     set guifont=Source\ Code\ Pro:h14
"   endif
" endif
" }}}

" {{{ Highlight current line and col
hi CursorLine cterm=NONE gui=NONE guibg=black ctermbg=232
hi CursorLineNr cterm=NONE gui=NONE guifg=orange guibg=black ctermbg=black
hi CursorColumn cterm=NONE gui=NONE guibg=black ctermbg=232
" autocmd WinLeave * setlocal nocursorcolumn nocursorline
" autocmd WinEnter * setlocal cursorline
" autocmd BufLeave * setlocal nocursorcolumn nocursorline
" autocmd BufEnter * setlocal cursorline
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline cursorcolumn
  au InsertEnter * setlocal cursorline nocursorcolumn
  au InsertLeave * setlocal cursorline cursorcolumn
  au WinLeave,BufLeave * setlocal nocursorline nocursorcolumn
augroup END
" }}]

" Special chars {{{
" highlight Problematic whitespaces
highlight RedundantSpaces term=standout ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t/ "\ze sets end of match so only spaces highlighted
" Show tabs and trailing whitespace visually
" if (&termencoding == "utf-8") || has("gui_running")
  set list listchars=tab:⭾\ ,trail:␠,extends:…,nbsp:⎵,eol:⏎
" else
  " set list listchars=tab:>-,trail:.,extends:>,nbsp:_,eol:$
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

" {{{ Cursor
highlight Cursor guifg=black guibg=steelblue
highlight iCursor guifg=white guibg=Orange
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

" autocmd FileType python set omnifunc=pythoncomplete#Complete
" autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
" autocmd FileType php set omnifunc=phpcomplete#CompletePHP
" autocmd FileType c set omnifunc=ccomplete#Complete

" autocmd FileType ruby set omnifunc=rubycomplete#Complete
" autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
" autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
" autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
" }}}

" Snippets {{{

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-j>']
let g:ycm_key_list_previous_completion = ['<C-k>']
let g:SuperTabDefaultCompletionType = '<C-j>'

" ultisnips directory
"let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

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

" Auto reload vimrc
" au BufWritePost .vimrc so $MYVIMRC

" }}}

" Keyboard shortcuts{{{
" F-Keys {{{
map <silent> <S-F1> :40vsplit ~/.vim/tips.md<CR>
map <silent> <C-F1> :vsplit ~/.vim/abbr<CR>

map <silent>  <F2> :NERDTreeTabsToggle<CR>
" map         <S-F2> :NeoCompleteToggle<CR>

" let g:ctrlp_map = '<F3>'
" let g:ctrlp_cmd = 'CtrlP'
" nmap <silent> <S-F3> :CtrlPTag<CR>
" nmap <silent> <C-F3> :CtrlPBuffer<CR>

nmap <silent> <F4> :TagbarToggle<CR>
nmap <S-F4> :!ctags --extra=+f -R *<CR><CR>   " Regenerate tags in current dir
" nmap <C-F4> :!ctags -R `bundle show rails`/../*<CR><CR> " Regenare gem tags for current dir proj
nmap <C-F4> :!ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)<CR><CR> " Regenare gem tags for current dir proj

map   <F5> :set list!<CR>
map <S-F5> :set nu!<CR>
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
" }}}

" Leader {{{
map <leader>x :NERDTreeTabsToggle<CR>
map <leader>h :40vsplit ~/.vim/tips.md<CR>

map <leader>n :set number!<CR>
map <leader>nn :set relativenumber!<CR>

map <Leader>cl :set cursorline!<CR>
map <Leader>cc :set cursorline! cursorcolumn!<CR>

" json beautifier
nnoremap <Leader>j :%!jq '.'<CR>

" quickfix list for breakpoints
nmap <Leader>bl :Ack binding.pry<CR>
" …also, Insert Mode as bpry<space>
iabbr bpry require'pry';binding.pry
" add pry
map <Leader>bp orequire'pry';binding.pry<esc>:w<cr>

" Select everything
nmap <Leader>gg ggVG
" Delete blank lines
nmap <Leader>dbl :g/^$/d<CR>:nohls<CR>
" Delete trailing spaces
nmap <Leader>dts :%s/\s\+$//e<CR>
" Align
vnoremap <silent> <Leader><Enter> :EasyAlign<Enter>
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

" tags
nmap <Leader>ct :TagbarToggle<cr>
" }}}

" move in buffers and tabs
" nmap <S-LEFT>  :bN<cr>
" nmap <S-RIGHT> :bn<cr>
" imap <S-LEFT>  <esc>:bN<cr>
" imap <S-RIGHT> <esc>:bn<cr>
nmap <C-RIGHT> :tabnext<cr>
nmap <C-LEFT>  :tabprevious<cr>
" imap <C-RIGHT> <esc>:tabnext<cr>
" imap <C-LEFT>  <esc>:tabprevious<cr>
nmap <silent> <C-h> :tabprevious<cr>
nmap <silent> <C-l> :tabnext<cr>
imap <silent> <C-h> <esc>:tabprevious<cr>
imap <silent> <C-l> <esc>:tabnext<cr>
nnoremap <a-h> <C-w>h
nnoremap <a-j> <C-w>j
nnoremap <a-k> <C-w>k
nnoremap <a-l> <C-w>l
nmap <silent> <S-h> :bN<cr>
nmap <silent> <S-l> :bn<cr>

" Avoid mistakes
nmap  :X        :x
nmap  :W        :w
nmap  :Q        :q
" nmap  q:        :q
nmap  :aw       :wa
nmap  :qw       :wq
nnoremap ; :

" <CTRL>+t new tab
imap <C-t> <esc>:tabnew<cr> a
map  <C-t> :tabnew<cr> i

" Easy window navigation
" map  <T-h>      <C-w>h
" map  <T-j>      <C-w>j
" map  <T-k>      <C-w>k
" map  <T-l>      <C-w>l
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

" Keep search matches in the middle of the screen
nnoremap n nzz
nnoremap N Nzz

" resize panels
noremap <A-up>    <C-W>+
noremap <A-down>  <C-W>-
noremap <A-left>  3<C-W><
noremap <A-right> 3<C-W>>

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

" {{{ Docker stuff
autocmd BufNewFile,BufRead Dockerfile.* set ft=dockerfile
autocmd BufNewFile,BufRead docker-compose.* set ft=yaml
" }}}

" Plugins {{{

" base64 {{{
vmap <Leader>e64 <leader>btoa
vmap <Leader>d64 <leader>atob
" }}}

" clever-f {{{
let g:clever_f_smart_case = 1
" }}]

" Guten tag {{{
let g:gutentags_ctags_exclude = ["node_modules", "assets", "_build", "build", "vendor", "private", "priv", "logs", ".git"]
let g:gutentags_cache_dir = "/tmp"
" }}}

" fzf {{{
" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --no-ignore --hidden --follow --smart-case --glob "!**/{.git,node_modules,vendor,priv,deps,_build}/*"'
  set grepprg=rg\ --vimgrep

  " command! -bang -nargs=* Rg call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --smart-case --hidden --follow --glob "!**/{.git,node_modules,vendor,priv,deps,_build}/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

"   :Rg  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Rg! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --fixed-strings --smart-case --hidden --follow --glob "!**/{.git,node_modules,vendor,priv,deps,_build}/*" '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

endif

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

function! s:getVisualSelection()
  let [line_start, column_start] = getpos("'<")[1:2]
  let [line_end, column_end] = getpos("'>")[1:2]
  let lines = getline(line_start, line_end)

  if len(lines) == 0
      return ""
  endif

  let lines[-1] = lines[-1][:column_end - (&selection == "inclusive" ? 1 : 2)]
  let lines[0] = lines[0][column_start - 1:]

  return join(lines, "\n")
endfunction

let g:fzf_buffers_jump = 1

" nnoremap <silent> <leader>e :call Fzf_dev()<CR>
nnoremap <Leader>o :Files<CR>
nnoremap <Leader>O :History<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <silent><leader>W :Rg! <C-R><C-W><CR>
vnoremap <silent><leader>W <Esc>:Rg! <C-R>=<SID>getVisualSelection()<CR><CR>
" }}}

" vimwiki {{{
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
" }}}
" Tmux navigator {{{
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <A-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <A-j> :TmuxNavigateDown<cr>
nnoremap <silent> <A-k> :TmuxNavigateUp<cr>
nnoremap <silent> <A-l> :TmuxNavigateRight<cr>
nnoremap <silent> <A-\> :TmuxNavigatePrevious<cr>
" }}}

" Ale lint {{{
" autocmd! BufWritePost * Neomake
nmap <silent> <leader>pl <Plug>(ale_previous_wrap)
nmap <silent> <leader>nl <Plug>(ale_next_wrap)
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 0
let g:ale_sign_column_always = 1
let g:ale_sign_error = '⨉'
let g:ale_sign_warning = '⚠'
let g:airline#extensions#ale#enabled = 1

let g:ale_fixers = {
\   'elixir': ['mix_format'],
\}
let g:ale_fix_on_save = 1
" }}}

" Visual Drag (move selected chunk) {{{
vmap  <expr>  <LEFT> DVB_Drag('left')
vmap  <expr>  <RIGHT> DVB_Drag('right')
vmap  <expr>  <DOWN> DVB_Drag('down')
vmap  <expr>  <UP> DVB_Drag('up')
vmap  <expr>  D       DVB_Duplicate()
" Remove any introduced trailing whitespace after moving...
let g:DVB_TrimWS = 1
" }}}

" Tests {{{
nmap <silent> <leader>T :TestNearest<CR>
nmap <silent> <leader>Tf :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
" }}}

" NerdTree {{{
let g:NERDTreeAutoDeleteBuffer = 1
" let g:NERDTreeShowBookmarks = 1
let g:NERDTreeCascadeOpenSingleChildDir = 1
" }}}

" WebDevIcons {{{
let g:webdevicons_enable_nerdtree = 0
let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = '-'
" }}}

" slime & NeoTerm {{{
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <A-h> <C-\><C-n><C-w>h
  tnoremap <A-j> <C-\><C-n><C-w>j
  tnoremap <A-k> <C-\><C-n><C-w>k
  tnoremap <A-l> <C-\><C-n><C-w>l

  let g:neoterm_autoscroll = '1'
  let g:neoterm_size = 10
  let g:neoterm_autoinsert = 1
  let g:neoterm_default_mod = 'belowright'

  nnoremap <leader>tf :TREPLSendFile<cr>
  nnoremap <leader>t :TREPLSendLine<cr>
  vnoremap <leader>t :TREPLSendSelection<cr>

  nnoremap <silent> <leader>th :call neoterm#close()<cr>
  nnoremap <silent> <leader>tl :call neoterm#clear()<cr>
  nnoremap <silent> <leader>tc :call neoterm#kill()<cr>

  command! Trc :T bin/rails c
  command! Trn :T bin/rails notes
  nnoremap <silent> ¬ :Ttoggle<cr>
else
  let g:slime_target = "tmux"
  vnoremap <Leader>ts :SlimeSend<Cr>
endif
" }}}

" ident-guides {{{
let g:indent_guides_guide_size = 1
" }}}

" Gundo {{{
" toggle gundo
nnoremap <leader>u :GundoToggle<CR>
" }}}

" autosave {{{
" let g:auto_save = 0
" let g:auto_save_no_updatetime = 1  " do not change the 'updatetime' option
" let g:auto_save_in_insert_mode = 0  " do not save while in insert mode
""let g:auto_save_silent = 1  " do not display the auto-save notification
" }}}

" Follow my Lead {{{
let g:fml_all_sources = 1
" }}}

" fugitive {{{
" delete hidden fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete
" }}}
" tagBar {{{
let g:tagbar_width = 30
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'f:functions',
        \ 'functions:functions',
        \ 'c:callbacks',
        \ 'd:delegates',
        \ 'e:exceptions',
        \ 'i:implementations',
        \ 'a:macros',
        \ 'o:operators',
        \ 'm:modules',
        \ 'p:protocols',
        \ 'r:records',
        \ 't:tests'
    \ ]
\ }
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
" function! Multiple_cursors_before()
"   if exists(':NeoCompleteLock')==2
"     exe 'NeoCompleteLock'
"   endif
"   if exists(':AutoSaveToggle')==2
"     exe 'AutoSaveToggle'
"   endif
" endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
" function! Multiple_cursors_after()
"   if exists(':NeoCompleteUnlock')==2
"     exe 'NeoCompleteUnlock'
"   endif
"   if exists(':AutoSaveToggle')==2
"     exe 'AutoSaveToggle'
"   endif
" endfunction
" }}}
" autoclose {{{
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'"}
let g:AutoCloseProtectedRegions = ["String", "Character"]
" }}}
" coffeescript {{{
let coffee_compile_vert = 1
" }}}
" airline {{{
set laststatus=2
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline_theme = 'distinguished'
" let g:airline_powerline_fonts = 1
" add buffer explorer with separator
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_buffers = 0
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
set showtabline=0 " remove tab bar
" shows obsession status
" let g:airline_section_b = airline#section#create(['%{ALEGetStatusLine()}', '%{ObsessionStatus(''$'','''')}', 'hunks', 'branch'])
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
" SmartGF {{{
let g:smartgf_key = 'gm'
let g:smartgf_auto_refresh_ctags = 0
" }}}
" Rails i18n {{{
vmap <Leader>8 :call I18nTranslateString()<CR>
" }}}
" }}}

" Modeline {{{
" vim:foldmethod=marker:foldlevel=0:ts=4:sw=2:tw=78
" }}}
" remap
"
