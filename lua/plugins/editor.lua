return {
  -- buffers
  -- {
  --   'kazhala/close-buffers.nvim',
  --   lazy = false,
  --   config = function ()
  --     require('close_buffers').setup()
  --   end
  -- },
  {
    "chrisgrieser/nvim-early-retirement",
    config = true,
    event = "VeryLazy",
  },

  -- file explorer
  { 
    'echasnovski/mini.files', version = false,
    cmd = "MiniFiles",
    keys = {
      {
        "<leader>e",
        function()
          require("mini.files").open()
        end,
        desc = "Explorer",
      },
    },
    config = function()
      require("mini.files").setup()
      -- Create mapping to show/hide dot-files
      local show_dotfiles = true
      local filter_show = function(fs_entry) return true end
      local filter_hide = function(fs_entry)
        return not vim.startswith(fs_entry.name, '.')
      end
      local toggle_dotfiles = function()
        show_dotfiles = not show_dotfiles
        local new_filter = show_dotfiles and filter_show or filter_hide
        MiniFiles.refresh({ content = { filter = new_filter } })
      end
      vim.api.nvim_create_autocmd('User', {
        pattern = 'MiniFilesBufferCreate',
        callback = function(args)
          local buf_id = args.data.buf_id
          -- Tweak left-hand side of mapping to your liking
          vim.keymap.set('n', 'g.', toggle_dotfiles, { buffer = buf_id })
        end,
      })
      -- Create mappings to modify target window via split ~
      local map_split = function(buf_id, lhs, direction)
        local rhs = function()
          -- Make new window and set it as target
          local new_target_window
          vim.api.nvim_win_call(MiniFiles.get_target_window(), function()
            vim.cmd(direction .. ' split')
            new_target_window = vim.api.nvim_get_current_win()
          end)

          MiniFiles.set_target_window(new_target_window)
        end

        -- Adding `desc` will result into `show_help` entries
        local desc = 'Split ' .. direction
        vim.keymap.set('n', lhs, rhs, { buffer = buf_id, desc = desc })
      end

      vim.api.nvim_create_autocmd('User', {
        pattern = 'MiniFilesBufferCreate',
        callback = function(args)
          local buf_id = args.data.buf_id
          -- Tweak keys to your liking
          map_split(buf_id, 'gs', 'belowright horizontal')
          map_split(buf_id, 'gv', 'belowright vertical')
        end,
      })
    end,
  },

  -- {
  --   "nvim-neo-tree/neo-tree.nvim",
  --   branch = "v2.x",
  --   dependencies = { 
  --     "nvim-lua/plenary.nvim",
  --     "nvim-tree/nvim-web-devicons",
  --     "MunifTanjim/nui.nvim",
  --   },
  --   cmd = "Neotree",
  --   keys = {
  --     {
  --       "<leader>fe",
  --       function()
  --         require("neo-tree.command").execute({ toggle = true })
  --       end,
  --       desc = "Explorer NeoTree",
  --     },
  --     { "<leader>e", "<leader>fe", desc = "Explorer NeoTree", remap = true },
  --     -- {
  --     --   "<leader>gs",
  --     --   function()
  --     --     require("neo-tree.command").execute({ source = 'git_status', position = 'float', toggle = true})
  --     --   end,
  --     --   desc = "Explore Git Status"
  --     -- },
  --   },
  --   deactivate = function()
  --     vim.cmd([[Neotree close]])
  --   end,
  --   init = function()
  --     vim.g.neo_tree_remove_legacy_commands = 1
  --     vim.fn.sign_define("DiagnosticSignError",
  --       {text = " ", texthl = "DiagnosticSignError"})
  --     vim.fn.sign_define("DiagnosticSignWarn",
  --       {text = " ", texthl = "DiagnosticSignWarn"})
  --     vim.fn.sign_define("DiagnosticSignInfo",
  --       {text = " ", texthl = "DiagnosticSignInfo"})
  --     vim.fn.sign_define("DiagnosticSignHint",
  --       {text = " ", texthl = "DiagnosticSignHint"})
  --     if vim.fn.argc() == 1 then
  --       local stat = vim.loop.fs_stat(vim.fn.argv(0))
  --       if stat and stat.type == "directory" then
  --         require("neo-tree")
  --       end
  --     end
  --   end,
  --   opts = {
  --     close_if_last_window = true,
  --     popup_border_style = "solid",
  --     enable_git_status = true,
  --     enable_diagnostics = true,
  --     sort_case_insensitive = true,
  --     filesystem = {
  --       bind_to_cwd = false,
  --       follow_current_file = true,
  --     },
  --     window = {
  --       width = 30,
  --       mappings = {
  --         ["<space>"] = "none",
  --       },
  --     },
  --   },
  -- },

  -- keybindings helper
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = { spelling = true },
    },
    config = function(_, opts)
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      local wk = require("which-key")
      wk.setup(opts)
      local keymaps = {
        mode = { "n", "v" },
        ["g"] = { name = "+goto" },
        ["gz"] = { name = "+surround" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        ["<leader><tab>"] = { name = "+tabs" },
        ["<leader>b"] = { name = "+buffer" },
        ["<leader>c"] = { name = "+code" },
        ["<leader>f"] = { name = "+file/find" },
        ["<leader>g"] = { name = "+git" },
        ["<leader>gh"] = { name = "+hunks" },
        ["<leader>q"] = { name = "+quit/session" },
        ["<leader>s"] = { name = "+search" },
        ["<leader>u"] = { name = "+ui" },
        ["<leader>w"] = { name = "+windows" },
        ["<leader>x"] = { name = "+diagnostics/quickfix" },
      }
      wk.register(keymaps)
    end,
  },

  -- easily jump to any location and enhanced f/t motions for Leap
  {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    dependencies = { { "ggandor/flit.nvim", opts = { labeled_modes = "nv" } } },
    config = function(_, opts)
      local leap = require("leap")
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings(true)
      vim.keymap.del({ "x", "o" }, "x")
      vim.keymap.del({ "x", "o" }, "X")
    end,
  },

  -- references
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    opts = { delay = 500 },
    config = function(_, opts)
      require("illuminate").configure(opts)
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          local buffer = vim.api.nvim_get_current_buf()
          pcall(vim.keymap.del, "n", "]]", { buffer = buffer })
          pcall(vim.keymap.del, "n", "[[", { buffer = buffer })
        end,
      })
    end,
    -- stylua: ignore
    keys = {
      { "]]", function() require("illuminate").goto_next_reference(false) end, desc = "Next Reference", },
      { "[[", function() require("illuminate").goto_prev_reference(false) end, desc = "Prev Reference" },
    },
  },

  -- better diagnostics list and others
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    opts = {
      use_diagnostic_signs = true,
      -- position = "right",
      mode = "document_diagnostics",
      auto_open = false,
      auto_close = true,
      use_diagnostic_signs = true,
      auto_fold = false
    },
    keys = {
      { "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
      { "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
      { "<leader>xL", "<cmd>TroubleToggle loclist<cr>", desc = "Location List (Trouble)" },
      { "<leader>xQ", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List (Trouble)" },
    },
  },

  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufReadPost", "BufNewFile" },
    config = true,
    -- stylua: ignore
    keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
      { "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
      { "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
      { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
    },
  },

  -- Show tips for commands
  -- {
  --   "m4xshen/hardtime.nvim",
  --   cmd = { "Hardtime" },
  --   event = { "BufReadPost" },
  --   dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  --   opts = {}
  -- },
}
