" BaSS vimrc's 2015

" General {{{
set nocompatible
filetype on

if has('nvim')
  set runtimepath^=~/.vim runtimepath+=~/.vim/after
  let &packpath = &runtimepath
endif

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

" Enable a nice big viminfo file
set viminfo='1000,f1,:1000,/1000
set history=500
set undolevels=500

" Make backspace delete lots of things
set backspace=indent,eol,start

" no more annoying startup msg
set shortmess=aoOtI
set cmdheight=2
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
" au FileType {make,gitconfig} set noexpandtab sw=4

" Make Python follow PEP8
au FileType python set foldmethod=indent
au FileType python set sts=4 ts=4 sw=4 tw=79

" Make sure all markdown files have the correct filetype
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown
" MultiMarkdown requires 4-space tabs
au FileType markdown set sts=4 ts=4 sw=4
let g:markdown_fenced_languages = ['css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'sql', 'elixir']

autocmd Filetype gitcommit setlocal spell textwidth=72
" "}}}

" if buffer is in tab use that tab
set switchbuf=usetab,newtab

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=1200
" }}}

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
" Add repeat support to other plugins
Plug 'tpope/vim-repeat'
" Try to detect correct identation
Plug 'tpope/vim-sleuth'

Plug 'sheerun/vim-polyglot'
Plug 'robbles/logstash.vim'
Plug 'itkq/fluentd-vim'
Plug 'dNitro/vim-pug-complete', {'for': 'pug'}
Plug 'tpope/vim-markdown', {'for': 'markdown'}
Plug 'andrewstuart/vim-kubernetes', {'for': 'yaml'}
Plug 'towolf/vim-helm', {'for': 'yaml'}
" Json completion with schemas (:Vison)
Plug 'Quramy/vison', {'for': 'json'}
" Plug 'mustache/vim-mustache-handlebars'
Plug 'w0rp/ale' " async lint

" spli/join blocks with gS gJ
Plug 'AndrewRadev/splitjoin.vim'

" show index in search results: N of NN
Plug 'henrik/vim-indexed-search'
" search occurences in visual selection
Plug 'nelstrom/vim-visual-star-search'

" Auto set paste
Plug 'conradIrwin/vim-bracketed-paste'
" open file:line_number
Plug 'bogado/file-line'

" Colors / Themes
Plug 'chriskempson/base16-vim'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'fenetikm/falcon'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" show vertical guides with <leader>ig
Plug 'nathanaelkane/vim-indent-guides', { 'on': 'IndentGuidesToggle' }

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeTabsToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on':  'NERDTreeTabsToggle' }
Plug 'jistr/vim-nerdtree-tabs', { 'on': 'NERDTreeTabsToggle' }
Plug 'qpkorr/vim-renamer'
" overlay windows with - (dash)
Plug 't9md/vim-choosewin'
" zoom in/out <C-w>m
Plug 'dhruvasagar/vim-zoom'

" save session :Obsess / Obsess!
Plug 'tpope/vim-obsession'

" <ldr><CR> for auto align
Plug 'junegunn/vim-easy-align'
" ctrl+n for multi cursor
Plug 'terryma/vim-multiple-cursors'

" Plug 'tpope/vim-endwise'
" add more selectors to %
Plug 'vim-scripts/matchit.zip'
" autoclose (,{,...
" Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'kana/vim-textobj-user'
Plug 'gorkunov/smartpairs.vim'
Plug 'tpope/vim-ragtag'
" Underline word under cursor
Plug 'itchyny/vim-cursorword'

" Plug 'ervandew/supertab'
" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tomtom/tcomment_vim'
" Plug 'liuchengxu/vista.vim'
" Plug 'majutsushi/tagbar'
" Plug 't9md/vim-smalls'

" Send to terminal
Plug 'jpalardy/vim-slime', Cond(!has('nvim'))
Plug 'kassio/neoterm', Cond(has('nvim'))
Plug 'roxma/vim-tmux-clipboard', Cond(has('nvim'))
Plug 'christoomey/vim-tmux-navigator'

" auto generate tags async
Plug 'ludovicchabant/vim-gutentags'
Plug 'rhysd/clever-f.vim'
Plug 'kshenoy/vim-signature'

Plug 'sjl/gundo.vim' " Display undo tree with <leader>u
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
" highlight newst git change
Plug 'joeytwiddle/git_shade.vim', { 'on': 'GitShade' }
Plug 'gregsexton/gitv', { 'on': 'Gitv' }
" git config --global core.editor "$(which nvim)"
Plug 'rhysd/committia.vim'
Plug 'whiteinge/diffconflicts'
Plug 'ruanyl/vim-gh-line'
Plug 'rhysd/git-messenger.vim'

