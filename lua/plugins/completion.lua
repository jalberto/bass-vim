return {
  'saghen/blink.cmp',
  lazy = false, -- lazy loading handled internally
  dependencies = { 'rafamadriz/friendly-snippets', 'mikavilpas/blink-ripgrep.nvim' },
  -- use a release tag to download pre-built binaries
  version = '*',

  opts_extend = { 'sources.default' },
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- keymap = { preset = 'super-tab' },
    keymap = {
      preset = 'super-tab',
      -- Manually invoke minuet completion.
      ['<A-y>'] = require('minuet').make_blink_map(),
    },
    -- appearence = {
    --   use_nvim_cmp_as_default = true,
    --   nerd_font_variant = 'mono',
    -- },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer', 'ripgrep', 'minuet' },
      providers = {
        ripgrep = {
          name = 'Ripgrep',
          module = 'blink-ripgrep',
          enabled = true,
          opts = {
            prefix_min_len = 3,
            context_size = 5,
            max_filesize = '1M',
            search_casing = '--smart-case',
            additional_rg_options = {},
          },
        },
        minuet = {
          name = 'minuet',
          module = 'minuet.blink',
          enabled = true,
          score_offset = 8, -- Gives minuet higher priority among suggestions
        },
      },
    },
    completion = {
      list = { max_items = 400 },
      menu = {
        border = 'rounded',
        winblend = 0,
        draw = { treesitter = { 'lsp' } },
      },
      documentation = {
        window = { border = 'rounded' },
        auto_show = true,
      },
      ghost_text = { enabled = true },
      trigger = { show_in_snippet = false },
    },
    signature = {
      enabled = true,
      window = { border = 'rounded', winblend = 0 },
    },
  },
}
