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
  ale = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/ale"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/auto-pairs"
  },
  ["beacon.nvim"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/beacon.nvim"
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
  ["fluentd-vim"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/fluentd-vim"
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
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["logstash.vim"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/logstash.vim"
  },
  ["matchit.zip"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/matchit.zip"
  },
  neoterm = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/neoterm"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\0027\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/ja/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
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
  ["ri.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/ja/.local/share/nvim/site/pack/packer/opt/ri.vim"
  },
  ["ruby-matchit"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/ja/.local/share/nvim/site/pack/packer/opt/ruby-matchit"
  },
  ["smartgf.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/ja/.local/share/nvim/site/pack/packer/opt/smartgf.vim"
  },
  ["smartpairs.vim"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/smartpairs.vim"
  },
  ["splitjoin.vim"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/splitjoin.vim"
  },
  tcomment_vim = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/tcomment_vim"
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
    loaded = false,
    needs_bufread = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/opt/vim-elixir"
  },
  ["vim-genutils"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/vim-genutils"
  },
  ["vim-gh-line"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/vim-gh-line"
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
    loaded = false,
    needs_bufread = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/opt/vim-markdown"
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
  ["vim-obsession"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/vim-obsession"
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
  ["vim-qf"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/vim-qf"
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
  ["vim-snippets"] = {
    loaded = true,
    path = "/home/ja/.local/share/nvim/site/pack/packer/start/vim-snippets"
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
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\0026\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
if vim.fn.exists(":TestLast") == 0 then
vim.cmd [[command! -nargs=* -range -bang -complete=file TestLast lua require("packer.load")({'vim-test'}, { cmd = "TestLast", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":TestFile") == 0 then
vim.cmd [[command! -nargs=* -range -bang -complete=file TestFile lua require("packer.load")({'vim-test'}, { cmd = "TestFile", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":TestNearest") == 0 then
vim.cmd [[command! -nargs=* -range -bang -complete=file TestNearest lua require("packer.load")({'vim-test'}, { cmd = "TestNearest", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":TestSuite") == 0 then
vim.cmd [[command! -nargs=* -range -bang -complete=file TestSuite lua require("packer.load")({'vim-test'}, { cmd = "TestSuite", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":TestVisit") == 0 then
vim.cmd [[command! -nargs=* -range -bang -complete=file TestVisit lua require("packer.load")({'vim-test'}, { cmd = "TestVisit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'vim-markdown'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType yaml ++once lua require("packer.load")({'vim-helm', 'vim-kubernetes'}, { ft = "yaml" }, _G.packer_plugins)]]
vim.cmd [[au FileType pug ++once lua require("packer.load")({'vim-pug-complete'}, { ft = "pug" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType css ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "css" }, _G.packer_plugins)]]
vim.cmd [[au FileType vim ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "vim" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType mjml ++once lua require("packer.load")({'vim-mjml'}, { ft = "mjml" }, _G.packer_plugins)]]
vim.cmd [[au FileType ruby ++once lua require("packer.load")({'vim-rails', 'smartgf.vim', 'ruby-matchit', 'vim-rubyhash', 'vim-ruby', 'vim-i18n', 'ri.vim'}, { ft = "ruby" }, _G.packer_plugins)]]
vim.cmd [[au FileType elixir ++once lua require("packer.load")({'vim-elixir', 'alchemist.vim', 'phoenix.vim'}, { ft = "elixir" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/ja/.local/share/nvim/site/pack/packer/opt/vim-mjml/ftdetect/mjml.vim]], true)
vim.cmd [[source /home/ja/.local/share/nvim/site/pack/packer/opt/vim-mjml/ftdetect/mjml.vim]]
time([[Sourcing ftdetect script at: /home/ja/.local/share/nvim/site/pack/packer/opt/vim-mjml/ftdetect/mjml.vim]], false)
time([[Sourcing ftdetect script at: /home/ja/.local/share/nvim/site/pack/packer/opt/vim-elixir/ftdetect/elixir.vim]], true)
vim.cmd [[source /home/ja/.local/share/nvim/site/pack/packer/opt/vim-elixir/ftdetect/elixir.vim]]
time([[Sourcing ftdetect script at: /home/ja/.local/share/nvim/site/pack/packer/opt/vim-elixir/ftdetect/elixir.vim]], false)
time([[Sourcing ftdetect script at: /home/ja/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]], true)
vim.cmd [[source /home/ja/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]]
time([[Sourcing ftdetect script at: /home/ja/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]], false)
time([[Sourcing ftdetect script at: /home/ja/.local/share/nvim/site/pack/packer/opt/vim-helm/ftdetect/helm.vim]], true)
vim.cmd [[source /home/ja/.local/share/nvim/site/pack/packer/opt/vim-helm/ftdetect/helm.vim]]
time([[Sourcing ftdetect script at: /home/ja/.local/share/nvim/site/pack/packer/opt/vim-helm/ftdetect/helm.vim]], false)
time([[Sourcing ftdetect script at: /home/ja/.local/share/nvim/site/pack/packer/opt/vim-kubernetes/ftdetect/kubeconf.vim]], true)
vim.cmd [[source /home/ja/.local/share/nvim/site/pack/packer/opt/vim-kubernetes/ftdetect/kubeconf.vim]]
time([[Sourcing ftdetect script at: /home/ja/.local/share/nvim/site/pack/packer/opt/vim-kubernetes/ftdetect/kubeconf.vim]], false)
time([[Sourcing ftdetect script at: /home/ja/.local/share/nvim/site/pack/packer/opt/vim-ruby/ftdetect/ruby.vim]], true)
vim.cmd [[source /home/ja/.local/share/nvim/site/pack/packer/opt/vim-ruby/ftdetect/ruby.vim]]
time([[Sourcing ftdetect script at: /home/ja/.local/share/nvim/site/pack/packer/opt/vim-ruby/ftdetect/ruby.vim]], false)
time([[Sourcing ftdetect script at: /home/ja/.local/share/nvim/site/pack/packer/opt/vim-ruby/ftdetect/ruby_extra.vim]], true)
vim.cmd [[source /home/ja/.local/share/nvim/site/pack/packer/opt/vim-ruby/ftdetect/ruby_extra.vim]]
time([[Sourcing ftdetect script at: /home/ja/.local/share/nvim/site/pack/packer/opt/vim-ruby/ftdetect/ruby_extra.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
