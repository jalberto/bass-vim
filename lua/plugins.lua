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

  -- makes some plugins dot-repeatable like leap
  { "tpope/vim-repeat",              event = "VeryLazy" },

  'clones/vim-genutils',
  'eparreno/vim-l9',
  'xolox/vim-misc',
  'tpope/vim-sleuth', -- Try to detect correct indentation

  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = 'markdown',
    opts = {},
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' },
    config = true
  },
  -- {
  --   "OXY2DEV/markview.nvim",
  --   ft = 'markdown',
  --   dependencies = {
  --     -- "nvim-tree/nvim-web-devicons", -- Used by the code bloxks
  --   },
  --
  --   config = function ()
  --     require("markview").setup();
  --   end
  -- },
  { 'amadeus/vim-mjml',            ft = { 'mjml' } },
  { 'andrewstuart/vim-kubernetes', ft = { 'yaml' } },
  { 'towolf/vim-helm',             ft = { 'yaml' } },
  {
    'norcalli/nvim-colorizer.lua',
    ft = { 'css', 'html', 'javascript', 'vim', 'scss', 'markdown', 'toml', 'ini', 'config', 'yaml' },
    config = true
  },

  { 'tpope/vim-ragtag',      ft = 'xml,html' }, -- xml & friends tags helpers

  { "kevinhwang91/nvim-bqf", ft = 'qf' },       -- Quickfix improvementss

  { 'Vonr/align.nvim' },
}
