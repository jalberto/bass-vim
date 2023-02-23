return {
  {
    "akinsho/toggleterm.nvim",
    keys = {[[<c-\>]]},
    cmd = 'ToggleTerm',
    opts = {
      size = 10,
      insert_mapping = true,
      open_mapping = [[<c-\>]]
    },
  },

  -- tmux integration
  {
    'numToStr/Navigator.nvim',
    lazy = false,
    keys = { 'A-h', 'A-j', 'A-k', 'A-l', 'A-p' },
    config = function()
      local mod = {'n','t'}
      vim.keymap.set(mod, "<A-h>", "<CMD>NavigatorLeft<CR>", { desc = "Go to left window" })
      vim.keymap.set(mod, "<A-j>", "<CMD>NavigatorDown<CR>", { desc = "Go to lower window" })
      vim.keymap.set(mod, "<A-k>", "<CMD>NavigatorUp<CR>", { desc = "Go to upper window" })
      vim.keymap.set(mod, "<A-l>", "<CMD>NavigatorRight<CR>", { desc = "Go to right window" })
      require('Navigator').setup()
    end
  },
}
