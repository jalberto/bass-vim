return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {[[<c-\>]]},
    cmd = 'ToggleTerm',
    opts = {
      size = 10,
      insert_mapping = true,
      open_mapping = [[<c-\>]]
    },
    -- config = true
    config = function(_, opts)
      require('toggleterm').setup(opts)

      local Terminal  = require('toggleterm.terminal').Terminal
      local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

      function _lazygit_toggle()
        lazygit:toggle()
      end

      vim.api.nvim_set_keymap("n", "<leader>1", "<cmd>lua _lazygit_toggle()<CR>", {desc = "LazyGit", noremap = true, silent = true})
    end
  },

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
