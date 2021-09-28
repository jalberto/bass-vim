-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/ja/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/ja/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/ja/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/ja/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/ja/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["alchemist.vim"] = {
    after_files = { "/home/ja/.local/share/nvim/site/pack/packer/opt/alchemist.vim/after/plugin/alchemist.vim" },
    loaded = false,
    needs_bufread = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/opt/alchemist.vim"
  },
  ["auto-session"] = {
    config = { "\27LJ\2\2>\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\17auto-session\frequire\0" },
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/auto-session"
  },
  ["cheatsheet.nvim"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/cheatsheet.nvim"
  },
  ["clever-f.vim"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/clever-f.vim"
  },
  ["committia.vim"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/committia.vim"
  },
  diffconflicts = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/diffconflicts"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/emmet-vim"
  },
  falcon = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/falcon"
  },
  ["feline.nvim"] = {
    config = { "\27LJ\2\0028\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\vfeline\frequire\0" },
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/feline.nvim"
  },
  ["fluentd-vim"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/fluentd-vim"
  },
  ["gitlinker.nvim"] = {
    config = { "\27LJ\2\0027\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14gitlinker\frequire\0" },
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/gitlinker.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\0026\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["gundo.vim"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/gundo.vim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\2�\1\0\0\3\0\b\0\v6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\0015\2\6\0=\2\a\1B\0\2\1K\0\1\0\21filetype_exclude\1\2\0\0\5\20buftype_exclude\1\0\0\1\5\0\0\rterminal\20TelescopePrompt\bman\vnofile\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["logstash.vim"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/logstash.vim"
  },
  neoterm = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/neoterm"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\2<\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-bqf"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/nvim-bqf"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\0027\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/ja/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua"
  },
  ["nvim-comment"] = {
    config = { "\27LJ\2\2>\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\17nvim_comment\frequire\0" },
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/nvim-comment"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lightbulb"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/nvim-lightbulb"
  },
  ["nvim-lspconfig"] = {
    config = { "require('config.nvim-lspconfig')" },
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-tabline"] = {
    config = { "\27LJ\2\2H\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\1\15close_icon\5\nsetup\ftabline\frequire\0" },
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/nvim-tabline"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["phoenix.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/ja/.local/share/nvim/site/pack/packer/opt/phoenix.vim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["ri.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/ja/.local/share/nvim/site/pack/packer/opt/ri.vim"
  },
  ["smartgf.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/ja/.local/share/nvim/site/pack/packer/opt/smartgf.vim"
  },
  ["specs.nvim"] = {
    config = { "\27LJ\2\2Q\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\2\15show_jumps\2\rmin_jump\3\5\nsetup\nspecs\frequire\0" },
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/specs.nvim"
  },
  ["splitjoin.vim"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/splitjoin.vim"
  },
  ["symbols-outline.nvim"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim"
  },
  ["telescope.nvim"] = {
    config = { "require('config.telescope')" },
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\2?\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/todo-comments.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\2�\1\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\6\29use_lsp_diagnostic_signs\2\rposition\nright\14auto_open\1\tmode\29lsp_document_diagnostics\14auto_fold\1\15auto_close\2\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/trouble.nvim"
  },
  ["vim-base64"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/vim-base64"
  },
  ["vim-bracketed-paste"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/vim-bracketed-paste"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-elixir"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/vim-elixir"
  },
  ["vim-enfocado"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/vim-enfocado"
  },
  ["vim-genutils"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/vim-genutils"
  },
  ["vim-helm"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/opt/vim-helm"
  },
  ["vim-i18n"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/ja/.local/share/nvim/site/pack/packer/opt/vim-i18n"
  },
  ["vim-indexed-search"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/vim-indexed-search"
  },
  ["vim-kubernetes"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/opt/vim-kubernetes"
  },
  ["vim-l9"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/vim-l9"
  },
  ["vim-lighthaus"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/vim-lighthaus"
  },
  ["vim-liquid"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/vim-liquid"
  },
  ["vim-markdown"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/vim-markdown"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/vim-matchup"
  },
  ["vim-misc"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/vim-misc"
  },
  ["vim-mjml"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/opt/vim-mjml"
  },
  ["vim-peekaboo"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/vim-peekaboo"
  },
  ["vim-pug-complete"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/opt/vim-pug-complete"
  },
  ["vim-ragtag"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/vim-ragtag"
  },
  ["vim-rails"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/opt/vim-rails"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-ruby"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/opt/vim-ruby"
  },
  ["vim-rubyhash"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/ja/.local/share/nvim/site/pack/packer/opt/vim-rubyhash"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/vim-sandwich"
  },
  ["vim-signature"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/vim-signature"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/vim-sleuth"
  },
  ["vim-speeddating"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/vim-speeddating"
  },
  ["vim-test"] = {
    commands = { "TestFile", "TestLast", "TestNearest", "TestSuite", "TestVisit" },
    loaded = false,
    needs_bufread = false,
    path = "/home/ja/.local/share/nvim/site/pack/packer/opt/vim-test"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/vim-textobj-user"
  },
  ["vim-tmux-clipboard"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/vim-tmux-clipboard"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/vim-visual-multi"
  },
  ["vim-zoom"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/vim-zoom"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
require('config.telescope')
time([[Config for telescope.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\0026\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
require('config.nvim-lspconfig')
time([[Config for nvim-lspconfig]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\2?\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: gitlinker.nvim
time([[Config for gitlinker.nvim]], true)
try_loadstring("\27LJ\2\0027\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14gitlinker\frequire\0", "config", "gitlinker.nvim")
time([[Config for gitlinker.nvim]], false)
-- Config for: auto-session
time([[Config for auto-session]], true)
try_loadstring("\27LJ\2\2>\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\17auto-session\frequire\0", "config", "auto-session")
time([[Config for auto-session]], false)
-- Config for: feline.nvim
time([[Config for feline.nvim]], true)
try_loadstring("\27LJ\2\0028\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\vfeline\frequire\0", "config", "feline.nvim")
time([[Config for feline.nvim]], false)
-- Config for: nvim-tabline
time([[Config for nvim-tabline]], true)
try_loadstring("\27LJ\2\2H\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\1\15close_icon\5\nsetup\ftabline\frequire\0", "config", "nvim-tabline")
time([[Config for nvim-tabline]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\2<\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: specs.nvim
time([[Config for specs.nvim]], true)
try_loadstring("\27LJ\2\2Q\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\2\15show_jumps\2\rmin_jump\3\5\nsetup\nspecs\frequire\0", "config", "specs.nvim")
time([[Config for specs.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\2�\1\0\0\3\0\b\0\v6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\0015\2\6\0=\2\a\1B\0\2\1K\0\1\0\21filetype_exclude\1\2\0\0\5\20buftype_exclude\1\0\0\1\5\0\0\rterminal\20TelescopePrompt\bman\vnofile\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: nvim-comment
time([[Config for nvim-comment]], true)
try_loadstring("\27LJ\2\2>\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\17nvim_comment\frequire\0", "config", "nvim-comment")
time([[Config for nvim-comment]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\2�\1\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\6\29use_lsp_diagnostic_signs\2\rposition\nright\14auto_open\1\tmode\29lsp_document_diagnostics\14auto_fold\1\15auto_close\2\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TestLast lua require("packer.load")({'vim-test'}, { cmd = "TestLast", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TestFile lua require("packer.load")({'vim-test'}, { cmd = "TestFile", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TestNearest lua require("packer.load")({'vim-test'}, { cmd = "TestNearest", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TestSuite lua require("packer.load")({'vim-test'}, { cmd = "TestSuite", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TestVisit lua require("packer.load")({'vim-test'}, { cmd = "TestVisit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType yaml ++once lua require("packer.load")({'vim-helm', 'vim-kubernetes'}, { ft = "yaml" }, _G.packer_plugins)]]
vim.cmd [[au FileType pug ++once lua require("packer.load")({'vim-pug-complete'}, { ft = "pug" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType css ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "css" }, _G.packer_plugins)]]
vim.cmd [[au FileType vim ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "vim" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType mjml ++once lua require("packer.load")({'vim-mjml'}, { ft = "mjml" }, _G.packer_plugins)]]
vim.cmd [[au FileType ruby ++once lua require("packer.load")({'smartgf.vim', 'vim-rubyhash', 'vim-ruby', 'ri.vim', 'vim-i18n', 'vim-rails'}, { ft = "ruby" }, _G.packer_plugins)]]
vim.cmd [[au FileType elixir ++once lua require("packer.load")({'alchemist.vim', 'phoenix.vim'}, { ft = "elixir" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/ja/.local/share/nvim/site/pack/packer/opt/vim-helm/ftdetect/helm.vim]], true)
vim.cmd [[source /home/ja/.local/share/nvim/site/pack/packer/opt/vim-helm/ftdetect/helm.vim]]
time([[Sourcing ftdetect script at: /home/ja/.local/share/nvim/site/pack/packer/opt/vim-helm/ftdetect/helm.vim]], false)
time([[Sourcing ftdetect script at: /home/ja/.local/share/nvim/site/pack/packer/opt/vim-ruby/ftdetect/ruby.vim]], true)
vim.cmd [[source /home/ja/.local/share/nvim/site/pack/packer/opt/vim-ruby/ftdetect/ruby.vim]]
time([[Sourcing ftdetect script at: /home/ja/.local/share/nvim/site/pack/packer/opt/vim-ruby/ftdetect/ruby.vim]], false)
time([[Sourcing ftdetect script at: /home/ja/.local/share/nvim/site/pack/packer/opt/vim-ruby/ftdetect/ruby_extra.vim]], true)
vim.cmd [[source /home/ja/.local/share/nvim/site/pack/packer/opt/vim-ruby/ftdetect/ruby_extra.vim]]
time([[Sourcing ftdetect script at: /home/ja/.local/share/nvim/site/pack/packer/opt/vim-ruby/ftdetect/ruby_extra.vim]], false)
time([[Sourcing ftdetect script at: /home/ja/.local/share/nvim/site/pack/packer/opt/vim-mjml/ftdetect/mjml.vim]], true)
vim.cmd [[source /home/ja/.local/share/nvim/site/pack/packer/opt/vim-mjml/ftdetect/mjml.vim]]
time([[Sourcing ftdetect script at: /home/ja/.local/share/nvim/site/pack/packer/opt/vim-mjml/ftdetect/mjml.vim]], false)
time([[Sourcing ftdetect script at: /home/ja/.local/share/nvim/site/pack/packer/opt/vim-kubernetes/ftdetect/kubeconf.vim]], true)
vim.cmd [[source /home/ja/.local/share/nvim/site/pack/packer/opt/vim-kubernetes/ftdetect/kubeconf.vim]]
time([[Sourcing ftdetect script at: /home/ja/.local/share/nvim/site/pack/packer/opt/vim-kubernetes/ftdetect/kubeconf.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
