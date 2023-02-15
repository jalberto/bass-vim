return {
  {
    "akinsho/toggleterm.nvim",
    opts = { size = 10, open_mapping = "[[<c-\\>]]" }
  },
  {
    'numToStr/Navigator.nvim',
    lazy = false,
    keys = { 'A-h', 'A-j', 'A-k', 'A-l', 'A-p' },
    config = function()
      vim.keymap.set("n", "<A-h>", "<CMD>NavigatorLeft<CR>", { desc = "Go to left window" })
      vim.keymap.set("n", "<A-j>", "<CMD>NavigatorDown<CR>", { desc = "Go to lower window" })
      vim.keymap.set("n", "<A-k>", "<CMD>NavigatorUp<CR>", { desc = "Go to upper window" })
      vim.keymap.set("n", "<A-l>", "<CMD>NavigatorRight<CR>", { desc = "Go to right window" })
      require('Navigator').setup()
    end
  },
  -- { 'roxma/vim-tmux-clipboard' },
  -- { 'christoomey/vim-tmux-navigator' },
}