" encode using b64
Plug 'christianrondeau/vim-base64'
" increase/decrease dates with ctrl-a/x
Plug 'tpope/vim-speeddating'
" skip half each time with s or to center with gs
Plug 'jayflo/vim-skip'

" Ruby
Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}
" Ruby objs select: ar/ir
" Plug 'nelstrom/vim-textobj-rubyblock', {'for': 'ruby'}
" Plug 'tpope/vim-rake', {'for': 'ruby'}
" Plug 'tpope/vim-bundler', {'for': 'ruby'}
Plug 'vim-scripts/ruby-matchit', {'for': 'ruby'}
Plug 'tpope/vim-rails', {'for': 'ruby'}
Plug 'gorkunov/smartgf.vim', {'for': 'ruby'}
Plug 'stefanoverna/vim-i18n', {'for': 'ruby'}
" convert hash keys to symbol, strings or 1.9 style with rs rt rr
Plug 'rorymckinley/vim-rubyhash', {'for': 'ruby'}
Plug 'danchoi/ri.vim', {'for': 'ruby'}

" Elixir
Plug 'slashmili/alchemist.vim', {'for': 'elixir'}
Plug 'c-brenn/phoenix.vim', {'for': 'elixir'}

" HTML/CSS/JS
Plug 'mattn/emmet-vim'

Plug 'tpope/vim-projectionist' " required for some navigation features
Plug 'janko-m/vim-test'
Plug 'vimwiki/vimwiki', {'branch': 'dev'}

" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Pomodoro
" Plug 'l04m33/vim-skuld'

" Display lead mapping with <lead>fml
" Plug 'ktonga/vim-follow-my-lead'

call plug#end()
" }}}

" Keyboard shortcuts{{{

" Leader {{{
let mapleader = " "


" Align
vnoremap <silent> <Leader><Enter> :EasyAlign<Enter>

" Rails i18n
vmap <Leader>8 :call I18nTranslateString()<CR>

map <Leader>cl :set cursorline!<CR>
map <Leader>cc :set cursorcolumn!<CR>

nmap <Leader>ct :TagbarToggle<cr>

" Delete blank lines
nmap <Leader>dbl :g/^$/d<CR>:nohls<CR>
" Delete trailing spaces
nmap <Leader>dts :%s/\s\+$//e<CR>

" base64
vmap <Leader>d64 <leader>atob
vmap <Leader>e64 <leader>btoa

" Select everything
nmap <Leader>gg ggVG

map <leader>h :40vsplit ~/.vim/tips.md<CR>

" json beautifier
nnoremap <Leader>j :%!jq '.'<CR>

nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

map <silent> <leader>n :set number! relativenumber!<CR>

" NeoTerm
nnoremap <leader>tf :TREPLSendFile<cr>
nnoremap <leader>tl :TREPLSendLine<cr>
vnoremap <leader>t :TREPLSendSelection<cr>
nnoremap <silent> <leader>th :call neoterm#close()<cr>
nnoremap <silent> <leader>tl :call neoterm#clear()<cr>
nnoremap <silent> <leader>tc :call neoterm#kill()<cr>

map <silent> <leader>x :NERDTreeTabsToggle<CR>

" Copy paste to clipboard
" vnoremap <C-c> "+y
" noremap <T-v> "+gP
" imap <T-v> "+gP
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" FZF
nnoremap <silent><Leader>f :Files<CR>
nnoremap <silent><Leader>o :Files<CR>
nnoremap <silent><Leader>l :BLines<CR>
nnoremap <silent><Leader>t :BTags<CR>
nnoremap <silent><Leader>tt :Tags<CR>
nnoremap <silent><Leader>? :History<CR>
nnoremap <silent><Leader><space> :Buffers<CR>
nnoremap <silent><Leader>a :Windows<CR>
nnoremap <silent><Leader>s :Rg
nnoremap <silent><leader>W :Rg! <C-R><C-W><CR>
vnoremap <silent><leader>W <Esc>:Rg! <C-R>=<SID>getVisualSelection()<CR><CR>
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

nmap <tab><tab> <C-w>w

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
set scrolloff=99
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

" {{{ Linenumbering stuff
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END
" }}}

" {{{ Highlight current line and col
" hi CursorLine cterm=NONE gui=NONE guibg=black ctermbg=232
" hi CursorLineNr cterm=NONE gui=NONE guifg=orange guibg=black ctermbg=black
" hi CursorColumn cterm=NONE gui=NONE guibg=black ctermbg=232
" augroup CursorLine
"   au!
"   au VimEnter,WinEnter,BufWinEnter * setlocal cursorline cursorcolumn
"   au InsertEnter * setlocal cursorline nocursorcolumn
"   au InsertLeave * setlocal cursorline cursorcolumn
"   au WinLeave,BufLeave * setlocal nocursorline nocursorcolumn
" augroup END
" }}]

