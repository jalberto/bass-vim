" BaSS vimrc's 2015
" vim: fdm=marker fdl=0

" General {{{
filetype on

scriptencoding utf-8
set encoding=utf-8

" Set paths
if has('nvim')
  set runtimepath^=~/.vim runtimepath+=~/.vim/after
  let &packpath=&runtimepath
endif
set backupdir=/tmp//
set directory=/tmp//

set autoindent
filetype plugin indent on
set copyindent " copy the previous indentation on autoindenting
set shiftround " When shifting lines, round the indentation to the nearest multiple of “shiftwidth.”

set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2 " num columns
set expandtab    " use spaces

if !has('nvim')
  set antialias
endif
set modeline
set mousehide
set nobackup
set showcmd " Show us the command we're typing

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
set shortmess=aI
set cmdheight=2
let g:bufferline_echo=0

" if buffer is in tab use that tab
set switchbuf=usetab,newtab
"
" Syntax coloring lines that are too long just slows down the world
set synmaxcol=1000

if has("folding")
  set foldenable
  set foldmethod=syntax
  set foldlevelstart=1   " open most folds by default
endif

set number relativenumber

" Auto-sessiosn recommendations
" set sessionoptions+=options,resize,winpos,terminal
" set sessionoptions+=resize,winpos,terminal
" }}}

