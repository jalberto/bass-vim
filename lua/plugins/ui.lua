return {
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
    version = "3.5.4",
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
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    },
  },

  -- icons
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(plugin)
      -- local icons = require("lazyvim.config").icons

      local function fg(name)
        return function()
          ---@type {foreground?:number}?
          local hl = vim.api.nvim_get_hl_by_name(name, true)
          return hl and hl.foreground and { fg = string.format("#%06x", hl.foreground) }
        end
      end

      return {
        options = {
          theme = require('lualine-falcon').theme(),
          globalstatus = true,
          component_separators = '',
          section_separators = '',
          disabled_filetypes = { statusline = { "dashboard", "lazy", "alpha" } },
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
            -- { require("lazy.status").updates, cond = require("lazy.status").has_updates, color = fg("Special") },
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
        extensions = { "toggleterm", "quickfix" },
      }
    end,
  },

  -- Predefined windows
  {
    "folke/edgy.nvim",
    event = "VeryLazy",
    init = function()
      vim.opt.laststatus = 3
      vim.opt.splitkeep = "screen"
    end,
    opts = {
      right = {
        { ft = "codecompanion", title = "Code Companion Chat", size = { width = 0.45 } },
      }
    }
  },

  -- Note per repo
  {
    'yujinyuz/gitpad.nvim',
    config = function()
      require('gitpad').setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
    keys = {
      {
        '<leader>pp',
        function()
          require('gitpad').toggle_gitpad() -- or require('gitpad').toggle_gitpad({ title = 'Project notes' })
        end,
        desc = 'gitpad project',
      },
      {
        '<leader>pb',
        function()
          require('gitpad').toggle_gitpad_branch() -- or require('gitpad').toggle_gitpad_branch({ title = 'Branch notes' })
        end,
        desc = 'gitpad branch',
      },
      -- Daily notes
      {
        '<leader>pd',
        function()
          local date_filename = 'daily-' .. os.date('%Y-%m-%d.md')
          require('gitpad').toggle_gitpad({ filename = date_filename }) -- or require('gitpad').toggle_gitpad({ filename = date_filename, title = 'Daily notes' })
        end,
        desc = 'gitpad daily notes',
      },
      -- Per file notes
      {
        '<leader>pf',
        function()
          local filename = vim.fn.expand('%:p') -- or just use vim.fn.bufname()
          if filename == '' then
            vim.notify('empty bufname')
            return
          end
          filename = vim.fn.pathshorten(filename, 2) .. '.md'
          require('gitpad').toggle_gitpad({ filename = filename }) -- or require('gitpad').toggle_gitpad({ filename = filename, title = 'Current file notes' })
        end,
        desc = 'gitpad per file notes',
      },
    },
  }
}
