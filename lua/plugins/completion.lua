return {
  'saghen/blink.cmp',
  lazy = false, -- lazy loading handled internally
  dependencies = { 'rafamadriz/friendly-snippets', 'niuiic/blink-cmp-rg.nvim' },
  -- use a release tag to download pre-built binaries
  version = 'v0.*',

  opts_extend = { 'sources.default' },

  ---@module 'blink.cmp'
  ---@type blink.cmp.config
  opts = {
    keymap = { preset = 'super-tab' },

    completion = {

      appearence = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = 'mono',
      },

      menu = { border = 'rounded', winblend = 0 },

      signature = {
        enabled = true,
        window = { border = 'rounded', winblend = 0 },
        -- auto_show_delay_ms = 200,
      },

      documentation = {
        auto_show = true,
        window = { border = 'rounded', winblend = 0 },
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', 'ripgrep' },
        providers = {
          ripgrep = {
            name = 'Ripgrep',
            module = 'blink-cmp-rg',
            opts = {
              prefix_min_len = 3,
              get_command = function(context, prefix)
                return {
                  'rg',
                  '--no-config',
                  '--json',
                  '--word-regexp',
                  '--ignore-case',
                  '--',
                  prefix .. '[\\w_-]+',
                  vim.fs.root(0, '.git') or vim.fn.getcwd(),
                }
              end,
              get_prefix = function(context)
                return context.line:sub(1, context.cursor[2]):match('[%w_-]+$') or ''
              end,
            },
          },
        },
      },
    },
  },
}
