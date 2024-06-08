-- BaSS (neo)vimrc's since 2007

require('options')      -- base options

-- Init Lazyvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 1st param merge/require `lua/plugins.lua` & `lua/plugins/*.lua`
require("lazy").setup("plugins", {
  defaults = { lazy = true },
  checker = { enabled = true },
  colorscheme = 'falcon',
  change_detection = {
    notify = false,
  },
  ui = { border = "rounded"},
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

vim.api.nvim_create_autocmd("User", {
 pattern = "VeryLazy",
 callback = function()
  require("keys")
  require("autocommands")
 end,
})
