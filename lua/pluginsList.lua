-- vim.cmd([[
--   let g:gitblame_enabled = 0
--   let g:gitblame_date_format = '%r'
--
--   " augroup packer_user_config
--   "   autocmd!
--   "   autocmd BufWritePost plugins.lua source <afile> | PackerCompile
--   " augroup end
-- ]])

-- Autoinstall packer
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "plugins.lua",
  command = "source <afile> | PackerCompile",
})

require('packer').init({display = {auto_clean = false}})

return require('packer').startup({ function(use)

  -- Load lua path
  local lua_path = function(name)
    return string.format("require'plugins.%s'", name)
  end

  use 'wbthomason/packer.nvim'

  -- Function libs, move to `require`
  use 'clones/vim-genutils'
  use 'eparreno/vim-l9'
  use 'xolox/vim-misc'
  use 'tpope/vim-repeat' -- Add repeat support to other plugins

  use 'tpope/vim-sleuth' -- Try to detect correct indentation

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }
  use { 'p00f/nvim-ts-rainbow' }
  -- show code path in status line
  -- use {
  --   "SmiteshP/nvim-navic",
  --   requires = "neovim/nvim-lspconfig"
  -- }
  use { "JoosepAlviste/nvim-ts-context-commentstring" }
  use { "ziontee113/syntax-tree-surfer" }

  -- Themes
  use 'fenetikm/falcon'
  use 'lighthaus-theme/vim-lighthaus'
  use 'Domeee/mosel.nvim'

  -- Syntax & other helpers for specific files

  -- Elixir
  use { 'elixir-editors/vim-elixir' }
  -- use { 'slashmili/alchemist.vim', ft = 'elixir' }
  use { 'c-brenn/phoenix.vim', ft = 'elixir' }

  use { 'amadeus/vim-mjml', ft = {'mjml'} }
  use { 'ixru/nvim-markdown' }
  use { 'andrewstuart/vim-kubernetes', ft = {'yaml'} }
  use { 'towolf/vim-helm', ft = {'yaml'} }
  use {
    'norcalli/nvim-colorizer.lua',
    opt = true, ft = {'css', 'html', 'javascript', 'vim', 'scss'},
    config = function() require('colorizer').setup() end
  }
  use { 'mvllow/modes.nvim' } -- Add colors to modes

  use 'andymass/vim-matchup' -- add more selectors to %
  use 'kana/vim-textobj-user'
  use {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup() end
  }
  use 'tpope/vim-ragtag' -- xml & friends tags helpers
  use 'ggandor/lightspeed.nvim'

  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup{}
    end
  }
  use {
    'numToStr/Comment.nvim',
    -- tag = 'v0.6',
    config = function() require('Comment').setup() end
  }
  use { "lukas-reineke/indent-blankline.nvim" }
  use 'RRethy/vim-illuminate' -- higlite word under cursor
  use 'AndrewRadev/splitjoin.vim' -- sinle/multiline format with gS gJ
  -- use 'conradIrwin/vim-bracketed-paste' -- Auto set paste
  use 'dhruvasagar/vim-zoom' -- zoom in/out <C-w>m
  use "kevinhwang91/nvim-bqf" -- Quickfix improvementss
  -- use 'junegunn/vim-easy-align' -- <ldr><CR> for auto align
  use 'Vonr/align.nvim'
  use 'mg979/vim-visual-multi' -- ctrl+n for multi cursor
  use 'machakann/vim-sandwich' -- manipulate surround-ings (sa/sdb/srb)

  -- use 'junegunn/vim-peekaboo' -- see registers
  use 'kshenoy/vim-signature' -- toggle/display/navigate marks
  -- use 'sjl/gundo.vim' -- Display undo tree with <leader>u
  use { "jiaoshijie/undotree" }
  use 'tpope/vim-speeddating' -- increase/decrease dates with ctrl-a/x
  use 'christianrondeau/vim-base64' -- encode using b64

  use { "akinsho/toggleterm.nvim" }
  use 'roxma/vim-tmux-clipboard'
  use 'christoomey/vim-tmux-navigator'

  -- use {
  --   'kyazdani42/nvim-tree.lua',
  --   requires = 'kyazdani42/nvim-web-devicons'
  -- }
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }

  use {
    'famiu/feline.nvim',
    requires = "SmiteshP/nvim-gps"
  }
  use {
    'seblj/nvim-tabline',
    config = function()
      require('tabline').setup{ close_icon = '' }
    end
  }

  -- Telescope, install: fd-find bat ripgrep
  use {
    'nvim-telescope/telescope.nvim',
    -- tag = 'nvim-0.6',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {'stevearc/dressing.nvim'} -- UI improvements
  use {'nvim-telescope/telescope-ui-select.nvim' }
  use {
    'sudormrfbin/cheatsheet.nvim',
    requires = { {'nvim-telescope/telescope.nvim'}, {'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}, }
  }

  -- Git stuff
  use 'rhysd/committia.vim'
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
  use {
    'ruifm/gitlinker.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function() require('gitlinker').setup() end
  } -- <leader>gy to copy git link
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  -- Ruby stuff
  use {'vim-ruby/vim-ruby', ft = 'ruby'}
  use {'tpope/vim-rails', ft = 'ruby'}
  use {'gorkunov/smartgf.vim', ft = 'ruby'}
  use {'stefanoverna/vim-i18n', ft = 'ruby'}
  use {'rorymckinley/vim-rubyhash', ft = 'ruby'} -- convert hash keys to symbol, strings or 1.9 style with rs rt rr
  use {'danchoi/ri.vim', ft = 'ruby'}

  -- HTML/CSS/JS
  use 'mattn/emmet-vim'

  -- Linters
  use { 'janko-m/vim-test', opt = true, cmd = {'TestFile', 'TestLast', 'TestNearest', 'TestSuite', 'TestVisit'} }

  -- LSP
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  -- use {
  --   'williamboman/nvim-lsp-installer',
  --   requires = { "neovim/nvim-lspconfig" },
  -- }
  -- use {
  --   'lukas-reineke/lsp-format.nvim',
  --   config = function()
  --     require("lsp-format").setup {}
  --   end
  -- }
  -- use({ "jose-elias-alvarez/null-ls.nvim", requires = {"nvim-lua/plenary.nvim", "neovim/nvim-lspconfig"} })
  -- use 'kabouzeid/nvim-lspinstall'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'ray-x/cmp-treesitter'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'onsails/lspkind-nvim'

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  }
  use 'kosayoda/nvim-lightbulb'
  use 'simrat39/symbols-outline.nvim'

  use { 'rmagatti/auto-session' }

  -- use 'Exafunction/codeium.vim'
end,

config = {
  display = {
    open_fn = require('packer.util').float,
  }
}})

-- vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])
