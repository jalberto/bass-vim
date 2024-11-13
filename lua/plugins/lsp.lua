return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },

    -- opts = {
    --   ui = { border = "rounded"},
    --   ensure_installed = {
    --     "shellcheck",
    --     "shfmt",
    --   },
    -- },

    config = function()
      local mason = require("mason")
      local mason_lspconfig = require("mason-lspconfig")
      local mason_tool_installer = require("mason-tool-installer")

      -- enable mason and configure icons
      mason.setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
      mason_lspconfig.setup({
        -- list of servers for mason to install
        ensure_installed = {
          -- "html",
          -- "cssls",
          -- "tailwindcss",
          -- "lua_ls",
          -- "pyright",
          -- "bashls",
        },
        automatic_installation = true, -- not the same as ensure_installed
      })

      -- mason_lspconfig.setup_handlers {
      --   -- The first entry (without a key) will be the default handler
      --   -- and will be called for each installed server that doesn't have
      --   -- a dedicated handler.
      --   function (server_name) -- default handler (optional)
      --     require("lspconfig")[server_name].setup {}
      --   end,
      --   -- Next, you can provide a dedicated handler for specific servers.
      --   -- For example, a handler override for the `rust_analyzer`:
      --   -- ["rust_analyzer"] = function ()
      --   --   require("rust-tools").setup {}
      --   -- end
      -- }

      mason_tool_installer.setup({
        ensure_installed = {
          "prettier", -- prettier formatter
        },
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      'saghen/blink.cmp',
      { "antosha417/nvim-lsp-file-operations", config = true },
    },
    opts = {
      -- options for vim.diagnostic.config()
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 4, prefix = "●" },
        -- virtual_text = false,
        severity_sort = true,
        signs = true,
      },
      -- Automatically format on save
      autoformat = false,
      -- options for vim.lsp.buf.format
      -- format = {
      --   formatting_options = nil,
      --   timeout_ms = nil,
      -- },
      -- LSP Server Settings
      ---@type lspconfig.options
      servers = {
        -- elixirls = {},
        solargraph = {},
        ruby_lsp = {},
        html = {},
        cssls = {},
        tailwindcss ={},
        bashls = {},
        dockerls = {},
        graphql = {},
        yamlls = {},
        emmet_language_server = {
          filetypes = {"css","eruby","html","sass","scss","heex","liquid"}
        },
        -- diagnosticls = {},
        quick_lint_js = {},
        jsonls = {},
        ts_ls = {},
        eslint = {},
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = {'vim'}
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
    },
    config = function(_, opts)
      local lspconfig = require("lspconfig")

      local keymap = vim.keymap -- for conciseness

      for server, config in pairs(opts.servers or {}) do
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end

    end
  },

  -- {
  --   "williamboman/mason.nvim",
  --   "williamboman/mason-lspconfig.nvim",
  --   "neovim/nvim-lspconfig",
  -- },

  -- {
  --   "neovim/nvim-lspconfig",
  --   event = { "BufReadPre", "BufNewFile" },
  --   dependencies = {
  --     "mason.nvim",
  --     "williamboman/mason-lspconfig.nvim",
  --     'saghen/blink.cmp',
  --   },
  --   config = function(_, opts)
  --     require("mason").setup()
  --     require("mason-lspconfig").setup()
  --
  --     require("mason-lspconfig").setup_handlers {
  --         -- The first entry (without a key) will be the default handler
  --         -- and will be called for each installed server that doesn't have
  --         -- a dedicated handler.
  --         function (server_name) -- default handler (optional)
  --             require("lspconfig")[server_name].setup {}
  --         end,
  --         -- Next, you can provide a dedicated handler for specific servers.
  --         -- For example, a handler override for the `rust_analyzer`:
  --         ["rust_analyzer"] = function ()
  --             require("rust-tools").setup {}
  --         end
  --     }
  --   end
  -- }

  -- lspconfig
  -- {
  --   "neovim/nvim-lspconfig",
  --   event = { "BufReadPre", "BufNewFile" },
  --   dependencies = {
  --     "mason.nvim",
  --     "williamboman/mason-lspconfig.nvim",
  --     -- "hrsh7th/cmp-nvim-lsp",
  --   },
  --   ---@class PluginLspOpts
  --   opts = {
  --     -- options for vim.diagnostic.config()
  --     diagnostics = {
  --       underline = true,
  --       update_in_insert = false,
  --       virtual_text = { spacing = 4, prefix = "●" },
  --       -- virtual_text = false,
  --       severity_sort = true,
  --       signs = true,
  --     },
  --     -- Automatically format on save
  --     autoformat = false,
  --     -- options for vim.lsp.buf.format
  --     -- format = {
  --     --   formatting_options = nil,
  --     --   timeout_ms = nil,
  --     -- },
  --     -- LSP Server Settings
  --     ---@type lspconfig.options
  --     servers = {
  --       -- elixirls = {},
  --       solargraph = {},
  --       html = {},
  --       cssls = {},
  --       dockerls = {},
  --       graphql = {},
  --       yamlls = {},
  --       emmet_language_server = {
  --         filetypes = {"css","eruby","html","sass","scss","heex","liquid"}
  --       },
  --       -- diagnosticls = {},
  --       quick_lint_js = {},
  --       jsonls = {},
  --       ts_ls = {},
  --       eslint = {},
  --       lua_ls = {
  --         settings = {
  --           Lua = {
  --             diagnostics = {
  --               globals = {'vim'}
  --             },
  --             workspace = {
  --               checkThirdParty = false,
  --               library = vim.api.nvim_get_runtime_file("", true),
  --             },
  --             completion = {
  --               callSnippet = "Replace",
  --             },
  --             telemetry = { enable = false }
  --           },
  --         },
  --       },
  --     },
  --     keys =  {
  --       { "<leader>cd", vim.diagnostic.open_float, desc = "Line Diagnostics" },
  --       { "<leader>cl", "<cmd>LspInfo<cr>", desc = "Lsp Info" },
  --       { "gd", "<cmd>Telescope lsp_definitions<cr>", desc = "Goto Definition" },
  --       { "gr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
  --       { "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
  --       { "gI", "<cmd>Telescope lsp_implementations<cr>", desc = "Goto Implementation" },
  --       { "gt", "<cmd>Telescope lsp_type_definitions<cr>", desc = "Goto Type Definition" },
  --       -- { "K", vim.lsp.buf.hover, desc = "Hover" },
  --       { "gK", vim.lsp.buf.signature_help, desc = "Signature Help", has = "signatureHelp" },
  --       { "<c-k>", vim.lsp.buf.signature_help, mode = "i", desc = "Signature Help", has = "signatureHelp" },
  --       { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" }, has = "codeAction" },
  --       -- { "cf", vim.lsp.buf.format({async=true}), desc = "Code Format", mode = {"n", "v"}},
  --       -- { "<leader>cf", format, desc = "Format Document", has = "documentFormatting" },
  --       -- { "<leader>cf", format, desc = "Format Range", mode = "v", has = "documentRangeFormatting" },
  --     },
  --   },
  --   ---@param opts PluginLspOpts
  --   config = function(_, opts)
  --
  --     local lspconfig = require('lspconfig')
  --
  --     -- diagnostics
  --     vim.diagnostic.config(opts.diagnostics)
  --     -- vim.api.nvim_create_autocmd({'CursorHold','CursorHoldI'}, {
  --     --   pattern = '*',
  --     --   callback = function()
  --     --     vim.diagnostic.open_float(nil, {focus=false,scope='cursor'})
  --     --   end
  --     -- })
  --
  --     local keymaps = opts.keys
  --     local servers = opts.servers
  --     -- local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
  --     -- local capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
  --
  --     local function on_attach(client, bufnr)
  --       -- require 'illuminate'.on_attach(client)
  --       -- require 'nvim-navic'.attach(client, bufnr)
  --       -- require "lsp-format".on_attach(client)
  --
  --       -- Mappings.
  --       -- See `:help vim.lsp.*` for documentation on any of the below functions
  --       local kopts = { noremap=true, silent=true, buffer=bufnr }
  --       for _, keys in pairs(keymaps) do
  --         vim.keymap.set(keys.mode or 'n', keys[1], keys[2], kopts)
  --       end
  --
  --     end
  --
  --     local function setup(server)
  --       local server_opts = vim.tbl_deep_extend("force",
  --         -- { capabilities = vim.deepcopy(capabilities), },
  --         { capabilities = require('blink.cmp').get_lsp_capabilities(server.capabilities) },
  --         servers[server] or {},
  --         { flags = { debounce_text_changes = 200 } },
  --         {on_attach = on_attach}
  --       )
  --
  --       lspconfig[server].setup(server_opts)
  --     end
  --
  --     local mlsp = require("mason-lspconfig")
  --     local available = mlsp.get_available_servers()
  --     local ensure_installed = {} ---@type string[]
  --
  --     for server, server_opts in pairs(servers) do
  --       if server_opts then
  --         server_opts = server_opts == true and {} or server_opts
  --         -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
  --         if server_opts.mason == false or not vim.tbl_contains(available, server) then
  --           setup(server)
  --         else
  --           ensure_installed[#ensure_installed + 1] = server
  --         end
  --       end
  --     end
  --
  --     mlsp.setup({ ensure_installed = ensure_installed })
  --     mlsp.setup_handlers({ setup })
  --   end,
  -- },

  -- cmdline tools and lsp servers
  -- {
  --   "williamboman/mason.nvim",
  --   cmd = "Mason",
  --   keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
  --   opts = {
  --     ui = { border = "rounded"},
  --     ensure_installed = {
  --       "shellcheck",
  --       "shfmt",
  --     },
  --   },
  --   ---@param opts MasonSettings | {ensure_installed: string[]}
  --   config = function(plugin, opts)
  --     require("mason").setup(opts)
  --     local mr = require("mason-registry")
  --     for _, tool in ipairs(opts.ensure_installed) do
  --       local p = mr.get_package(tool)
  --       if not p:is_installed() then
  --         p:install()
  --       end
  --     end
  --   end,
  -- },
}
