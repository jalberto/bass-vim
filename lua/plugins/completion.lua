return {
  'saghen/blink.cmp',
  lazy = false, -- lazy loading handled internally
  dependencies = { 'rafamadriz/friendly-snippets', 'niuiic/blink-cmp-rg.nvim' },
  -- use a release tag to download pre-built binaries
  version = 'v0.*',

  ---@module 'blink.cmp'
  ---@type blink.cmp.config
  opts = {
    keymap = { preset = 'super-tab' },
    highlight = {
      -- sets the fallback highlight groups to nvim-cmp's highlight groups
      -- useful for when your theme doesn't support blink.cmp
      -- will be removed in a future release, assuming themes add support
      use_nvim_cmp_as_default = true,
    },
    -- set to 'mono' for 'nerd font mono' or 'normal' for 'nerd font'
    -- adjusts spacing to ensure icons are aligned
    nerd_font_variant = 'mono',
    -- experimental auto-brackets support
    accept = { auto_brackets = { enabled = true } },
    -- experimental signature help support
    trigger = { signature_help = { enabled = true } },

    sources = {
      completion = {
        enabled_providers = { 'lsp', 'path', 'snippets', 'buffer', 'ripgrep' },
      },
      providers = {
        ripgrep = {
          module = 'blink-cmp-rg',
          name = 'Ripgrep',
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

    windows = {
      autocomplete = {
        border = 'rounded',
      },
      documentation = {
        border = 'rounded',
        auto_show = true,
        auto_show_delay_ms = 1000,
      },
      signature_help = {
        border = 'rounded',
      },
      -- allows extending the enabled_providers array elsewhere in your config
      -- without having to redefining it
      opts_extend = { 'sources.completion.enabled_providers' },
    },
  },
}
