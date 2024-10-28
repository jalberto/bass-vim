return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      { [[<c-\>]] },
      { '<leader>gl', '<cmd>lua _lazygit_toggle()<CR>',  desc = "LazyGit" },
      { '<leader>ge', '<cmd>lua _explorer_toggle()<CR>', desc = "Explorer"}
    },
    cmd = 'ToggleTerm',
    opts = {
      size = 10,
      insert_mapping = true,
      hide_numbers = true,
      start_in_insert = true,
      open_mapping = [[<c-\>]]
    },
    config = function(_, opts)
      require('toggleterm').setup(opts)

      local Terminal  = require('toggleterm.terminal').Terminal

      local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
      function _lazygit_toggle()
        lazygit:toggle()
      end

      local explorer = Terminal:new({ cmd = "spf", hidden = true, direction = "float" })
      function _explorer_toggle()
        explorer:toggle()
      end
    end
  },

  -- tmux navigation
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
  -- This one doesn't works
  -- {
  --   'alexghergh/nvim-tmux-navigation',
  --   config = function()
  --
  --     local nvim_tmux_nav = require('nvim-tmux-navigation')
  --
  --     nvim_tmux_nav.setup {
  --       disable_when_zoomed = true -- defaults to false
  --     }
  --
  --     vim.keymap.set('n', "<A-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
  --     vim.keymap.set('n', "<A-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
  --     vim.keymap.set('n', "<A-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
  --     vim.keymap.set('n', "<A-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
  --     -- vim.keymap.set('n', "<A-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
  --     -- vim.keymap.set('n', "<A-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
  --
  --   end
  -- }
}
