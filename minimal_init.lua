-- Minimal init file to run Feline with the most basic functionality
-- Run from Feline top-level directory using:
-- nvim --noplugin -u minimal_init.lua

local tmpdir

if vim.fn.has('win32') == 1 then
    tmpdir = os.getenv('TEMP')
else
    tmpdir = '/tmp'
end

local function load_plugins()
    local packer = require('packer')
    local use = packer.use

    packer.reset()
    packer.init {
        package_root = tmpdir .. '/nvim/site/pack',
        git = {
            clone_timeout = -1
        }
    }

    use 'wbthomason/packer.nvim'
    use {
        'famiu/feline.nvim',

        -- If you wish to use the develop branch, uncomment the next line
        -- branch = 'develop',

        -- If you wish to use a specific version of Feline, uncomment the next line
        -- tag = 'v0.1', -- replace 'v0.1' with your version number

        requires = {
            {
                'lewis6991/gitsigns.nvim',
                requires = { 'nvim-lua/plenary.nvim' },
                config = function()
                    require('gitsigns').setup()
                end
            },
            'kyazdani42/nvim-web-devicons'
        }
    }

    packer.sync()
end

_G.load_config = function()
    vim.opt.termguicolors = true

    -- Replace this part of the config with whatever Feline configuration you're using
    require('feline').setup()
end

local install_path = tmpdir .. '/nvim/site/pack/packer/start/packer.nvim'

vim.opt.packpath = { tmpdir .. '/nvim/site'}

if vim.fn.isdirectory(install_path) == 0 then
    vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
end

load_plugins()
vim.api.nvim_command('autocmd User PackerComplete ++once lua load_config()')
