local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    -- show_line = false,
    color_devicons = false,
    prompt_prefix = " ",
    prompt_title = '',
    results_title = '',
    preview_title = '',
    path_display = { "truncate" },
    file_ignore_patterns = { "node_modules", "*.git/*", "*/tmp/*", ".cache"},
  --   sorting_strategy = "ascending",
  --   initial_mode = "insert",
  --   selection_strategy = "reset",
    -- file_sorter = mysorter.frecency_sorter,
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
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<esc>"] = actions.close
      },
    },
  }
}

require('telescope').load_extension('fzf')
require("telescope").load_extension("ui-select")
