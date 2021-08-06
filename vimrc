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
set shiftwidth=2 " num colums
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
set shortmess=aoOtI
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
" }}}

" Custom file types {{{
augroup filetypedetect
  autocmd BufRead,BufNewFile */templates/*.yaml,*/templates/*.tpl setf helm
  autocmd BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown
  " autocmd BufNewFile,BufRead *.json setf javascript
augroup END
" }}}

" need ot be set before plugins load
" let g:ale_disable_lsp = 1

" Plugins {{{
lua require('plugins')
" }}}

" Vundle {{{
" Helper to add conditionals for nvim
function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

call plug#begin('~/.vim/plugged')
"Plug 'bling/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'amiralies/coc-elixir', {'do': 'yarn install && yarn prepack', 'for': 'elixir'}
call plug#end()
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
" }}}

" Auto commands {{{
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

" Rails i18n
" vmap <Leader>8 :call I18nTranslateString()<CR>
" }}}

" Plugins {{{

" Align
vnoremap <silent> <Leader><Enter> :EasyAlign<Enter>

" NeoTerm
nnoremap <leader>tf :TREPLSendFile<cr>
nnoremap <leader>tl :TREPLSendLine<cr>
vnoremap <leader>t :TREPLSendSelection<cr>
nnoremap <silent> <leader>th :call neoterm#close()<cr>
nnoremap <silent> <leader>tl :call neoterm#clear()<cr>
nnoremap <silent> <leader>tc :call neoterm#kill()<cr>

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
nnoremap <leader>cf <cmd>lua vim.lsp.buf.formatting()<cr>

" Nvim LSP + compe
set completeopt=menuone,noselect
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
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
  " clean BCE in tmux for propper colours
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

if has("gui_running")
  set guifont=JetBrains\ Mono\ Variable\ 14
  colorscheme falcon
else
  colorscheme falcon
endif

" Cursorline color
highlight CursorLine ctermbg=black cterm=bold guibg=black gui=bold
" highlight CocCodeLens guifg=#57575e gui=italic

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
" }}}

" Plugins config {{{

" Plugins vim-markdown {{{
let g:markdown_fenced_languages = ['html', 'shell', 'ruby', 'vim', 'js']
" }}}

" QF {{{
" nmap ç <Plug>(qf_qf_switch)
" nmap <F5> <Plug>(qf_qf_toggle_stay)
nmap <leader>q <Plug>(qf_qf_toggle)
let g:qf_mapping_ack_style = 1
" }}}

" nvimtree {{{
let g:nvim_tree_auto_close = 1
let g:nvim_tree_git_hl = 1
let g:nvim_tree_highlight_opened_files = 1
" }}}

" emmet {{{
let g:user_emmet_install_global=0
autocmd FileType html,css,liquid,eelixir EmmetInstall
let g:user_emmet_leader_key=','
" }}}

" COC {{{
" let g:coc_global_extensions=[
"             \'coc-solargraph',
"             \'coc-elixir',
"             \'coc-json',
"             \'coc-css',
"             \'coc-html',
"             \'coc-yaml',
"             \'coc-xml',
"             \'coc-syntax',
"             \'coc-emmet',
"             \'coc-tsserver',
"             \'coc-snippets',
"             \'coc-spell-checker',
"             \'coc-pairs',
"             \'coc-actions',
"             \'coc-vetur',
"             \'coc-markdownlint'
"             \]
"
" set updatetime=300
"
" " Use tab for trigger completion with characters ahead and navigate.
" " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
" " Navigate snippet placeholders using tab
" let g:coc_snippet_next='<Tab>'
" let g:coc_snippet_prev='<S-Tab>'
"
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
"
" " Use enter to accept snippet expansion
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"
"
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
"
" autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
"
" " help LS to find root dir
" autocmd FileType elixir let b:coc_root_patterns = ['mix.exs']
"
" " Use `[g` and `]g` to navigate diagnostics
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)
"
" " Remap keys for gotos
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
"
" " Apply AutoFix to problem on the current line
" nmap <leader>qf  <Plug>(coc-fix-current)
"
" " Use K to show documentation in preview window
" nnoremap <silent> K :call <SID>show_documentation()<CR>
"
" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction
"
" " Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')
"
" " Remap for rename current word
" nmap <leader>rn <Plug>(coc-rename)
"
" " Use `:Format` to format current buffer
" command! -nargs=0 Format :call CocAction('format')
"
" " Use `:Fold` to fold current buffer
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)
"
" " Remap for do codeAction of selected region
" function! s:cocActionsOpenFromSelected(type) abort
"   execute 'CocCommand actions.open ' . a:type
" endfunction
" xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
" nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
" }}}

" clever-f {{{
let g:clever_f_smart_case=1
" }}}

" fzf {{{

" this is in zshrc
" if executable('fd')
"   let $FZF_DEFAULT_COMMAND = 'fd --type f --hidden --follow --exclude "**/{.git,node_modules,vendor,deps,_build,tmp}/*"'
" endif

" if executable('rg')
"   set grepprg=rg\ --vimgrep
" "
"   " :Rg  - Start fzf with hidden preview window that can be enabled with "?" key
"   command! -bang -nargs=* Rg
"     \ call fzf#vim#grep(
"     \   'rg --column --line-number --no-heading --color=always --fixed-strings --smart-case --hidden --follow --glob "!**/{.git,node_modules,vendor,deps,_build,tmp,.hex,.elixir_ls,.npm,.mix}/*" '.shellescape(<q-args>), 1,
"     \   <bang>0 ? fzf#vim#with_preview('down:40%')
"     \           : fzf#vim#with_preview('down:40%:hidden', '?'),
"     \   <bang>0)
"
"   " :RG reset ripgrep each time to re-search
"   function! RipgrepFzf(query, fullscreen)
"     let command_fmt = 'rg --column --line-number --no-heading --color=always --fixed-strings --smart-case --hidden --follow --glob "!**/{.git,node_modules,vendor,deps,_build,tmp,.hex,.elixir_ls,.npm,.mix}/*" -- %s || true'
"     let initial_command = printf(command_fmt, shellescape(a:query))
"     let reload_command = printf(command_fmt, '{q}')
"     let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
"     call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
"   endfunction
"
"   command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
" endif
"
" " Files command with preview window
" command! -bang -nargs=? -complete=dir Files
"   \ call fzf#vim#files(<q-args>,
"   \   <bang>0 ? fzf#vim#with_preview('down:40%')
"   \           : fzf#vim#with_preview('down:40%:hidden', '?'),
"   \   <bang>0)
"
" let $FZF_DEFAULT_OPTS="--reverse" " top to bottom
"
" let g:fzf_buffers_jump = 1 " jump to the existing window if possible
" }}}

" vista {{{
" let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
" let g:vista_icon_indent = ["▸ ", ""]
" let g:vista_icon_indent = ["A ", "B "]
" let g:vista_fold_toggle_icons = ["C ", "D "]
" let g:vista#renderer#enable_icon = 0
" let g:vista_default_executive = 'coc'
" let g:vista_echo_cursor_strategy = 'floating_win'
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
" nmap <silent> <leader>pl <Plug>(ale_previous_wrap)
" nmap <silent> <leader>nl <Plug>(ale_next_wrap)
" let g:ale_lint_on_save = 1
" let g:ale_fix_on_save = 1
" let g:ale_lint_on_text_changed = 0
" let g:ale_lint_on_enter = 1
" let g:ale_lint_on_insert_leave = 1
" let g:ale_sign_column_always = 1
" let g:ale_sign_error = '☢'
" let g:ale_sign_warning = '⚠'
" let g:airline#extensions#ale#enabled = 1
" " let g:ale_set_loclist = 0
" " let g:ale_set_quickfix = 1
" let g:ale_open_list = 1
" let g:ale_list_window_size = 5
" " let g:ale_echo_msg_format = '[%severity%][%linter%] %code%'
"
" let g:ale_fixers = {
" \   '*': ['remove_trailing_lines', 'trim_whitespace'],
" \   'elixir': ['mix_format'],
" \   'ruby': ['rubocop'],
" \   'css' : ['prettier'],
" \   'html' : ['prettier'],
" \   'markdown' : ['prettier'],
" \   'yaml': ['prettier'],
" \   'json': ['prettier', 'eslint'],
" \   'javascript': ['prettier', 'eslint'],
" \}
" au FileType elixir let b:ale_fix_on_save = 1
" }}}

" Tests {{{
" let test#strategy = "neoterm"
nmap <silent> <leader>T :TestNearest<CR>
nmap <silent> <leader>Tf :TestFile<CR>
nmap <silent> <leader>Ta :TestSuite<CR>
nmap <silent> <leader>Tl :TestLast<CR>
nmap <silent> <leader>Tg :TestVisit<CR>
" }}}

" NerdTree {{{
" let g:NERDTreeAutoDeleteBuffer = 1
" let g:NERDTreeShowBookmarks = 1
" let g:NERDTreeCascadeOpenSingleChildDir = 1

" Exit Vim if NERDTree is the only window left.
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    " \ quit | endif
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
let g:gundo_prefer_python3 = 1
" }}}

" fugitive {{{
" delete hidden fugitive buffers
" autocmd BufReadPost fugitive://* set bufhidden=delete
" }}}

" vim-gh-line {{{
" let g:gh_gitlab_domain = "gitlab.com"
let g:gh_open_command = 'fn() { echo "$@" | wl-copy; }; fn '
let g:gh_line_map_default = 0
let g:gh_line_map = '<leader>gh'
" }}}

" :TOhtml {{{
let html_number_lines=1
let html_use_css=1
let use_xhtml=1
" }}}

" airline {{{
"set laststatus=2
"let g:airline#extensions#branch#enabled = 1
"let g:airline#extensions#hunks#non_zero_only = 1
"let g:airline#extensions#tabline#show_close_button = 0
"let g:airline_theme = 'falconcus'
"let g:airline_powerline_fonts = 1
"" add buffer explorer with separator
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#show_splits = 0
"let g:airline#extensions#tabline#show_buffers = 0
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline#extensions#nvimlsp#enabled = 0
"" let g:airline_symbols_ascii = 1
"set showtabline=0 " remove tab bar
" }}}

" SmartGF {{{
let g:smartgf_key = 'gm'
let g:smartgf_auto_refresh_ctags = 0
" }}}
" }}}

lua require('config')
