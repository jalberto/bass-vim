return {
  -- git signs
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      watch_gitdir = { interval = 2000 },
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "契" },
        topdelete = { text = "契" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      on_attach = function(bufnr)
        local gitsigns = require('gitsigns')

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal({']c', bang = true})
          else
            gitsigns.nav_hunk('next')
          end
        end)

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal({'[c', bang = true})
          else
            gitsigns.nav_hunk('prev')
          end
        end)

        -- Actions
        map('n', '<leader>hs', gitsigns.stage_hunk, {desc = "git Hunk Stage"})
        map('n', '<leader>hr', gitsigns.reset_hunk, {desc = "git Hunk Reset"})
        map('v', '<leader>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
        map('v', '<leader>hr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
        map('n', '<leader>hR', gitsigns.reset_buffer, {desc = "git Reset buffer"})
        map('n', '<leader>hp', gitsigns.preview_hunk, {desc = "git Hunk Preview"})
        map('n', '<leader>hb', function() gitsigns.blame_line{full=true} end, {desc = "git Hunk Blame"})
        map('n', '<leader>hd', gitsigns.diffthis, {desc = "git Diff"})
        map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
        map('n', '<leader>gd', gitsigns.toggle_deleted, {desc = "Git delete line"})
        map('n', '<leader>gb', gitsigns.toggle_current_line_blame, {desc = "Git blame line"})

        -- Text object
        map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
      end
    },
    config = function(_, opts)
      require("gitsigns").setup(opts)
    end,
  },

  {
    'sindrets/diffview.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    keys = {
      { "<leader>ghd", '<cmd>DiffviewFileHistory %<cr>', desc = "Diff File" },
      { "<leader>ghD", '<cmd>DiffviewOpen<cr>', desc = "Diff all" },
    }
  },

  {
    'ruifm/gitlinker.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    keys = {
      { "<leader>ghy", desc = "Get Git link"}
    },
    opts = {
      mappings = "<leader>ghy"
    }
  }
}
