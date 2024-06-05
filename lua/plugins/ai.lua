return {

  {
    "Aaronik/GPTModels.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-telescope/telescope.nvim"
    },
    keys = {
      {'<leader>k', ':GPTModelsCode<CR>', mode = 'v', { noremap = true }},
      {'<leader>k', ':GPTModelsCode<CR>', { noremap = true, mode = 'n' }},
      {'<leader>kc', ':GPTModelsChat<CR>', mode = 'v', { noremap = true }},
      {'<leader>kc', ':GPTModelsChat<CR>', { noremap = true }},
    }
  },

  -- {
  --   "olimorris/codecompanion.nvim",
  --   cmd = "CodeCompanionActions",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --     "nvim-telescope/telescope.nvim", -- Optional
  --     {
  --       "stevearc/dressing.nvim", -- Optional: Improves the default Neovim UI
  --       opts = {},
  --     },
  --   },
  --   config = function()
  --     require("codecompanion").setup({
  --       -- adapters = {
  --       --   ollama = require("codecompanion.adapters").use("ollama", {
  --       --     schema = {
  --       --       model = {
  --       --         default = "llama3:latest",
  --       --       },
  --       --     },
  --       --   }),
  --       -- },
  --       strategies = {
  --         chat = "ollama",
  --         inline = "ollama"
  --       },
  --     })
  --   end,
  -- }
}
