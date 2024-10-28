return {
  -- Add colors to modes
  {
    'mvllow/modes.nvim',
    lazy = false,
    opts = {
      colors = {
        -- insert = "#718e3f",
        -- visual = "#ffffff"
      },
      line_opacity = 0.20,
    }
  },

  {
    'fenetikm/falcon',
    -- lazy = false,
    -- priority = 1000,
    config = function()
      -- vim.cmd([[colorscheme falcon]])
      vim.g.falcon_background = 1
      vim.g.falcon_inactive = 1
    end
  },
  -- {
  --   'DanielEliasib/sweet-fusion',
  --   lazy = false,
  --   name = 'sweet-fusion',
  --   priority = 1000,
  --   opts = {
  --     transparency = true,
  --     dim_inactive = true,
  --   }
  -- },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      borderless_telescope = false,
      theme = {
        variant = "auto",
        saturation = 1,
      }
    }
  },

  -- better vim.ui
  {
    "stevearc/dressing.nvim",
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.select(...)
      end
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.input(...)
      end
    end,
  },

  -- nice indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    main = "ibl",
    opts = {
      indent = {
        char = "│",
      },
      exclude = {
        filetypes = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
      },
      scope = {
        enabled = true
      },
    }
  },
  -- {
  --   "gh-liu/fold_line.nvim",
  --   event = "VeryLazy",
  --   init = function()
  --     -- change the char of the line, see the `Appearance` section
  --     vim.g.fold_line_char_open_start = "╭"
  --     vim.g.fold_line_char_open_end = "╰"
  --   end,
  -- },

  -- bufferline / tabline
  {
    "akinsho/nvim-bufferline.lua",
    event = "VeryLazy",
    init = function()
      vim.keymap.set("n", "<s-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
      vim.keymap.set("n", "<s-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
      vim.keymap.set("n", "<leader>b[", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous" })
      vim.keymap.set("n", "<leader>b]", "<cmd>BufferLineCycleNext<cr>", { desc = "Next" })
    end,
    opts = {
      options = {
        -- mode = 'tabs',
        indicator = 'underline',
        show_buffer_icons = false,
        -- show_buffer_default_icon = false,
        show_buffer_close_icon = false,
        show_close_icon = false,

        diagnostics = "nvim_lsp",
        always_show_bufferline = false,
        hover = {
          enabled = true,
          delay = 200,
          reveal = {'close'}
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

  -- icons
  -- { "nvim-tree/nvim-web-devicons", lazy = true },

  {
    "echasnovski/mini.icons",
    lazy = true,
    opts = {},
    init = function()
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
  },

  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(plugin)
      -- local icons = require("lazyvim.config").icons

      local function fg(name)
        return function()
          ---@type table<string, any>
          local hl = vim.api.nvim_get_hl(0, { name = name })
          return hl and hl.fg and { fg = string.format("#%06x", hl.fg) }
        end
      end

      return {
        options = {
          -- theme = require('lualine-falcon').theme(),
          theme = "auto",
          globalstatus = true,
          component_separators = '',
          section_separators = '',
          disabled_filetypes = { statusline = { "dashboard", "alpha" } },
        },
        sections = {
          lualine_a = {
            { 'mode', fmt = function(str) return str:sub(1,1) end }
          },
          lualine_b = { "branch" },
          lualine_c = {
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
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
            { require("lazy.status").updates, cond = require("lazy.status").has_updates, color = fg("Special") },
            {
              "diff",
              -- symbols = {
              --   added = icons.git.added,
              --   modified = icons.git.modified,
              --   removed = icons.git.removed,
              -- },
            },
          },
          lualine_y = {
            {
              "diagnostics",
              -- symbols = {
              --   error = icons.diagnostics.Error,
              --   warn = icons.diagnostics.Warn,
              --   info = icons.diagnostics.Info,
              --   hint = icons.diagnostics.Hint,
              -- },
            },
          },
          lualine_z = {
            { "progress", separator = " ", padding = { left = 1, right = 0 } },
            { "location", padding = { left = 0, right = 1 } },
            -- function()
            --   return " " .. os.date("%R")
            -- end,
          },
        },
        extensions = { "toggleterm", "quickfix", "trouble", "toggleterm", "mason", "man", "lazy"},
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
