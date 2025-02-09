return {

  {
    'rcarriga/nvim-notify',
  },

  -- NOTE: not really sure if it is working
  {
    'echasnovski/mini.animate',
    version = '*',
    config = function()
      require('mini.animate').setup()
    end,
  },

  {
    'echasnovski/mini.icons',
    lazy = true,
    opts = {},
    init = function()
      package.preload['nvim-web-devicons'] = function()
        require('mini.icons').mock_nvim_web_devicons()
        return package.loaded['nvim-web-devicons']
      end
    end,
  },

  -- Add colors to modes
  {
    'mvllow/modes.nvim',
    lazy = false,
    opts = {
      colors = {
        -- insert = "#718e3f",
        -- visual = "#ffffff"
      },
      line_opacity = 0.30,
    },
  },

  -- {
  --   'folke/twilight.nvim',
  --   cmd = 'Twilight',
  --   opts = { context = 20 },
  -- },

  {
    'fenetikm/falcon',
    -- lazy = false,
    -- priority = 1000,
    config = function()
      vim.g.falcon_background = 0
      vim.g.falcon_inactive = 0
      -- vim.cmd.colorscheme('falcon')
    end,
  },
  -- lua/plugins/rose-pine.lua
  {
    'rose-pine/neovim',
    lazy = false,
    priority = 1000,
    name = 'rose-pine',
    config = function()
      require('rose-pine').setup({
        styles = { transparency = true },
        variant = 'moon',
      })
      vim.cmd('colorscheme rose-pine')
    end,
  },

  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
    },
  },
  {
    'wtfox/jellybeans.nvim',
    -- priority = 1000,
    config = function()
      require('jellybeans').setup({ transparent = true })
      -- vim.cmd.colorscheme('jellybeans')
    end,
  },
  {
    'scottmckendry/cyberdream.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      borderless_pickers = false,
      variant = 'auto',
      saturation = 1,
    },
  },

  -- better vim.ui
  {
    'stevearc/dressing.nvim',
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require('lazy').load({ plugins = { 'dressing.nvim' } })
        return vim.ui.select(...)
      end
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require('lazy').load({ plugins = { 'dressing.nvim' } })
        return vim.ui.input(...)
      end
    end,
  },

  -- nice indent guides
  -- {
  --   'lukas-reineke/indent-blankline.nvim',
  --   event = 'BufReadPre',
  --   main = 'ibl',
  --   opts = {
  --     indent = {
  --       char = '│',
  --     },
  --     exclude = {
  --       filetypes = { 'help', 'alpha', 'dashboard', 'neo-tree', 'Trouble', 'lazy' },
  --     },
  --     scope = {
  --       enabled = true,
  --     },
  --   },
  -- },

  -- bufferline / tabline
  {
    'akinsho/nvim-bufferline.lua',
    event = 'VeryLazy',
    init = function()
      vim.keymap.set('n', '<s-h>', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Prev Buffer' })
      vim.keymap.set('n', '<s-l>', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next Buffer' })
      -- now in Snacks
      -- vim.keymap.set("n", "<leader>bx", "<cmd>BufferLineCloseOthers<cr>", { desc = "Close other buffers" })
      -- vim.keymap.set("n", "<leader>b[", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous" })
      -- vim.keymap.set("n", "<leader>b]", "<cmd>BufferLineCycleNext<cr>", { desc = "Next" })
    end,
    opts = {
      options = {
        -- mode = 'tabs',
        indicator = {
          icon = '▎', -- this should be omitted if indicator style is not 'icon'
          style = 'underline', -- 'icon' | 'underline' | 'none',
        },
        show_buffer_icons = false,
        -- show_buffer_default_icon = false,
        show_buffer_close_icon = false,
        show_close_icon = false,
        separator_style = { '¦', '¦' }, -- "slant" | "slope" | "thick" | "thin" | { 'any', 'any' },

        diagnostics = 'nvim_lsp',
        -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
        --   if context.buffer:current() then
        --     local icon = level:match("error") and " " or " "
        --     return " " .. icon .. count
        --     -- return ' '
        --   end
        --   return ''
        -- end,
        always_show_bufferline = false,
        hover = {
          enabled = true,
          delay = 200,
          reveal = { 'close' },
        },
        -- offsets = {
        --   {
        --     filetype = "neo-tree",
        --     text = "Neo-tree",
        --     highlight = "Directory",
        --     text_align = "left",
        --   },
        -- },
      },
    },
  },

  -- statusline
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    opts = function(plugin)
      -- local icons = require("lazyvim.config").icons

      local function fg(name)
        return function()
          ---@type table<string, any>
          local hl = vim.api.nvim_get_hl(0, { name = name })
          return hl and hl.fg and { fg = string.format('#%06x', hl.fg) }
        end
      end

      return {
        options = {
          -- theme = require('lualine-falcon').theme(),
          theme = 'auto',
          globalstatus = true,
          component_separators = '',
          section_separators = '',
          disabled_filetypes = { statusline = { 'dashboard', 'alpha' } },
        },
        sections = {
          lualine_a = {
            {
              'mode',
              fmt = function(str)
                return str:sub(1, 1)
              end,
            },
          },
          lualine_b = { 'branch' },
          lualine_c = {
            { 'filetype', icon_only = true, separator = '', padding = { left = 1, right = 0 } },
            { 'filename', path = 1, symbols = { modified = '  ', readonly = '', unnamed = '' } },
            -- stylua: ignore
            -- {
            --   function() return require("nvim-navic").get_location() end,
            --   cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
            -- },
          },
          lualine_x = {
            -- stylua: ignore
            -- {
            --   function() return require("noice").api.status.command.get() end,
            --   cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
            --   color = fg("Statement")
            -- },
            -- stylua: ignore
            -- {
            --   function() return require("noice").api.status.mode.get() end,
            --   cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
            --   color = fg("Constant") ,
            -- },
            -- { require("lazy.status").updates, cond = require("lazy.status").has_updates, color = fg("Special") },
            { require("lazy.status").updates, cond = require("lazy.status").has_updates },
            { 'diff' },
          },
          lualine_y = {
            { 'diagnostics' },
          },
          lualine_z = {
            { 'progress', separator = ' ', padding = { left = 1, right = 0 } },
            { 'location', padding = { left = 0, right = 1 } },
            -- function()
            --   return " " .. os.date("%R")
            -- end,
          },
        },
        extensions = { 'toggleterm', 'quickfix', 'trouble', 'toggleterm', 'mason', 'man', 'lazy' },
      }
    end,
  },

  -- Predefined windows
  -- {
  --   "folke/edgy.nvim",
  --   event = "VeryLazy",
  --   init = function()
  --     vim.opt.laststatus = 3
  --     vim.opt.splitkeep = "screen"
  --   end,
  --   opts = {
  --     right = {
  --       { ft = "codecompanion", title = "Code Companion Chat", size = { width = 0.45 } },
  --     }
  --   }
  -- },
}
