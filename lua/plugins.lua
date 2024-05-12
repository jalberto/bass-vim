return {

  {
    'fenetikm/falcon',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme falcon]])
      vim.g.falcon_background = 1
      vim.g.falcon_inactive = 1
    end
  },

  -- session management
  {
    'echasnovski/mini.sessions', version = false,
    lazy = false,
  --   opts = {
  --     autoread = false,
  --   },
    config = true,
    -- config = function(_, opts)
    --   require("mini.sessions").setup(opts)
    -- end,
  },
  -- {
  --   "olimorris/persisted.nvim",
  --   lazy = false,
  --   opts = {
  --     autoload = true,
  --     allowed_dirs ={'~/Projects'},
  --   },
  --   config = function (_, opts)
  --     vim.o.sessionoptions = "buffers,curdir,folds,winpos,winsize"
  --     require('persisted').setup(opts)
  --
  --     local group = vim.api.nvim_create_augroup("PersistedHooks", {})
  --
  --     -- vim.api.nvim_create_autocmd({ "User" }, {
  --     --   pattern = "PersistedSavePre",
  --     --   group = group,
  --     --   callback = function()
  --     --     pcall(vim.cmd, "Neotree close")
  --     --     pcall(vim.cmd, "BDelete! hidden")
  --     --   end,
  --     -- })
  --   end
  -- },

  -- suto toggle relative line number
  { "cpea2506/relative-toggle.nvim", event = "VeryLazy" },

  -- library used by other plugins
  { "nvim-lua/plenary.nvim", lazy = true },

  -- makes some plugins dot-repeatable like leap
  { "tpope/vim-repeat", event = "VeryLazy" },

  'clones/vim-genutils',
  'eparreno/vim-l9',
  'xolox/vim-misc',
  'tpope/vim-sleuth', -- Try to detect correct indentation

  { 'ixru/nvim-markdown', ft = 'markdown' },
  { 'amadeus/vim-mjml', ft = {'mjml'} },
  { 'andrewstuart/vim-kubernetes', ft = {'yaml'} },
  { 'towolf/vim-helm', ft = {'yaml'} },
  {
    'norcalli/nvim-colorizer.lua',
    ft = {'css', 'html', 'javascript', 'vim', 'scss'},
    config = true
  },
  { 'tpope/vim-ragtag', ft = 'xml,html'}, -- xml & friends tags helpers

  {"kevinhwang91/nvim-bqf", ft = 'qf'}, -- Quickfix improvementss

  'Vonr/align.nvim',
  'mg979/vim-visual-multi', -- ctrl+n for multi cursor

  { "jiaoshijie/undotree" },
  'christianrondeau/vim-base64', -- encode using b64
}
