return {
  -- Mason + LSP requires a specific dependency order
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    opts = {
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- FIXME: I think this doesn't work, probably needs to be in a ''config' function
    opts = {
      ensure_installed = {
        "prettier",   -- prettier formatter
        "stylua",     -- lua formatter
        "eslint_d",   -- js/ts linter
        "shellcheck", -- shell script linter
        "shfmt",      -- shell script formatter
      },
    }
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },

    opts = {
      -- list of servers for mason to install
      -- the list is in lspconfig and installed by `automatic_installation`
      ensure_installed = {
        -- "lua_ls",
      },
      automatic_installation = true, -- installs LSPs on demand
    }
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      {
        'williamboman/mason-lspconfig.nvim',
        dependencies = { 'williamboman/mason.nvim' },
      },
      { "antosha417/nvim-lsp-file-operations", config = true },
      'saghen/blink.cmp',
    },
    opts = {
      -- options for vim.lsp.buf.format
      autoformat = false,
      format = {
        formatting_options = {
          insertSpaces = true,
          tabSize = vim.bo.shiftwidth,
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
          border = "rounded",
          source = "always",
        },
      },
      -- LSP Server Settings
      servers = {
        elixirls = {},
        solargraph = {},
        ruby_lsp = {},
        html = {},
        cssls = {},
        tailwindcss = {},
        bashls = {},
        dockerls = {},
        graphql = {},
        yamlls = {},
        emmet_language_server = {
          filetypes = { "css", "eruby", "html", "sass", "scss", "heex", "liquid" }
        },
        quick_lint_js = {},
        jsonls = {},
        ts_ls = {},
        eslint = {},
        lua_ls = {
          settings = {
            Lua = {
              runtime = {
                version = 'LuaJIT'
              },
              diagnostics = {
                globals = { 'vim' }
              },
              workspace = {
                checkThirdParty = false,
                library = vim.api.nvim_get_runtime_file("", true),
              },
              completion = {
                callSnippet = "Replace",
              },
              telemetry = { enable = false }
            },
          },
        },
      },
      keys = {
        { "gd",         "<cmd>Telescope lsp_definitions<cr>",      desc = "Goto Definition" },
        { "gr",         "<cmd>Telescope lsp_references<cr>",       desc = "References" },
        { "gI",         "<cmd>Telescope lsp_implementations<cr>",  desc = "Goto Implementation" },
        { "gt",         "<cmd>Telescope lsp_type_definitions<cr>", desc = "Goto Type Definition" },
        { "gD",         vim.lsp.buf.declaration,                   desc = "Goto Declaration" },
        -- { "K", vim.lsp.buf.hover, desc = "Hover" },
        -- { "gK",         vim.lsp.buf.signature_help,                desc = "Signature Help" },
        { "<c-k>",      vim.lsp.buf.signature_help,                desc = "Signature Help",      mode = "i" },
        { "<leader>cl", "<cmd>LspInfo<cr>",                        desc = "Lsp Info" },
        { "<leader>ca", vim.lsp.buf.code_action,                   desc = "Code Actions",        mode = { "n", "v" } },
        { "<leader>cd", vim.diagnostic.open_float,                 desc = "Line Diagnostics" },
        { "<leader>cr", vim.lsp.buf.rename,                        desc = "Code Rename" },
        { "<leader>cf", vim.lsp.buf.format({ async = true }),      desc = "Code Format",         mode = { "n", "v" } },
        -- { "<leader>cf", format, desc = "Format Document", has = "documentFormatting" },
        -- { "<leader>cf", format, desc = "Format Range", mode = "v", has = "documentRangeFormatting" },
      },
    },
    config = function(_, opts)
      -- local mason = require("mason")
      -- local mason_lspconfig = require("mason-lspconfig")
      local mason_tool_installer = require("mason-tool-installer")
      local lspconfig = require("lspconfig")

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

      vim.diagnostic.config(opts.diagnostics)
      local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      for server, config in pairs(opts.servers or {}) do
        -- for aucompletion
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        config.flags = { debounce_text_changes = 200 }
        config.on_attach = on_attach

        lspconfig[server].setup(config)
      end
    end
  },

  -- better diagnostics list and others
  {
    "folke/trouble.nvim",
    cmd = { "Trouble" },
    opts = {
      auto_open = false,
      auto_close = true,
      use_diagnostic_signs = true,
      auto_fold = false,
      focus = true,
      max_items = 50,
      modes = {
        cascade = {
          mode = "diagnostics", -- inherit from diagnostics mode
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
      { "<leader>xx", "<cmd>Trouble cascade toggle<cr>",                                                     desc = "Diagnostics" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",                                    desc = "Buffer Diagnostics" },
      -- { "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
      { "<leader>xL", "<cmd>Trouble lsp toggle focus=false win.position=right filter.buf=0 pinned=true<cr>", desc = "LSP (Trouble)" },
      { "<leader>xQ", "<cmd>Trouble quickfix toggle<cr>",                                                    desc = "Quickfix List (Trouble)" },
    },
  },

}
