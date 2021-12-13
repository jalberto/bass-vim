vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

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

  use 'tpope/vim-sleuth' -- Try to detect correct indentation

  -- Themes
  use 'fenetikm/falcon'
  use 'lighthaus-theme/vim-lighthaus'
  use 'wuelnerdotexe/vim-enfocado'

  -- Syntax & other helpers for specific files

  -- Elixir
  use { 'elixir-editors/vim-elixir' }
  use { 'slashmili/alchemist.vim', ft = 'elixir' }
  use { 'c-brenn/phoenix.vim', ft = 'elixir' }

  -- use 'sheerun/vim-polyglot'
  use { 'amadeus/vim-mjml', ft = {'mjml'} }
  use { 'dNitro/vim-pug-complete', ft = {'pug'} }
  use { 'tpope/vim-markdown' }
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
    "terrortylor/nvim-comment",
    config = function()
      require("nvim_comment").setup{}
    end
  }
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup{
        buftype_exclude = {"terminal", "TelescopePrompt", "man", "nofile", "NvimTree"},
        filetype_exclude = {"help", "packer", "NvimTree"}
      }
    end
  }
  use {
    'edluffy/specs.nvim',
    config = function()
      require("specs").setup{
        show_jumps  = true,
        min_jump = 5
      }
    end
  } -- display flash on cursor jumps
  use 'RRethy/vim-illuminate' -- higlite word under cursor
  use 'AndrewRadev/splitjoin.vim' -- sinle/multiline format with gS gJ
  use 'conradIrwin/vim-bracketed-paste' -- Auto set paste
  use 'dhruvasagar/vim-zoom' -- zoom in/out <C-w>m
  use "kevinhwang91/nvim-bqf" -- Quickfix improvementss
  use 'junegunn/vim-easy-align' -- <ldr><CR> for auto align
  use 'mg979/vim-visual-multi' -- ctrl+n for multi cursor
  use 'machakann/vim-sandwich' -- manipulate surround-ings (sa/sdb/srb)

  -- use 'junegunn/vim-peekaboo' -- see registers
  use 'kshenoy/vim-signature' -- toggle/display/navigate marks
  use 'sjl/gundo.vim' -- Display undo tree with <leader>u
  use 'tpope/vim-speeddating' -- increase/decrease dates with ctrl-a/x
  use 'christianrondeau/vim-base64' -- encode using b64

  -- use 'kassio/neoterm'
  use {
    "akinsho/toggleterm.nvim",
    config = function ()
      require("toggleterm").setup{
        size = 10,
        open_mapping = [[<c-\>]]
      }
    end
  }
  use 'roxma/vim-tmux-clipboard'
  use 'christoomey/vim-tmux-navigator'

  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require'nvim-tree'.setup {
        auto_close = true,
        open_on_tab = true,
        filters = {
          dotfiles = false,
          custom = {'.git', 'node_modules', '.cache'}
        },
      }
    end
  }

  use {
    'famiu/feline.nvim',
    config = function()
      require('feline').setup{
        -- preset = 'noicon'
      }
    end
  }
  use {
    'seblj/nvim-tabline',
    config = function()
      require('tabline').setup{
        close_icon = ''
      }
    end
  }

  -- Telescope, install: fd-find bat ripgrep
  -- using latest commit for nvim 0.5
  use {
    'nvim-telescope/telescope.nvim',
    commit = "80cdb00",
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
  use {
    'ruifm/gitlinker.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function() require('gitlinker').setup() end
  } -- <leader>gy to copy git link
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

  -- HTML/CSS/JS
  use 'mattn/emmet-vim'

  -- Linters
  use { 'janko-m/vim-test', opt = true, cmd = {'TestFile', 'TestLast', 'TestNearest', 'TestSuite', 'TestVisit'} }

  -- LSP
  use({ "jose-elias-alvarez/null-ls.nvim", requires = {"nvim-lua/plenary.nvim", "neovim/nvim-lspconfig"} })
  use {
    "neovim/nvim-lspconfig",
    config = [[require('config.nvim-lspconfig')]],
  }
  use 'kabouzeid/nvim-lspinstall'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'onsails/lspkind-nvim'

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        position = "right",
        mode = "lsp_document_diagnostics",
        auto_open = false,
        auto_close = true,
        use_lsp_diagnostic_signs = true,
        auto_fold = false
      }
    end
  }
  use 'kosayoda/nvim-lightbulb'
  use 'simrat39/symbols-outline.nvim'

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
