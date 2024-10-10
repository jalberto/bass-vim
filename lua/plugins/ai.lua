return {

  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    build = "make BUILD_FROM_SOURCE=true luajit",
    opts = {
      -- add any opts here
    },
    dependencies = {
      -- "nvim-tree/nvim-web-devicons",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      {
        "grapp-dev/nui-components.nvim",
        dependencies = {
          "MunifTanjim/nui.nvim",
          "echasnovski/mini.icons",
          "nvim-lua/plenary.nvim",
          "stevearc/dressing.nvim",
          {
            'MeanderingProgrammer/render-markdown.nvim',
            opts = {
              file_types = { "markdown", "Avante" },
            },
            ft = { "markdown", "Avante" },
          },
        }
      },
    },
  },

  -- {
  --   "Aaronik/GPTModels.nvim",
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-telescope/telescope.nvim"
  --   },
  --   keys = {
  --     {'<leader>k', ':GPTModelsCode<CR>', mode = 'v', { noremap = true }},
  --     {'<leader>k', ':GPTModelsCode<CR>', { noremap = true, mode = 'n' }},
  --     {'<leader>kc', ':GPTModelsChat<CR>', mode = 'v', { noremap = true }},
  --     {'<leader>kc', ':GPTModelsChat<CR>', { noremap = true }},
  --   }
  -- },

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
