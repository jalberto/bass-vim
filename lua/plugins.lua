return {

  -- session management
  {
    'echasnovski/mini.sessions',
    version = false,
    lazy = false,
    opts = {
      autoread = true,
      autowrite = true,
    },
    config = function(_, opts)
      require("mini.sessions").setup(opts)
    end,
  },

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

  {
    "OXY2DEV/markview.nvim",
    ft = 'markdown',
    dependencies = {
      -- "nvim-tree/nvim-web-devicons", -- Used by the code bloxks
    },

    config = function ()
      require("markview").setup();
    end
  },
  { 'amadeus/vim-mjml', ft = {'mjml'} },
  { 'andrewstuart/vim-kubernetes', ft = {'yaml'} },
  { 'towolf/vim-helm', ft = {'yaml'} },
  {
    'norcalli/nvim-colorizer.lua',
    ft = {'css', 'html', 'javascript', 'vim', 'scss', 'markdown'},
    config = true
  },

  { 'tpope/vim-ragtag', ft = 'xml,html'}, -- xml & friends tags helpers

  {"kevinhwang91/nvim-bqf", ft = 'qf'}, -- Quickfix improvementss

  { 'Vonr/align.nvim' },
}
