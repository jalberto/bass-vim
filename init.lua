-- BaSS (neo)vimrc's since 2007

-- Load base options
require("options")

-- Initialize Lazy.nvim (plugin manager)
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

-- Lazy.nvim setup options
local lazy_opts = {
	defaults = { lazy = true },
	checker = { enabled = false },
	colorscheme = "cyberdream",
	change_detection = {
		notify = false,
	},
	ui = { border = "rounded" },
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
				"rplugin",
				"spellfile",
				"2html_plugin",
				"man",
			},
		},
	},
	-- This reads pkg/plugin definition from the plugin itself if available, good for deps.
	pkg = {
		enabled = true,
		cache = vim.fn.stdpath("state") .. "/lazy/pkg-cache.lua",
		-- The first package source that is found for a plugin will be used.
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
}

-- Setup Lazy.nvim
local ok, lazy = pcall(require, "lazy")
if not ok then
	vim.notify("Failed to load lazy.nvim", vim.log.levels.ERROR)
	return
end

-- Load plugins from 'lua/plugins.lua' and 'lua/plugins/*.lua'
lazy.setup("plugins", lazy_opts)

-- Set colorscheme
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.cmd.colorscheme("cyberdream")

-- Load keymaps and autocommands after all plugins are loaded
vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		require("keys")
		require("autocommands")
	end,
})
