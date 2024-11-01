return {

  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    build = "make BUILD_FROM_SOURCE=true luajit",
    opts = {
      windows = {
        width = 35,
        sidebar_header = {
          enabled = false
        }
      }
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
            -- support for image pasting
            "HakonHarnes/img-clip.nvim",
            event = "VeryLazy",
            opts = {
              -- recommended settings
              default = {
                embed_image_as_base64 = false,
                prompt_for_file_name = false,
                drag_and_drop = {
                  insert_mode = true,
                },
                -- required for Windows users
                use_absolute_path = true,
              },
            },
          },
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
