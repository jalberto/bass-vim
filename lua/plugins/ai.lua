return {

  -- {
  -- 'milanglacier/minuet-ai.nvim',
  -- config = function()
  --   require('minuet').setup({
  --     provider = 'openai_fim_compatible',
  --     n_completions = 1, -- recommend for local model for resource saving
  --     -- I recommend you start with a small context window firstly, and gradually
  --     -- increase it based on your local computing power.
  --     context_window = 1024,
  --     provider_options = {
  --       openai_fim_compatible = {
  --         api_key = 'TERM',
  --         name = 'Ollama',
  --         end_point = 'http://localhost:11434/v1/completions',
  --         model = 'qwen2.5-coder:7b',
  --         -- model = 'deepseek-r1:7b',
  --         optional = {
  --           max_tokens = 256,
  --           top_p = 0.9,
  --         },
  --       },
  --     },
  --   })
  -- require('blink-cmp').setup({
  --   keymap = {
  --     -- Manually invoke minuet completion.
  --     ['<A-y>'] = require('minuet').make_blink_map(),
  --   },
  --   sources = {
  --     -- Enable minuet for autocomplete
  --     default = { 'lsp', 'path', 'buffer', 'snippets', 'minuet' },
  --     -- For manual completion only, remove 'minuet' from default
  --     providers = {
  --       minuet = {
  --         name = 'minuet',
  --         module = 'minuet.blink',
  --         score_offset = 8, -- Gives minuet higher priority among suggestions
  --       },
  --     },
  --   },
  --   -- Recommended to avoid unnecessary request
  --   completion = { trigger = { prefetch_on_insert = false } },
  -- })
  -- end,
  -- },

  {
    'yetone/avante.nvim',
    event = 'VeryLazy',
    build = 'make BUILD_FROM_SOURCE=true luajit',
    opts = {
      windows = {
        width = 35,
        sidebar_header = {
          enabled = false,
        },
      },
    },
    dependencies = {
      'stevearc/dressing.nvim',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      'echasnovski/mini.icons',
      {
        -- support for image pasting
        'HakonHarnes/img-clip.nvim',
        event = 'VeryLazy',
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
          file_types = { 'markdown', 'Avante' },
        },
        ft = { 'markdown', 'Avante' },
      },
    },
  },

  -- {
  --   'TabbyML/vim-tabby',
  --   lazy = false,
  --   dependencies = {
  --     'neovim/nvim-lspconfig',
  --   },
  --   init = function()
  --     vim.g.tabby_agent_start_command = { 'npx', 'tabby-agent', '--stdio' }
  --     vim.g.tabby_inline_completion_trigger = 'auto'
  --   end,
  -- },
}
