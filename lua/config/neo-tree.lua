local status_ok, neo_tree = pcall(require, "neo-tree")
if not status_ok then
  return
end

vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

vim.fn.sign_define("DiagnosticSignError",
  {text = " ", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn",
  {text = " ", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo",
  {text = " ", texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint",
  {text = "", texthl = "DiagnosticSignHint"})

neo_tree.setup {
  popup_border_style = "rounded", -- "NC", "double", "none", "rounded", "shadow", "single" or "solid"
  close_if_last_window = false,
}
