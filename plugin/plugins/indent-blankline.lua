local status_ok, ibl = pcall(require, "indent_blankline")
if not status_ok then
  return
end

ibl.setup{
  show_current_context       = true,
  show_current_context_start = true,
  buftype_exclude            = {"terminal", "TelescopePrompt", "man", "nofile", "NvimTree"},
  filetype_exclude           = {"help", "packer", "NvimTree"}
}
