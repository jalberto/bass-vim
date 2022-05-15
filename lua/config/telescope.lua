#!/usr/bin/env lua

local deepcopy = vim.deepcopy
local actions = require('telescope.actions')
local finders = require "telescope.finders"

local dropdown_theme = require("telescope.themes").get_dropdown {
  layout_config = {
    width = 0.8,
    height = 20,
  },
  file_sorter = require("telescope.sorters").get_fuzzy_file,
  -- borderchars = {
  --   results = { "▔", "▕", "▁", "▏", "🭽", "🭾", "🭿", "🭼" },
  --   prompt = { "▔", "▕", "▁", "▏", "🭽", "🭾", "🭿", "🭼" },
  -- },
}

require('telescope').setup{
  defaults = require('telescope.themes').get_dropdown {
    set_env = { ["COLORTERM"] = "truecolor" },
    color_devicons = true,
    winblend = 5;
    width = 0.8;
    show_line = false;
    prompt_prefix = " ",
    prompt_title = false,
    results_title = false,
    preview_title = false,
    -- selection_caret = "  ",
    -- borderchars = {
    --   prompt = {'▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' };
    --   results = {'▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' };
    --   preview = {'▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' };
    -- };
    path_display = { "truncate" },
    sorting_strategy = "ascending",
    initial_mode = "insert",
    selection_strategy = "reset",
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = { "node_modules", "*.git/*", "*/tmp/*", ".cache"},
    -- use_less = true,
    -- layout_config = {
    --   vertical = {
    --     mirror = false,
    --   },
      -- width = 0.87,
      -- height = 0.80,
      -- preview_cutoff = 120
    -- },
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
