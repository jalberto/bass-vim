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
  checker = { enabled = false },
  -- colorscheme = 'cyberdream',
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
  -- This  reads pkg/plugin definition from the plugin itself if available, good for deps.
  pkg = {
    enabled = true,
    cache = vim.fn.stdpath("state") .. "/lazy/pkg-cache.lua",
    -- the first package source that is found for a plugin will be used.
    sources = {
      "lazy",
      "rockspec",
      "packspec",
    },
  },
  rocks = {
    root = vim.fn.stdpath("data") .. "/lazy-rocks",
    server = "https://nvim-neorocks.github.io/rocks-binaries/",
  },
})

vim.cmd('colorscheme cyberdream')

vim.api.nvim_create_autocmd("User", {
 pattern = "VeryLazy",
 callback = function()
  require("keys")
  require("autocommands")
 end,
})
