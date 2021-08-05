-- Autoinstall packer
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup({ function(use)

  use 'wbthomason/packer.nvim'

  -- Function libs, move to `require`
  use 'clones/vim-genutils'
  use 'eparreno/vim-l9'
  use 'xolox/vim-misc'
  use 'tpope/vim-repeat' -- Add repeat support to other plugins

  use 'tpope/vim-sleuth' -- Try to detect correct identation

  -- Themes
  use 'fenetikm/falcon'
  use 'lighthaus-theme/vim-lighthaus'

  -- Syntax & other helpers for specific files
  -- use 'sheerun/vim-polyglot'
  use { 'amadeus/vim-mjml', ft = {'mjml'} }
  use { 'elixir-editors/vim-elixir', ft = {'elixir'} }
  use { 'dNitro/vim-pug-complete', ft = {'pug'} }
  use { 'tpope/vim-markdown', ft = {'markdown'} }
  use { 'andrewstuart/vim-kubernetes', ft = {'yaml'} }
  use { 'towolf/vim-helm', ft = {'yaml'} }
  use 'robbles/logstash.vim'
  use 'itkq/fluentd-vim'
  use 'tpope/vim-liquid'
  use {
    'norcalli/nvim-colorizer.lua',
    opt = true, ft = {'css', 'html', 'javascript', 'vim'},
    config = function() require('colorizer').setup() end
  }

  use 'andymass/vim-matchup' -- add more selectors to %
  use 'kana/vim-textobj-user'
  -- use 'gorkunov/smartpairs.vim'
  use {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup() end
  }
  use 'tpope/vim-ragtag' -- xml & firends tags helpers
  use 'rhysd/clever-f.vim' -- Extended f, F, t and T

  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup{}
    end
  }
  use {
    "terrortylor/nvim-comment",
    config = function()
      require("nvim_comment").setup{}
    end
  }
  use "lukas-reineke/indent-blankline.nvim"
  -- use 'danilamihailov/beacon.nvim'
  use {
    'edluffy/specs.nvim',
    config = function()
      require("specs").setup{
        show_jumps  = true,
        min_jump = 5
      }
    end
  } -- display flash on cursor jumps
  use 'AndrewRadev/splitjoin.vim' -- sinle/multiline format with gS gJ
  use 'henrik/vim-indexed-search' -- show index in search results: N of NN
  use 'conradIrwin/vim-bracketed-paste' -- Auto set paste
  use 'dhruvasagar/vim-zoom' -- zoom in/out <C-w>m
  use "kevinhwang91/nvim-bqf" -- Quickfix improvementss
  use 'junegunn/vim-easy-align' -- <ldr><CR> for auto align
  use 'mg979/vim-visual-multi' -- ctrl+n for multi cursor
  use 'machakann/vim-sandwich' -- manipulate surround-ings (sa/sdb/srb)

  use 'junegunn/vim-peekaboo' -- see registers
  use 'kshenoy/vim-signature' -- toggle/display/navigate makrs
  use 'sjl/gundo.vim' -- Display undo tree with <leader>u
  use 'tpope/vim-speeddating' -- increase/decrease dates with ctrl-a/x
  use 'christianrondeau/vim-base64' -- encode using b64

  use 'kassio/neoterm'
  use 'roxma/vim-tmux-clipboard'
  use 'christoomey/vim-tmux-navigator'

  use 'kyazdani42/nvim-tree.lua'
  -- use {
  --   'tamton-aquib/staline.nvim',
  --   config = function() require('staline').setup() end
  -- }
  use {
    'famiu/feline.nvim',
    config = function()
      require('feline').setup{
        preset = 'noicon'
      }
    end
  }
  -- use {
  --   'akinsho/nvim-bufferline.lua',
  --   requires = 'kyazdani42/nvim-web-devicons',
  --   config = function()
  --     require('bufferline').setup{
  --       options = {
  --         show_buffer_close_icons = false,
  --         show_close_icons = false,
  --         diagnostics = "nvim_lsp"
  --       }
  --     }
  --   end
  -- }

  -- Telescope, install: fd-find bat ripgrep
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    config = [[require('config.telescope')]]
  }

  use {
    'sudormrfbin/cheatsheet.nvim',
    requires = { {'nvim-telescope/telescope.nvim'}, {'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'},
    }
  }

  -- Git stuff
  use 'rhysd/committia.vim'
  use 'whiteinge/diffconflicts'
  use 'ruanyl/vim-gh-line'
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }

  -- Ruby stuff
  use {'vim-ruby/vim-ruby', ft = 'ruby'}
  use {'tpope/vim-rails', ft = 'ruby'}
  use {'gorkunov/smartgf.vim', ft = 'ruby'}
  use {'stefanoverna/vim-i18n', ft = 'ruby'}
  use {'rorymckinley/vim-rubyhash', ft = 'ruby'} -- convert hash keys to symbol, strings or 1.9 style with rs rt rr
  use {'danchoi/ri.vim', ft = 'ruby'}

  -- Elixir
  use { 'slashmili/alchemist.vim', ft = 'elixir' }
  use { 'c-brenn/phoenix.vim', ft = 'elixir' }

  -- HTML/CSS/JS
  use 'mattn/emmet-vim'

  -- Linters
  use { 'janko-m/vim-test', opt = true, cmd = {'TestFile', 'TestLast', 'TestNearest', 'TestSuite', 'TestVisit'} }
  -- use { "rcarriga/vim-ultest", requires = {"vim-test/vim-test"}, run = ":UpdateRemotePlugins" }
  -- use 'w0rp/ale'
  -- use { 'mfussenegger/nvim-lint' }
  use({ "jose-elias-alvarez/null-ls.nvim", requires = {"nvim-lua/plenary.nvim", "neovim/nvim-lspconfig"} })

  -- LSP
  use {
    "neovim/nvim-lspconfig",
    config = [[require('config.nvim-lspconfig')]],
  }
  use 'kabouzeid/nvim-lspinstall'
  use 'hrsh7th/nvim-compe'
  -- use 'L3MON4D3/LuaSnip'
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        mode = "lsp_document_diagnostics",
        auto_open = true,
        auto_close = true,
        auto_fold = false
      }
    end
  }
  use 'kosayoda/nvim-lightbulb'
  use 'simrat39/symbols-outline.nvim'

  -- use 'tpope/vim-obsession' -- save session :Obsess / Obsess!
  use {
    'rmagatti/auto-session',
    config = function()
      require("auto-session").setup { }
    end
  }

end,

config = {
  display = {
    open_fn = require('packer.util').float,
  }
}})

-- vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])
