return {
  -- better diagnostics list and others
  {
    'folke/trouble.nvim',
    cmd = { 'Trouble' },
    opts = {
      auto_open = false,
      auto_close = true,
      use_diagnostic_signs = true,
      auto_fold = false,
      focus = true,
      max_items = 50,
      modes = {
        cascade = {
          mode = 'diagnostics', -- inherit from diagnostics mode
          filter = function(items)
            local severity = vim.diagnostic.severity.HINT
            for _, item in ipairs(items) do
              severity = math.min(severity, item.severity)
            end
            return vim.tbl_filter(function(item)
              return item.severity == severity
            end, items)
          end,
        },
      },
    },
    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble cascade toggle<cr>',
        desc = 'Diagnostics',
      },
      {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics',
      },
      -- { "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
      {
        '<leader>xL',
        '<cmd>Trouble lsp toggle focus=false win.position=right filter.buf=0 pinned=true<cr>',
        desc = 'LSP (Trouble)',
      },
      {
        '<leader>xQ',
        '<cmd>Trouble quickfix toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
  },

  -- sinle/multiline format with gS
  {
    'echasnovski/mini.splitjoin',
    version = false,
    keys = { { 'gS', desc = 'toggle Split/Join' } },
    config = function(_, opts)
      require('mini.splitjoin').setup(opts)
    end,
  },

  -- auto pairs
  {
    'echasnovski/mini.pairs',
    event = 'VeryLazy',
    config = function(_, opts)
      require('mini.pairs').setup(opts)
    end,
  },

  -- surround
  {
    'echasnovski/mini.surround',
    keys = {
      { 'gza', desc = 'Add surrounding', mode = { 'n', 'v' } },
      { 'gzd', desc = 'Delete surrounding' },
      { 'gzf', desc = 'Find right surrounding' },
      { 'gzF', desc = 'Find left surrounding' },
      { 'gzh', desc = 'Highlight surrounding' },
      { 'gzr', desc = 'Replace surrounding' },
      { 'gzn', desc = 'Update `MiniSurround.config.n_lines`' },
    },
    opts = {
      mappings = {
        add = 'gza', -- Add surrounding in Normal and Visual modes
        delete = 'gzd', -- Delete surrounding
        find = 'gzf', -- Find surrounding (to the right)
        find_left = 'gzF', -- Find surrounding (to the left)
        highlight = 'gzh', -- Highlight surrounding
        replace = 'gzr', -- Replace surrounding
        update_n_lines = 'gzn', -- Update `n_lines`
      },
    },
    config = function(_, opts)
      -- use gz mappings instead of s to prevent conflict wit leap
      require('mini.surround').setup(opts)
    end,
  },

  -- better text-objects
  {
    'echasnovski/mini.ai',
    keys = {
      { 'a', mode = { 'x', 'o' } },
      { 'i', mode = { 'x', 'o' } },
    },
    event = 'VeryLazy',
    dependencies = {
      {
        'nvim-treesitter/nvim-treesitter-textobjects',
        init = function()
          -- no need to load the plugin, since we only need its queries
          require('lazy.core.loader').disable_rtp_plugin('nvim-treesitter-textobjects')
        end,
      },
    },
    opts = function()
      local ai = require('mini.ai')
      return {
        n_lines = 500,
        custom_textobjects = {
          o = ai.gen_spec.treesitter({
            a = { '@block.outer', '@conditional.outer', '@loop.outer' },
            i = { '@block.inner', '@conditional.inner', '@loop.inner' },
          }, {}),
          f = ai.gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }, {}),
          c = ai.gen_spec.treesitter({ a = '@class.outer', i = '@class.inner' }, {}),
        },
      }
    end,
    -- config = function(_, opts)
    --   require("mini.ai").setup(opts)
    --   -- register all text objects with which-key
    --   ---@type table<string, string|table>
    --   local i = {
    --     [" "] = "Whitespace",
    --     ['"'] = 'Balanced "',
    --     ["'"] = "Balanced '",
    --     ["`"] = "Balanced `",
    --     ["("] = "Balanced (",
    --     [")"] = "Balanced ) including white-space",
    --     [">"] = "Balanced > including white-space",
    --     ["<lt>"] = "Balanced <",
    --     ["]"] = "Balanced ] including white-space",
    --     ["["] = "Balanced [",
    --     ["}"] = "Balanced } including white-space",
    --     ["{"] = "Balanced {",
    --     ["?"] = "User Prompt",
    --     _ = "Underscore",
    --     a = "Argument",
    --     b = "Balanced ), ], }",
    --     c = "Class",
    --     f = "Function",
    --     o = "Block, conditional, loop",
    --     q = "Quote `, \", '",
    --     t = "Tag",
    --   }
    --   local a = vim.deepcopy(i)
    --   for k, v in pairs(a) do
    --     a[k] = v:gsub(" including.*", "")
    --   end
    --
    --   local ic = vim.deepcopy(i)
    --   local ac = vim.deepcopy(a)
    --   for key, name in pairs({ n = "Next", l = "Last" }) do
    --     i[key] = vim.tbl_extend("force", { name = "Inside " .. name .. " textobject" }, ic)
    --     a[key] = vim.tbl_extend("force", { name = "Around " .. name .. " textobject" }, ac)
    --   end
    --   require("which-key").add({
    --     mode = { "o", "x" },
    --     i = i,
    --     a = a,
    --   })
    -- end,
  },

  {
    'folke/todo-comments.nvim',
    cmd = { 'TodoTrouble', 'TodoTelescope' },
    event = { 'BufReadPost', 'BufNewFile' },
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = true,
    -- stylua: ignore
    keys = {
      { "]t",         function() require("todo-comments").jump_next() end,                              desc = "Next todo comment" },
      { "[t",         function() require("todo-comments").jump_prev() end,                              desc = "Previous todo comment" },
      { "<leader>xT", "<cmd>TodoTrouble<cr>",                                                           desc = "Todo" },
      { "<leader>xt", "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME,NOTE}} focus=true<cr>", desc = "Todo/Fix/Fixme" },
      { "<leader>ft", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>",                                 desc = "Todo" },
    },
  },

  {
    'eero-lehtinen/oklch-color-picker.nvim',
    keys = { '<leader>cc' },
    config = function()
      require('oklch-color-picker').setup({})
      vim.keymap.set('n', '<leader>cc', function()
        require('oklch-color-picker').pick_under_cursor()
      end, { desc = 'Color pick under cursor' })
    end,
  },
}
