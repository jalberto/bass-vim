return {
  {
    'nvim-treesitter/nvim-treesitter',
    -- version = false, -- last release is way too old and doesn't work on Windows
    dependencies = {
      'ziontee113/syntax-tree-surfer',
      'windwp/nvim-ts-autotag',
      'nvim-treesitter/nvim-treesitter-context',
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' },
    keys = {
      { '<c-space>', desc = 'Increment selection' },
      { '<bs>', desc = 'Schrink selection', mode = 'x' },
    },
    opts = {
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        'bash',
        'html',
        'javascript',
        'json',
        'lua',
        'markdown',
        'markdown_inline',
        'query',
        'regex',
        'vim',
        'yaml',
        'elixir',
        'ruby',
        'heex',
        'eex',
        'css',
        'scss',
        'dockerfile',
        'vimdoc',
        'surface',
        'astro',
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<C-space>',
          node_incremental = '<C-space>',
          scope_incremental = '<nop>',
          node_decremental = '<bs>',
        },
      },
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
      require('nvim-ts-autotag').setup()
      vim.g.skip_ts_context_commentstring_module = true
      vim.opt.foldmethod = 'expr'
      vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

      -- Integrate context commentstring with native comment tool
      -- https://github.com/JoosepAlviste/nvim-ts-context-commentstring/wiki/Integrations#native-commenting-in-neovim-010
      require('ts_context_commentstring').setup({
        enable_autocmd = false,
      })
      local get_option = vim.filetype.get_option
      vim.filetype.get_option = function(filetype, option)
        return option == 'commentstring' and require('ts_context_commentstring.internal').calculate_commentstring()
          or get_option(filetype, option)
      end
    end,
  },
}
