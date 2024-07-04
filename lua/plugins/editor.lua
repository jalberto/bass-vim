return {
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
          local path = vim.bo.buftype ~= "nofile" and vim.api.nvim_buf_get_name(0) or nil
          require("mini.files").open(path)
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

  -- keybindings helper
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = {
        spelling = true,
        presets = {
          g = false,
        }
      },
    },
    config = function(_, opts)
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      local wk = require("which-key")
      wk.setup(opts)
      local keymaps = {
        mode = { "n", "v" },
        -- ["g"] = { name = "+goto" },
        ["gz"] = {  name  = "+surround" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        ["<leader><tab>"] = { name = "+tabs" },
        ["<leader>b"] = { name = "+buffer" },
        ["<leader>c"] = { name = "+code" },
        ["<leader>f"] = { name = "+file/find" },
        -- ["<leader>g"] = { name = "+git" },
        -- ["<leader>gh"] = { name = "+hunks" },
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
      -- vim.api.nvim_create_autocmd("FileType", {
      --   callback = function()
      --     local buffer = vim.api.nvim_get_current_buf()
      --     pcall(vim.keymap.del, "n", "]]", { buffer = buffer })
      --     pcall(vim.keymap.del, "n", "[[", { buffer = buffer })
      --   end,
      -- })
    end,
    -- stylua: ignore
    keys = {
      { "]]", function() require("illuminate").goto_next_reference() end, desc = "Next Reference", },
      { "[[", function() require("illuminate").goto_prev_reference() end, desc = "Prev Reference" },
    },
  },

  -- Yank highlite and goodies{
  -- NOTE: it is too intrusive, I cannot make it works smoothly
  -- {
  --   "gbprod/yanky.nvim",
  --   -- event = "VeryLazy",
  --   lazy = false,
  --   config = true,
  --   -- config = function()
  --   --   require("yanky")
  --   --   require("telescope").load_extension("yank_history")
  --   -- end,
  --   dependencies = {"nvim-telescope/telescope.nvim"},
  --   keys = {
  --     { 'p', '<Plug>>(YankPutAfter)', mode = 'n'},
  --     -- { 'p', '<Plug>>(YankPutAfter)', mode = 'x'},
  --     { 'P', '<Plug>>(YankPutBefore)', mode = 'n'},
  --     -- { 'P', '<Plug>>(YankPutBefore)', mode = 'x'},
  --     { 'gp', '<Plug>>(YankGPutAfter)', mode = 'n'},
  --     -- { 'gp', '<Plug>>(YankGPutAfter)', mode = 'x'},
  --     { 'gP', '<Plug>>(YankGPutBefore)', mode = 'n'},
  --     -- { 'gP', '<Plug>>(YankGPutBefore)', mode = 'x'},
  --     { '<c-p>', '<Plug>>(YankyPreviousEntry)'},
  --     { '<c-n>', '<Plug>>(YankyNextEntry)'},
  --     { '<leader>fy', '<cmd>Telescope yank_history<cr>', desc = 'Yank ring'}
  --   },
  -- },

}