" Custom file types {{{
augroup filetypedetect
  autocmd BufRead,BufNewFile */templates/*.yaml,*/templates/*.tpl setf helm
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown
  " autocmd BufNewFile,BufRead *.json setf javascript
augroup END
" }}}

" Plugins {{{
lua require('plugins')
" }}}

" Functions {{{
" switch between horizontal and vertical split mode for open splits {{{
function! Rotate()
    " save the original position, jump to the first window
    let initial = winnr()
    exe 1 . "wincmd w"

    wincmd l
    if winnr() != 1
        " succeeded moving to the right window
        wincmd J                " make it the bot window
    else
        " cannot move to the right, so we are at the top
        wincmd H                " make it the left window
    endif

    " restore cursor to the initial window
    exe initial . "wincmd w"
endfunction
" }}}

" Append modeline after last line in buffer (<leader>ml) {{{
function! AppendModeline()
  let save_cursor = getpos('.')
  let append = ' vim: set ts='.&tabstop.' sw='.&shiftwidth.' tw='.&textwidth.' fdm='.&foldmethod.':'
  $put = substitute(&commentstring,\"%s\",append,\"\")
  call setpos('.', save_cursor)
endfunction
" }}}

" Creare/read scratch file {{{
augroup autowritescratchfile
  autocmd!

  autocmd BufRead,BufNewFile Scratch.vim setf markdown
  autocmd CursorHold,CursorHoldI Scratch.vim update

  " let ml = ' vim: set ft=markdown'
  " autocmd BufNewFile Scratch.vim $put = substitute(&commentstring,\"%s\",ml,\"\") | startinsert | norm ggO
augroup END

function! ReadScratchFile()
  topleft 10split +startinsert Scratch.vim
endfunction
" }}}

" Get visual selection (used in fzf)
" function! s:getVisualSelection()
"   let [line_start, column_start] = getpos("'<")[1:2]
"   let [line_end, column_end] = getpos("'>")[1:2]
"   let lines = getline(line_start, line_end)
" 
"   if len(lines) == 0
"       return ""
"   endif
" 
"   let lines[-1] = lines[-1][:column_end - (&selection == "inclusive" ? 1 : 2)]
"   let lines[0] = lines[0][column_start - 1:]
" 
"   return join(lines, "\n")
" endfunction
" }}}

" when numbering is on, toggle relative to active buffer {{{
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END
" }}}

" Auto highlite current panel {{{
augroup ActiveHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END
" }}}

" Auto add shebang {{{
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
" }}}

" Auto reload vimrc
au BufWritePost .vimrc so $MYVIMRC
" }}}

" Keyboard shortcuts {{{
" Leader {{{
let mapleader = " "

" map <Leader>cl :set cursorline!<CR>
map <Leader>cL :set cursorcolumn!<CR>

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

" Copy paste to clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

nnoremap <leader>r :call Rotate()<CR>

nnoremap <silent> <leader>x :NvimTreeToggle<CR>

" Plugins {{{

" Illuminate
let g:Illuminate_delay = 1250
let g:Illuminate_ftblacklist = ['help', 'packer', 'NvimTree']
hi link illuminatedWord Visual

" Align
vnoremap <silent> <Leader><Enter> :EasyAlign<Enter>

" if has_key(plugs, 'fzf.vim')
" nnoremap <silent><Leader>f :Files<CR>
" nnoremap <silent><Leader>o :Files<CR>
" nnoremap <silent><Leader>l :BLines<CR>
" nnoremap <silent><Leader>t :BTags<CR>
" nnoremap <silent><Leader>tt :Tags<CR>
" nnoremap <silent><Leader>? :History<CR>
" nnoremap <silent><Leader><space> :Buffers<CR>
" nnoremap <silent><Leader>w :Windows<CR>
" nnoremap <silent><Leader>s :Rg
" nnoremap <silent><leader>W :Rg! <C-R><C-W><CR>
" vnoremap <silent><leader>W <Esc>:Rg! <C-R>=<SID>getVisualSelection()<CR><CR>
"
" nnoremap <silent> <leader>ol :<C-u>CocFzfList outline<CR>
" nnoremap <silent> <leader>cd :<C-u>CocFzfList diagnostics --current<CR>
" nnoremap <silent> <leader>cc :<C-u>CocFzfList commands<CR>
" nnoremap <silent> <leader>cs :<C-u>CocFzfList symbols<CR>
" nnoremap <silent> <leader>cl :<C-u>CocFzfList location<CR>
" endif

" Telescope
nnoremap <leader><leader> <cmd>Telescope find_files theme=get_dropdown<cr>
nnoremap <leader>ff <cmd>Telescope git_files theme=get_dropdown<cr>
nnoremap <leader>fg <cmd>Telescope live_grep theme=get_dropdown<cr>
nnoremap <leader>fb <cmd>Telescope buffers theme=get_dropdown<cr>
nnoremap <leader>fh <cmd>Telescope help_tags theme=get_dropdown<cr>
nnoremap <leader>fm <cmd>Telescope marks theme=get_dropdown<cr>
nnoremap <leader>fr <cmd>Telescope registers theme=get_dropdown<cr>
nnoremap <leader>fc <cmd>Telescope commands theme=get_dropdown<cr>
nnoremap <leader>ca <cmd>Telescope lsp_code_actions theme=get_dropdown<cr>
nnoremap <leader>cr <cmd>Telescope lsp_references theme=get_dropdown<cr>
nnoremap <leader>cs <cmd>Telescope lsp_document_symbols theme=get_dropdown<cr>

 " LSP
" nnoremap <leader>cf <cmd>lua vim.lsp.buf.formatting()<cr>
" nnoremap <leader>ct <cmd>TroubleToggle<cr>

" Nvim LSP + compe
" set completeopt=menuone,noselect
" inoremap <silent><expr> <C-Space> compe#complete()
" inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" Fugitive
" cnoreabbrev Gws Gstatus
" cnoreabbrev Gca Gcommit -a
" }}}

" move in buffers and tabs
nmap <C-RIGHT> :tabnext<cr>
nmap <C-LEFT>  :tabprevious<cr>
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
nmap  :aw       :wa
nmap  :qw       :wq
nnoremap ; :

" write with sudo
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

imap <C-t> <esc>:tabnew<cr> a
map  <C-t> :tabnew<cr> i

nmap <tab><tab> <C-w>w

" Visually select the text that was last edited/pasted
nnoremap gV `[v`]
" select what you've just pasted
nnoremap gp `[v`]
" nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'
" reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Keep search matches in the middle of the screen
nnoremap n nzz
nnoremap N Nzz

nnoremap gs :call ReadScratchFile()<CR>

" resize panels
noremap <A-up>    <C-W>+
noremap <A-down>  <C-W>-
noremap <A-left>  3<C-W><
noremap <A-right> 3<C-W>>
" }}}

" Misc {{{
set lazyredraw     " Speed up macros
set winminheight=1 " 1 height windows
set popt+=syntax:y " Syntax when printing

set linespace=0 " number of pixels between the lines
set splitright  " open vertical splits on the right
set splitbelow  " open the horizontal split below
set wrap        " wrap long lines
set linebreak   " break lines at word end
set sidescroll=5

" Try to show at least three lines and two columns of context when scrolling
set scrolloff=99
set sidescrolloff=3

" Improve vim's scrolling speed
set ttyfast
if !has('nvim')
  set ttyscroll=3
endif

set cf        " Enable error files & error jumping.

set autoread " Automatically re-read files if unmodified inside Vim.
set autowrite " Writes on make/shell commands

set clipboard+=unnamedplus " Yanks go on clipboard instead.

set visualbell   " don't beep
set noerrorbells " don't beep

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
" }}}
" }}}

" Fonts, Colors, Theming {{{
" Terminal true colour support
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif
" if exists('$TMUX')
"   let &t_8f = "<Esc>[38;2;%lu;%lu;%lum"
"   let &t_8b = "<Esc>[48;2;%lu;%lu;%lum"
" endif
if has("nvim") || has("termguicolors")
  " clean BCE in tmux for proper colours
  " set t_ut=
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set background=dark
let g:enable_bold_font=1

let g:falcon_background=0
let g:falcon_inactive=0

let g:equinusocio_material_style='pure'
" let g:equinusocio_material_less=50

colorscheme falcon
if has("gui_running")
  set guifont=JetBrains\ Mono\ Variable\ 14
endif

" Cursorline color
highlight CursorLine guibg=#28282d

" HL on yanks
au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=150, on_visual=true}

" Special chars {{{
" highlight Problematic whitespaces
highlight RedundantSpaces term=standout ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t/ "\ze sets end of match so only spaces highlighted
" Show tabs and trailing whitespace visually
if has("multi_byte")
  set list listchars=precedes:<,tab:⭾\ ,trail:␠,extends:…,nbsp:⎵,eol:⏎
else
  set list listchars=precedes:<,tab:>-,trail:.,extends:>,nbsp:_,eol:$
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

set signcolumn=yes:1
" }}}

" Plugins config {{{

" Plugins vim-markdown {{{
let g:markdown_fenced_languages = ['html', 'shell', 'ruby', 'vim', 'js', 'elixir']
" }}}

" QF {{{
" nmap ç <Plug>(qf_qf_switch)
" nmap <F5> <Plug>(qf_qf_toggle_stay)
" nmap <leader>q <Plug>(qf_qf_toggle)
" let g:qf_mapping_ack_style = 1
" }}}

" nvimtree {{{
let g:nvim_tree_git_hl = 1
let g:nvim_tree_quit_on_open = 1
let g:nvim_tree_highlight_opened_files = 1
" }}}

" emmet {{{
let g:user_emmet_install_global=0
autocmd FileType html,css,liquid,eelixir EmmetInstall
let g:user_emmet_leader_key=','
" }}}

" clever-f {{{
let g:clever_f_smart_case=1
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

" Tests {{{
nmap <silent> <leader>T :TestNearest<CR>
nmap <silent> <leader>Tf :TestFile<CR>
nmap <silent> <leader>Ta :TestSuite<CR>
nmap <silent> <leader>Tl :TestLast<CR>
nmap <silent> <leader>Tg :TestVisit<CR>
" }}}

" slime & NeoTerm {{{
if has('nvim')
  " special ESC behaviour
  " au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
  " au FileType fzf tunmap <buffer> <Esc>
  " tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"

  " tnoremap <Esc> <C-\><C-n>
  tnoremap <A-h> <C-\><C-n><C-w>h
  tnoremap <A-j> <C-\><C-n><C-w>j
  tnoremap <A-k> <C-\><C-n><C-w>k
  tnoremap <A-l> <C-\><C-n><C-w>l

  nnoremap <silent> ¬ :ToggleTerm<cr>
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
let g:gundo_prefer_python3 = 1
" }}}

" :TOhtml {{{
let html_number_lines=1
let html_use_css=1
let use_xhtml=1
" }}}

" SmartGF {{{
let g:smartgf_key = 'gm'
let g:smartgf_auto_refresh_ctags = 0
" }}}
" }}}

lua require('config')
