local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

treesitter.setup{
  ensure_installed = {
    "elixir",
    "ruby",
    "javascript",
    "heex",
    "eex",
    "lua",
    "css",
    "vue",
    "json",
    "html",
    "vim",
    "scss",
    "yaml",
    "regex",
    "dockerfile",
    "surface"
  },

  indent                = { enable = true },
  highlight             = { enable = true },
  context_commentstring = { enable = true },

  rainbow = { enable = true, extended_mode = true },
}
