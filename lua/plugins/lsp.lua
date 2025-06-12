return {
  -- Mason + LSP requires a specific dependency order
  {
    'mason-org/mason.nvim',
    cmd = 'Mason',
    build = ':MasonUpdate',
    keys = { { '<leader>cm', '<cmd>Mason<cr>', desc = 'Mason' } },
    opts = {
      ui = {
        border = 'rounded',
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    },
  },

  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    opts = {
      -- ensure_installed = {
      --   "prettier", -- prettier formatter
      --   "stylua", -- lua formatter
      --   "eslint_d", -- js/ts linter
      --   "shellcheck", -- shell script linter
      --   "shfmt", -- shell script formatter
      --   "erb-formatter",
      --   "rubocop,",
      -- },
    },
    -- config = function(_, opts)
    --   require("mason-tool-installer").setup(opts)
    -- end,
  },
  {
    'mason-org/mason-lspconfig.nvim',
    dependencies = {
      'mason-org/mason.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
    },

    opts = {
      -- list of servers for mason to install
      -- the list is in lspconfig and installed by `automatic_installation`
      ensure_installed = {
        -- "lua_ls",
      },
    },
  },

  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      {
        'mason-org/mason-lspconfig.nvim',
        dependencies = { 'mason-org/mason.nvim' },
      },
      { 'antosha417/nvim-lsp-file-operations', config = true },
      'saghen/blink.cmp',
    },
    opts = {
      -- options for vim.lsp.buf.format
      autoformat = false,
      format = {
        formatting_options = {
          insertSpaces = true,
          -- tabSize = vim.bo.shiftwidth,
          trimTrailingWhitespace = true,
          insertFinalNewline = true,
        },
        timeout_ms = 3000,
      },
      -- options for vim.diagnostic.config()
      diagnostics = {
        underline = true,
        update_in_insert = false,
        -- virtual_text = { spacing = 4, prefix = "●" },
        virtual_text = false,
        severity_sort = true,
        signs = true,
        float = {
          border = 'rounded',
          source = 'always',
        },
      },
      -- LSP Server Settings
      servers = {
        elixirls = {},
        solargraph = {},
        ruby_lsp = {},
        html = {},
        cssls = {
          filetypes = { 'css', 'sass', 'scss' },
        },
        emmet_language_server = {
          filetypes = { 'css', 'eruby', 'html', 'sass', 'scss', 'heex', 'liquid', 'javascript', 'elixir' },
        },
        bashls = {},
        dockerls = {},
        graphql = {},
        yamlls = {},
        quick_lint_js = {},
        jsonls = {},
        ts_ls = {},
        astro = {},
        eslint = {
          -- filetypes = {
          --   'javascript',
          --   'javascriptreact',
          --   'javascript.jsx',
          --   'typescript',
          --   'typescriptreact',
          --   'typescript.tsx',
          --   'vue',
          --   'svelte',
          --   'astro',
          -- },
        },
        lua_ls = {
          settings = {
            Lua = {
              runtime = {
                version = 'LuaJIT',
              },
              diagnostics = {
                globals = { 'vim' },
              },
              workspace = {
                checkThirdParty = false,
                library = vim.api.nvim_get_runtime_file('', true),
              },
              completion = {
                callSnippet = 'Replace',
              },
              telemetry = { enable = false },
            },
          },
        },
      },
      keys = {
        { '<leader>cd', vim.lsp.buf.declaration, desc = 'Goto Declaration' },
        -- { "K", vim.lsp.buf.hover, desc = "Hover" },
        -- { "gK",         vim.lsp.buf.signature_help,                desc = "Signature Help" },
        { '<c-k>', vim.lsp.buf.signature_help, desc = 'Signature Help', mode = 'i' },
        { '<leader>cl', '<cmd>LspInfo<cr>', desc = 'Lsp Info' },
        {
          '<leader>ca',
          vim.lsp.buf.code_action,
          desc = 'Code Actions',
          mode = { 'n', 'v' },
        },
        { '<leader>cd', vim.diagnostic.open_float, desc = 'Line Diagnostics' },
        { '<leader>cr', vim.lsp.buf.rename, desc = 'Code Rename' },
        -- { "<leader>cf", vim.lsp.buf.format({ async = true }),      desc = "Code Format",         mode = { "n", "v" } },
        -- { "<leader>cf", format, desc = "Format Document", has = "documentFormatting" },
        -- { "<leader>cf", format, desc = "Format Range", mode = "v", has = "documentRangeFormatting" },
      },
    },
    config = function(_, opts)
      -- local mason = require("mason")
      -- local mason_lspconfig = require("mason-lspconfig")
      local mason_tool_installer = require('mason-tool-installer')
      local lspconfig = require('lspconfig')

      local function on_attach(_, bufnr) -- (client, bufnr)
        -- Mappings.
        local kopts = { noremap = true, silent = true, buffer = bufnr }
        for _, keys in pairs(opts.keys) do
          if keys[2] then -- Only set keybinding if the command/function exists
            kopts.desc = keys.desc
            vim.keymap.set(keys.mode or 'n', keys[1], keys[2], kopts)
          end
        end
      end

      -- Disable autoformat
      vim.g.autoformat = false

      vim.diagnostic.config(opts.diagnostics)
      local signs = { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }
      for type, icon in pairs(signs) do
        local hl = 'DiagnosticSign' .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
      end

      for server, config in pairs(opts.servers or {}) do
        -- for aucompletion
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        config.flags = { debounce_text_changes = 200 }
        config.on_attach = on_attach

        lspconfig[server].setup(config)
      end

      mason_tool_installer.setup({
        ensure_installed = {
          'prettier', -- prettier formatter
          { 'stylua' }, -- lua formatter
          'eslint_d', -- js/ts linter
          'shellcheck', -- shell script linter
          'shfmt', -- shell script formatter
          'erb-formatter',
          'rubocop',
          'astro',
        },
      })
    end,
  },

  -- trying to avoid autoformat issues
  -- NOTE: for some reason withtou this I am not able to disable auto format
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>cf',
        function()
          require('conform').format({ async = true })
        end,
        mode = 'n',
        desc = 'Format buffer',
      },
      {
        '<leader>cf',
        function()
          require('conform').format({ async = false })
        end,
        mode = 'v',
        desc = 'Format selection',
      },
    },
    -- This will provide type hinting with LuaLS
    opts = {
      log_level = vim.log.levels.DEBUG,
      -- Define your formatters
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'isort', 'black' },
        javascript = { 'prettier', stop_after_first = true },
        typescript = { 'prettier' },
        astro = { 'prettier' },
        css = { 'prettier' },
        html = { 'prettier' },
        json = { 'prettier' },
        yaml = { 'prettier' },
        markdown = { 'prettier' },
        graphql = { 'prettier' },
        ruby = { 'rubocop' },
        erb = { 'erb-formatter' },
      },
      -- Set default options
      default_format_opts = {
        lsp_format = 'fallback',
      },
      -- Set up format-on-save
      -- format_on_save = { timeout_ms = 500 },
      format_on_save = function(bufnr)
        -- Disable autoformat on certain filetypes
        local ignore_filetypes = { 'java', 'ruby', 'sass' }
        if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
          return
        end
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        -- Disable autoformat for files in certain paths
        local bufname = vim.api.nvim_buf_get_name(bufnr)
        if bufname:match('/node_modules/') or bufname:match('/vendor/') then
          return
        end
        -- ...additional logic...
        return { timeout_ms = 500, lsp_format = 'fallback' }
      end,
      -- Customize formatters
      formatters = {
        -- shfmt = { prepend_args = { "-i", "2" }, },
        stylua = { prepend_args = { '--indent-type', 'Spaces', '--indent-width', vim.o.shiftwidth } },
        prettier = {
          args = function(self, ctx)
            if vim.endswith(ctx.filename, '.astro') then
              return {
                '--stdin-filepath',
                '$FILENAME',
                '--plugin',
                'prettier-plugin-astro',
              }
            end
            return { '--stdin-filepath', '$FILENAME', '--plugin', 'prettier-plugin-astro' }
          end,
        },
      },
    },
    init = function()
      -- If you want the formatexpr, here is the place to set it
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
    config = function(_, opts)
      require('conform').setup(opts)

      vim.api.nvim_create_user_command('FormatDisable', function(args)
        if args.bang then
          -- FormatDisable! will disable formatting just for this buffer
          vim.b.disable_autoformat = true
        else
          vim.g.disable_autoformat = true
        end
      end, {
        desc = 'Disable autoformat-on-save',
        bang = true,
      })
      vim.api.nvim_create_user_command('FormatEnable', function()
        vim.b.disable_autoformat = false
        vim.g.disable_autoformat = false
      end, {
        desc = 'Re-enable autoformat-on-save',
      })
    end,
  },
}
