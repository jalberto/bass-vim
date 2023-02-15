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
  'clones/vim-genutils',
  'eparreno/vim-l9',
  'xolox/vim-misc',
  'tpope/vim-repeat', -- Add repeat support to other plugins
  'tpope/vim-sleuth', -- Try to detect correct indentation
  { "stevearc/dressing.nvim", event = "VeryLazy" },

  { 'ixru/nvim-markdown', ft = 'markdown' },
  { 'amadeus/vim-mjml', ft = {'mjml'} },
  { 'andrewstuart/vim-kubernetes', ft = {'yaml'} },
  { 'towolf/vim-helm', ft = {'yaml'} },
  {
    'norcalli/nvim-colorizer.lua',
    ft = {'css', 'html', 'javascript', 'vim', 'scss'},
    config = true
  },

  { 'kana/vim-textobj-user', lazy = false },
  { 'windwp/nvim-autopairs', config = true, lazy = false },
  { 'tpope/vim-ragtag', ft = 'xml,html'}, -- xml & friends tags helpers
  { 'numToStr/Comment.nvim', lazy = false, config = true },

  {
    'AndrewRadev/splitjoin.vim',
    cmd = {'SplitjoinSplit', 'SplitjoinJoin'}
  }, -- sinle/multiline format with gS gJ
  {"kevinhwang91/nvim-bqf", ft = 'qf'}, -- Quickfix improvementss
  'Vonr/align.nvim',
  'mg979/vim-visual-multi', -- ctrl+n for multi cursor
  'machakann/vim-sandwich', -- manipulate surround-ings (sa/sdb/srb)

  'kshenoy/vim-signature', -- toggle/display/navigate marks
  { "jiaoshijie/undotree" },
  'christianrondeau/vim-base64', -- encode using b64

  { "akinsho/toggleterm.nvim" },
  'roxma/vim-tmux-clipboard',
  'christoomey/vim-tmux-navigator',

  { 'seblj/nvim-tabline', opts = { close_icon = '' }, lazy = false },
}
