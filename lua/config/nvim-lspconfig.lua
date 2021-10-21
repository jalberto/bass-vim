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
-- https://github.com/kabouzeid/nvim-lspinstall#bundled-installers
local function setup_servers()
  local nvim_lsp = require('lspconfig')

  -- Install missing servers
  local required_servers = { "elixir", "ruby", "html", "css", "dockerfile", "graphql", "json", "lua", "vue", "yaml" }
  local installed_servers = require'lspinstall'.installed_servers()
  for _, server in pairs(required_servers) do
    if not vim.tbl_contains(installed_servers, server) then
      require'lspinstall'.install_server(server)
    end
  end

  require'lspinstall'.setup()

  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local on_attach = function(client, bufnr)
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
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    -- buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', '<space>cf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    buf_set_keymap('n', '<space>ct', '<cmd>TroubleToggle<CR>', opts)
  end

  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    nvim_lsp[server].setup{
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 200,
      }
    }
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

-- Compe setup
vim.o.completeopt = "menuone,noselect"

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 2;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    nvim_lsp = true;
    buffer = true;
    calc = true;
    emoji = true;
    tags = true;
    spell = true;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

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
-- Autopair + compe
require('nvim-autopairs.completion.compe').setup({
  map_cr = true,
  map_complete = true,
  auto_select = false
})

-- Lint / format
-- require('lint').linters_by_ft = {
--   ruby = {'ruby'},
--   markdown = {'vale', 'markdownlint'},
--   javascript = {'eslint'},
--   html = {'tidy'},
--   xml = {'tidy'}
-- }
-- vim.cmd [[autocmd BufWritePost * lua require('lint').try_lint()]]
require("null-ls").config({
  debug = true,
  sources = {
    require("null-ls").builtins.formatting.prettier,
    require("null-ls").builtins.formatting.eslint_d,
    -- require("null-ls").builtins.formatting.mix,
    require("null-ls").builtins.diagnostics.codespell,
    require("null-ls").builtins.diagnostics.write_good,
    require("null-ls").builtins.diagnostics.eslint.with({command = "eslint_d"}),
    require("null-ls").builtins.diagnostics.stylelint,
    require("null-ls").builtins.diagnostics.standardrb,
    require("null-ls").builtins.diagnostics.credo,
    require("null-ls").builtins.code_actions.gitsigns,
  }
})
require("lspconfig")["null-ls"].setup({
  -- Auto format on write
  -- on_attach = function(client)
  --   if client.resolved_capabilities.document_formatting then
  --       vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
  --   end
  -- end
})

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
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false})]]

-- LightBulb
vim.cmd [[autocmd CursorHold,CursorHoldI * lua require('nvim-lightbulb').update_lightbulb()]]

-- Keymaps
vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

--This line is important for auto-import
vim.api.nvim_set_keymap('i', '<cr>', 'compe#confirm("<cr>")', { expr = true })
vim.api.nvim_set_keymap('i', '<c-space>', 'compe#complete()', { expr = true })

-- Trouble list
-- vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
--   {silent = true, noremap = true}
-- )
-- vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>",
--   {silent = true, noremap = true}
-- )
