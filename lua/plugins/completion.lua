return {
  'saghen/blink.cmp',
  lazy = false, -- lazy loading handled internally
  dependencies = { 'rafamadriz/friendly-snippets', 'mikavilpas/blink-ripgrep.nvim' },
  -- use a release tag to download pre-built binaries
  version = 'v0.*',

  opts_extend = { 'sources.default' },

  ---@module 'blink.cmp'
  ---@type blink.cmp.config
  opts = {
    keymap = { preset = 'super-tab' },
    appearence = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono',
    },
    signature = {
      enabled = true,
      window = { border = 'rounded', winblend = 0 },
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer', 'ripgrep' },
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
      },
      keymap = {
        ['<c-g>'] = {
          function()
            require('blink-cmp').show({ sources = { 'ripgrep' } })
          end,
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
        auto_show = true,
        window = { border = 'rounded', winblend = 0 },
      },
    },
  },
}
