return {
  {
    "chrisgrieser/nvim-early-retirement",
    config = true,
    event = "VeryLazy",
    opts = {
      deleteBufferWhenFileDeleted = true,
    }
  },

  -- file explorer
  {
    'echasnovski/mini.files',
    version = false,
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
          local cur_target = MiniFiles.get_explorer_state().target_window
          local new_target = vim.api.nvim_win_call(cur_target, function()
            vim.cmd(direction .. ' split')
            return vim.api.nvim_get_current_win()
          end)

          MiniFiles.set_target_window(new_target)
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
          map_split(buf_id, '<C-s>', 'belowright horizontal')
          map_split(buf_id, '<C-v>', 'belowright vertical')
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
        -- presets = {
        --   g = false,
        -- }
      },
    },
    -- config = function(_, opts)
    --   vim.o.timeout = true
    --   vim.o.timeoutlen = 300
    --   local wk = require("which-key")
    --   wk.setup(opts)
    --   -- local keymaps = {
    --   --   mode = { "n", "v" },
    --   --   ["gz"] = {  name  = "+surround" },
    --   --   ["]"] = { name = "+next" },
    --   --   ["["] = { name = "+prev" },
    --   --   ["<leader><tab>"] = { name = "+tabs" },
    --   --   ["<leader>b"] = { name = "+buffer" },
    --   --   ["<leader>c"] = { name = "+code" },
    --   --   ["<leader>f"] = { name = "+file/find" },
    --   --   ["<leader>q"] = { name = "+quit/session" },
    --   --   ["<leader>s"] = { name = "+search" },
    --   --   ["<leader>u"] = { name = "+ui" },
    --   --   ["<leader>w"] = { name = "+windows" },
    --   --   ["<leader>x"] = { name = "+diagnostics/quickfix" },
    --   -- }
    --   -- wk.register(keymaps)
    -- end,
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

  -- highlighting other uses of the word under the cursor
  -- <a-n> & <a-p>
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    opts = { delay = 300 },
    config = function(_, opts)
      require("illuminate").configure(opts)
    end,
  },

  -- Yank highlite and goodies
  -- NOTE: it is very intrusive
  {
    "gbprod/yanky.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    opts = {},
    keys = {
      { "<leader>p", function() require("telescope").extensions.yank_history.yank_history({}) end, desc = "Open Yank History" },
      { "y",         "<Plug>(YankyYank)",                                                          mode = { "n", "x" },                                desc = "Yank text" },
      { "p",         "<Plug>(YankyPutAfter)",                                                      mode = { "n", "x" },                                desc = "Put yanked text after cursor" },
      { "P",         "<Plug>(YankyPutBefore)",                                                     mode = { "n", "x" },                                desc = "Put yanked text before cursor" },
      { "gp",        "<Plug>(YankyGPutAfter)",                                                     mode = { "n", "x" },                                desc = "Put yanked text after selection" },
      { "gP",        "<Plug>(YankyGPutBefore)",                                                    mode = { "n", "x" },                                desc = "Put yanked text before selection" },
      { "<c-p>",     "<Plug>(YankyPreviousEntry)",                                                 desc = "Select previous entry through yank history" },
      { "<c-n>",     "<Plug>(YankyNextEntry)",                                                     desc = "Select next entry through yank history" },
      { "]p",        "<Plug>(YankyPutIndentAfterLinewise)",                                        desc = "Put indented after cursor (linewise)" },
      { "[p",        "<Plug>(YankyPutIndentBeforeLinewise)",                                       desc = "Put indented before cursor (linewise)" },
      { "]P",        "<Plug>(YankyPutIndentAfterLinewise)",                                        desc = "Put indented after cursor (linewise)" },
      { "[P",        "<Plug>(YankyPutIndentBeforeLinewise)",                                       desc = "Put indented before cursor (linewise)" },
      { ">p",        "<Plug>(YankyPutIndentAfterShiftRight)",                                      desc = "Put and indent right" },
      { "<p",        "<Plug>(YankyPutIndentAfterShiftLeft)",                                       desc = "Put and indent left" },
      { ">P",        "<Plug>(YankyPutIndentBeforeShiftRight)",                                     desc = "Put before and indent right" },
      { "<P",        "<Plug>(YankyPutIndentBeforeShiftLeft)",                                      desc = "Put before and indent left" },
      { "=p",        "<Plug>(YankyPutAfterFilter)",                                                desc = "Put after applying a filter" },
      { "=P",        "<Plug>(YankyPutBeforeFilter)",                                               desc = "Put before applying a filter" },
    },
  }
}
