return {

  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    keys = {
      {
        '<leader>?',
        function()
          require('which-key').show({ global = false })
        end,
        desc = 'Buffer Local Keymaps (which-key)',
      },
    },
    opts = {
      preset = 'modern',
      plugins = {
        -- spelling = true,
        -- presets = {
        --   g = false,
        -- }
      },
    },
    -- config = function(_, opts)
    --   vim.o.timeout = true
    --   vim.o.timeoutlen = 300
    --   local wk = require("which-key")
    --   wk.setup(opts)
    --   -- local keymaps = {
    --   --   mode = { "n", "v" },
    --   --   ["gz"] = {  name  = "+surround" },
    --   --   ["]"] = { name = "+next" },
    --   --   ["["] = { name = "+prev" },
    --   --   ["<leader><tab>"] = { name = "+tabs" },
    --   --   ["<leader>b"] = { name = "+buffer" },
    --   --   ["<leader>c"] = { name = "+code" },
    --   --   ["<leader>f"] = { name = "+file/find" },
    --   --   ["<leader>q"] = { name = "+quit/session" },
    --   --   ["<leader>s"] = { name = "+search" },
    --   --   ["<leader>u"] = { name = "+ui" },
    --   --   ["<leader>w"] = { name = "+windows" },
    --   --   ["<leader>x"] = { name = "+diagnostics/quickfix" },
    --   -- }
    --   -- wk.register(keymaps)
    -- end,
  },
}
