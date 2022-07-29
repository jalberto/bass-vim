local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("mason").setup()

-- LSP
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

-- require'lspconfig'.elixirls.setup{
--   cmd = { "/home/ja/Projects/elixir-ls/language_server.sh" };
-- }

-- Set which codelens text levels to show
local original_set_virtual_text = vim.lsp.diagnostic.set_virtual_text
local set_virtual_text_custom = function(diagnostics, bufnr, client_id, sign_ns, opts)
    opts = opts or {}
    -- show all messages that are Warning and above (Warning, Error)
    opts.severity_limit = "Warning"
    original_set_virtual_text(diagnostics, bufnr, client_id, sign_ns, opts)
end

vim.lsp.diagnostic.set_virtual_text = set_virtual_text_custom

-- LspInstall config
-- https://github.com/williamboman/nvim-lsp-installer/wiki/Advanced-Configuration#automatically-install-lsp-servers
local function setup_servers()
  require("mason-lspconfig").setup({
    automatic_installation = true
  })
  -- require("nvim-lsp-installer").setup {
  --   automatic_installation = true,
  -- }
  -- local lspconfig = require("lspconfig")
  -- local lsp_installer = require "nvim-lsp-installer"
  local servers = { "elixirls", "solargraph", "html", "cssls", "dockerls", "graphql", "jsonls", "sumneko_lua", "vuels", "yamlls", "diagnosticls", "emmet_ls", "quick_lint_js", "tsserver" }

  local function on_attach(client, bufnr)
    require 'illuminate'.on_attach(client)
    require 'nvim-navic'.attach(client, bufnr)
    -- require "lsp-format".on_attach(client)

    -- Set up buffer-local keymaps (vim.api.nvim_buf_set_keymap()), etc.
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap=true, silent=true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    -- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    -- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    -- buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.get_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.get_next()<CR>', opts)
    -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    -- buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', '<space>cf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    buf_set_keymap('n', '<space>ct', '<cmd>TroubleToggle<CR>', opts)
  end

  for _, server in ipairs(servers) do
  -- required for nmv-cmp
    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

    -- Specify the default options which we'll use to setup all servers
    local default_opts = {
      on_attach = on_attach,
      capabilities = capabilities,
      flags = {
        debounce_text_changes = 200,
      }
    }
    -- Now we'll create a server_opts table where we'll specify our custom LSP server configuration
    local server_opts = {
      ["emmet_ls"] = function()
        default_opts.filetypes = { "html","heex","css" }
      end,
      ["html"] = function()
        default_opts.filetypes = { "html","heex" }
      end,
      ["elixirls"] = function()
        default_opts.cmd = { "/home/ja/Projects/elixir-ls/language_server.sh" }
      end,
    }

    -- Use the server's custom settings, if they exist, otherwise default to the default options
    local server_options = server_opts[server] and server_opts[server]() or default_opts
    lspconfig[server].setup(server_options)
  end
end

setup_servers()

-- Cmp setup
vim.o.completeopt = "menu,menuone,noselect"

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp = require'cmp'
local luasnip = require'luasnip'
local lspkind = require('lspkind')
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  formatting = {
    format = lspkind.cmp_format({with_text = false, maxwidth = 50})
  },
  mapping = {
    -- ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    -- ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    -- ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- If you want to remove the default `<C-y>` mapping, You can specify `cmp.config.disable` value.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    -- ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' })
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'treesitter' },
    { name = 'buffer' },
  })
}

-- Use buffer source for `/`.
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Icons to use
vim.fn.sign_define(
  "LspDiagnosticsSignError",
  { texthl = "LspDiagnosticsSignError", text = "", numhl = "LspDiagnosticsSignError" }
)
vim.fn.sign_define(
  "LspDiagnosticsSignWarning",
  { texthl = "LspDiagnosticsSignWarning", text = "", numhl = "LspDiagnosticsSignWarning" }
)
vim.fn.sign_define(
  "LspDiagnosticsSignHint",
  { texthl = "LspDiagnosticsSignHint", text = "", numhl = "LspDiagnosticsSignHint" }
)
vim.fn.sign_define(
  "LspDiagnosticsSignInformation",
  { texthl = "LspDiagnosticsSignInformation", text = "", numhl = "LspDiagnosticsSignInformation" }
)

-- require("null-ls").config({
--   debug = true,
--   sources = {
--     require("null-ls").builtins.formatting.prettier,
--     require("null-ls").builtins.formatting.eslint_d,
--     -- require("null-ls").builtins.formatting.mix,
--     require("null-ls").builtins.diagnostics.codespell,
--     require("null-ls").builtins.diagnostics.write_good,
--     require("null-ls").builtins.diagnostics.eslint.with({command = "eslint_d"}),
--     require("null-ls").builtins.diagnostics.stylelint,
--     require("null-ls").builtins.diagnostics.standardrb,
--     require("null-ls").builtins.diagnostics.credo,
--     require("null-ls").builtins.code_actions.gitsigns,
--   }
-- })
--
-- require("lspconfig")["null-ls"].setup({
--   -- Auto format on write
--   -- on_attach = function(client)
--   --   if client.resolved_capabilities.document_formatting then
--   --       vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
--   --   end
--   -- end
-- })

-- LSP Config
-- Defaults diagnostics display
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = false,
  signs = true,
  underline = false,
  update_in_insert = false,
  -- float = {
  --   show_header = true,
  --   source = 'if_many',
  --   border = 'rounded',
  --   focusable = false
  -- }
})

-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil,{focus=false,scope=cursor})]]

-- LightBulb
vim.cmd [[autocmd CursorHold,CursorHoldI * lua require('nvim-lightbulb').update_lightbulb()]]

-- Keymaps
-- vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

-- Trouble list
-- vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
--   {silent = true, noremap = true}
-- )
-- vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>",
--   {silent = true, noremap = true}
-- )
