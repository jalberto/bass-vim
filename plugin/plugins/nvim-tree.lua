local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

nvim_tree.setup {
  -- open_on_tab = true,
  renderer = {
    highlight_git = true,
    highlight_opened_files = "name",
  },
  filters = {
    dotfiles = false,
    custom = {'.git', 'node_modules', '.cache'}
  },
  view = {
    width = 25,
    preserve_window_proportions = true
  }
}
