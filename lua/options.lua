local opt = vim.opt

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

opt.encoding = 'utf-8'

-- opt.runtimepath:append('~/vim')
opt.backupdir = '/tmp/vim/'
opt.directory = '/tmp/vim/'
-- Prepend mise shims to PATH
vim.env.PATH = vim.env.HOME .. '/.local/share/mise/shims:' .. vim.env.PATH

local indent = 2
opt.tabstop = indent
opt.shiftwidth = indent
opt.softtabstop = indent
opt.autoindent = true
opt.copyindent = true -- copy the previous indentation on autoindenting
opt.shiftround = true -- When shifting lines, round the indentation to the nearest multiple of “shiftwidth.”
opt.smarttab = true
opt.expandtab = true
opt.shiftround = true -- Round indent

opt.showmode = false -- Dont show mode since we have a statusline
opt.modeline = true
opt.mousehide = true
opt.mouse = 'a' -- Enable mouse mode
-- opt.nobackup = true
opt.showcmd = true -- Show us the command we're typing

opt.showmatch = true -- Show pairs
opt.mat = 5

opt.backspace = 'indent,eol,start' -- Make backspace delete lots of things
opt.completeopt = 'menu,menuone,noselect'
opt.formatoptions = 'jcroqlnt' -- tcqj
opt.grepformat = '%f:%l:%c:%m'
opt.grepprg = 'rg --vimgrep'
opt.inccommand = 'nosplit' -- preview incremental substitute
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.spelllang = { 'en_gb' }
opt.spelloptions = 'camel'

opt.laststatus = 3 -- set global status line
-- Default splitting will cause your main splits to jump when opening an edgebar.
-- To prevent this, set `splitkeep` to either `screen` or `topline`.
opt.splitkeep = 'screen'

-- Enable a nice big viminfo file
-- opt.viminfo = '1000,f1,:1000,/1000'
opt.history = 1000
opt.undolevels = 1000
opt.undofile = true

-- no more annoying startup msg
opt.shortmess = 'aI'
opt.cmdheight = 2
vim.g.bufferline_echo = 0

-- You will likely want to reduce updatetime which affects CursorHold
vim.o.updatetime = 250

opt.switchbuf = 'usetab,newtab' -- if buffer is in tab use that tab

opt.synmaxcol = 200 -- Limit syntax highlighting for long lines to improve performance
opt.redrawtime = 2000 -- Time in milliseconds for redrawing the display
opt.maxmempattern = 5000 -- Maximum amount of memory in Kbyte used for pattern matching

opt.foldenable = true
-- opt.foldmethod = 'syntax'
-- opt.foldcolumn = '1'
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.foldlevelstart = 1 -- open most folds by default

opt.number = true
-- opt.relativenumber = true
vim.wo.relativenumber = true
opt.signcolumn = 'yes:1'

-- opt.sessionoptions:append('winpos,terminal,folds') -- Autosessions recommendation
-- opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }

opt.winminheight = 1 -- 1 height windows
opt.winminwidth = 5
-- opt.popt:append('syntax:y') -- Syntax when printing

opt.linespace = 0 -- number of pixels between the lines
opt.splitright = true -- open vertical splits on the right
opt.splitbelow = true -- open the horizontal split below
opt.wrap = true -- wrap long lines
opt.linebreak = true -- break lines at word end
opt.sidescroll = 5
-- Try to show at least three lines and two columns of context when scrolling
opt.scrolloff = 8
opt.sidescrolloff = 3
-- Improve vim's scrolling speed
opt.ttyfast = true
-- opt.ttyscroll = 3

opt.cf = true -- Enable error files & error jumping.

opt.autowrite = true -- Writes on make/shell commands
opt.autoread = true -- Automatically re-read files if unmodified inside Vim.
opt.hidden = true -- Allow buffer switching without saving

-- NOTE: 0.10 defaults to OSC52 when unset
--   use "+ to accss system clipboard
opt.clipboard = 'unnamedplus' -- Yanks go on clipboard instead.

opt.visualbell = true -- don't beep
-- opt.noerrorbells = true -- don't beep

opt.incsearch = true -- live search
opt.hlsearch = true -- highlight search
opt.ignorecase = true -- Selective case insensitivity
opt.infercase = true
opt.smartcase = true -- only ignores case when minus words
opt.showfulltag = true -- Show full tags when doing search completion

opt.wildmenu = true -- show complete menu at bottom
opt.wildmode = 'longest:full,full'
opt.wildignore:append('.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif')
-- opt.suffixes:append('.in,.a')
opt.whichwrap:append('<,>,[,]') -- Wrap on these

-- clean BCE in tmux for proper colours
-- let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
-- let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
opt.termguicolors = true
opt.background = 'dark'
vim.g.enable_bold_font = 1
opt.guifont = 'JetBrains Mono Variable 14'

-- vim.cmd('highlight CursorLine guibg=#28282d')
vim.cmd('highlight link GitSignsCurrentLineBlame Comment')
vim.cmd('highlight RedundantSpaces term=standout ctermbg=red guibg=red') -- highlight Problematic whitespaces
-- vim.cmd('match RedundantSpaces /\s\+$\| \+\ze\t/') -- \ze sets end of match so only spaces highlighted
opt.list = true
if vim.fn.has('multi_byte') == 1 then
  opt.listchars = 'precedes:<,tab:⭾ ,trail:␠,extends:…,nbsp:⎵,eol:⏎'
else
  opt.listchars = 'precedes:<,tab:>-,trail:.,extends:>,nbsp:_,eol:$'
end
