return {

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
