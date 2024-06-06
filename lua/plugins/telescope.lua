return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make',
        config = function()
          require("telescope").load_extension("fzf")
        end
      },
      { 'nvim-telescope/telescope-ui-select.nvim',
        config = function()
          require("telescope").load_extension("ui-select")
        end
      },
    },
    cmd = "Telescope",
    version = false, -- telescope did only one release, so use HEAD for now
    keys = {
      { "<leader><leader>", "<cmd>Telescope git_files<cr>", desc = "File selector (git)" },
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "File selector" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Find in Files (Grep)" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
      { "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
      { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      -- git
      -- { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
      -- { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },
      -- search
      { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
      { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
      -- Code
      { "<leader>ca", "<Cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Apply Code Actions" },
      { "<leader>cs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Goto Symbol" },
    },
    opts = {
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        color_devicons = false,
        prompt_title = '',
        results_title = '',
        preview_title = 'true',
        path_display = { "truncate" },
        file_ignore_patterns = { "node_modules", "*.git/*", "*/tmp/*", ".cache"},
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--trim",
        },
        mappings = {
          i = {
            -- ["<c-t>"] = function(...)
            --   return require("trouble.providers.telescope").open_with_trouble(...)
            -- end,
            -- ["<a-i>"] = function()
            --   Util.telescope("find_files", { no_ignore = true })()
            -- end,
            -- ["<a-h>"] = function()
            --   Util.telescope("find_files", { hidden = true })()
            -- end,
            ["<C-Down>"] = function(...)
              return require("telescope.actions").cycle_history_next(...)
            end,
            ["<C-Up>"] = function(...)
              return require("telescope.actions").cycle_history_prev(...)
            end,
            ["<C-j>"] = function(...)
              return require("telescope.actions").cycle_history_next(...)
            end,
            ["<C-k>"] = function(...)
              return require("telescope.actions").cycle_history_prev(...)
            end,
            ["<C-f>"] = function(...)
              return require("telescope.actions").preview_scrolling_down(...)
            end,
            ["<C-b>"] = function(...)
              return require("telescope.actions").preview_scrolling_up(...)
            end,
            ["<C-s>"] = function(...)
              return require("telescope.actions").select_vertical(...)
            end,
            ["<esc>"] = function(...)
              return require("telescope.actions").close(...)
            end,
          },
          n = {
            ["q"] = function(...)
              return require("telescope.actions").close(...)
            end,
          },
        },
      },
    },
  },
}