" Special chars {{{
" highlight Problematic whitespaces
highlight RedundantSpaces term=standout ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t/ "\ze sets end of match so only spaces highlighted
" Show tabs and trailing whitespace visually
if (&termencoding == "utf-8")
  set list listchars=tab:⭾\ ,trail:␠,extends:…,nbsp:⎵,eol:⏎
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

" {{{ Cursor
highlight Cursor guifg=black guibg=steelblue
highlight iCursor guifg=white guibg=Orange
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10
" }}}

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
au BufWritePost .vimrc so $MYVIMRC

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
" }}}

" Snippets {{{

" ultisnips directory
"let g:UltiSnipsSnippetDirectories=["UltiSnips"]
" let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Append modeline after last line in buffer (<leader>ml).
function! AppendModeline()
  let save_cursor = getpos('.')
  let append = ' vim: set ts='.&tabstop.' sw='.&shiftwidth.' tw='.&textwidth.' fdm='.&foldmethod.':'
  $put =substitute(&commentstring,\"%s\",append,\"\")
  call setpos('.', save_cursor)
endfunction
" }}}

" Ruby - Rails {{{
" Insert Mode as bpry<space>
iabbr bpry require'pry';binding.pry
iabbr froz # frozen_string_literal: true

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

" emmet {{{
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

let g:user_emmet_leader_key=','
" }}}

" COC {{{
let g:coc_global_extensions = [
            \'coc-solargraph',
            \'coc-elixir',
            \'coc-json',
            \'coc-css',
            \'coc-html',
            \'coc-yaml',
            \'coc-xml',
            \'coc-syntax',
            \'coc-emmet',
            \'coc-tsserver',
            \'coc-snippets',
            \]

set updatetime=300

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Navigate snippet placeholders using tab
let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use enter to accept snippet expansion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" }}}

" clever-f {{{
let g:clever_f_smart_case = 1
" }}}

" Guten tag {{{
let g:gutentags_ctags_exclude = ["node_modules", "assets", "_build", "build", "vendor", "private", "priv", "logs", ".git"]
let g:gutentags_cache_dir = "/tmp"
" }}}

" fzf {{{
" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --no-ignore --hidden --follow --smart-case --glob "!**/{.git,node_modules,vendor,priv,deps,_build,tmp}/*"'
  set grepprg=rg\ --vimgrep

"   :Rg  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Rg! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --fixed-strings --smart-case --hidden --follow --glob "!**/{.git,node_modules,vendor,priv,deps,_build,tmp}/*" '.shellescape(<q-args>), 1,
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
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'elixir': ['mix_format'],
\   'ruby': ['rufo'],
\   'css' : ['prettier'],
\   'html' : ['prettier'],
\   'markdown' : ['prettier'],
\   'yaml': ['prettier'],
\   'json': ['prettier'],
\}
au FileType elixir let b:ale_fix_on_save = 1
" }}}

" Visual Drag (move selected chunk) {{{
" vmap  <expr>  <LEFT> DVB_Drag('left')
" vmap  <expr>  <RIGHT> DVB_Drag('right')
" vmap  <expr>  <DOWN> DVB_Drag('down')
" vmap  <expr>  <UP> DVB_Drag('up')
" vmap  <expr>  D       DVB_Duplicate()
" Remove any introduced trailing whitespace after moving...
let g:DVB_TrimWS = 1
" }}}

" Tests {{{
nmap <silent> <leader>T :TestNearest<CR>
nmap <silent> <leader>Tf :TestFile<CR>
nmap <silent> <leader>Ta :TestSuite<CR>
nmap <silent> <leader>Tl :TestLast<CR>
nmap <silent> <leader>Tg :TestVisit<CR>
" }}}

" NerdTree {{{
let g:NERDTreeAutoDeleteBuffer = 1
" let g:NERDTreeShowBookmarks = 1
let g:NERDTreeCascadeOpenSingleChildDir = 1
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

" vim-gh-line {{{
let g:gh_gitlab_domain = "gl.vizlegal.io"
" let g:gh_open_command = 'xdg-open '
let g:gh_open_command = 'fn() { echo "$@" | xclip -selection clipboard; }; fn '
" }}}

" tagBar {{{
" let g:tagbar_width = 30
" let g:tagbar_autofocus = 1
" let g:tagbar_compact = 1
" let g:tagbar_type_elixir = {
"     \ 'ctagstype' : 'elixir',
"     \ 'kinds' : [
"         \ 'f:functions',
"         \ 'functions:functions',
"         \ 'c:callbacks',
"         \ 'd:delegates',
"         \ 'e:exceptions',
"         \ 'i:implementations',
"         \ 'a:macros',
"         \ 'o:operators',
"         \ 'm:modules',
"         \ 'p:protocols',
"         \ 'r:records',
"         \ 't:tests'
"     \ ]
" \ }
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
" }}}
