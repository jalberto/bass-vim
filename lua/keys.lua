local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

local NS = { noremap = true, silent = true }

-- better up/down
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<A-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<A-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<A-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<A-l>", "<C-w>l", { desc = "Go to right window" })
map('n', '<tab><tab>', '<C-w>w', { desc = "Cycle buffers" })
map({'n','i'}, '<silent> <C-h>', ':tabprevious<cr>', {desc = 'Go to prev Tab'})
map({'n','i'}, '<silent> <C-l>', ':tabnext<cr>', {desc = 'Go to next Tab'})

-- Resize window using <ctrl> arrow keys
map("n", "<A-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<A-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<A-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<A-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })


-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- lazy
map("n", "<leader>l", "<cmd>:Lazy<cr>", { desc = "Lazy" })

-- new file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })

map('n', '<Leader>dbl', ':g/^$/d<CR>:nohls<CR>', {desc = "Delete Blank Lines"})
-- map('n', '<Leader>dts', ":%s/\s\+$//e<CR>", {desc = "Delete trailing spaces"})

-- Base64
map('v', '<Leader>d64', '<leader>atob', {desc = 'Decode Base64'})
map('v', '<Leader>e64', '<leader>btoa', {desc = 'Encode Base64'})

map('n', '<Leader>gg', 'ggVG', {desc = 'Select all'})

map('n', '<Leader>jq', ":%!jq '.'<CR>", {desc = 'Beurify json'})

-- -- Normal Mode Swapping
-- vim.api.nvim_set_keymap("n", "vd", '<cmd>lua require("syntax-tree-surfer").move("n", false)<cr>', NS)
-- vim.api.nvim_set_keymap("n", "vu", '<cmd>lua require("syntax-tree-surfer").move("n", true)<cr>', NS)
-- -- .select() will show you what you will be swapping with .move(), you'll get used to .select() and .move() behavior quite soon!
-- vim.api.nvim_set_keymap("n", "vx", '<cmd>lua require("syntax-tree-surfer").select()<cr>', NS)
-- -- .select_current_node() will select the current node at your cursor
-- vim.api.nvim_set_keymap("n", "vn", '<cmd>lua require("syntax-tree-surfer").select_current_node()<cr>', NS)
--
-- -- NAVIGATION: Only change the keymap to your liking. I would not recommend changing anything about the .surf() parameters!
-- vim.api.nvim_set_keymap("x", "J", '<cmd>lua require("syntax-tree-surfer").surf("next", "visual")<cr>', NS)
-- vim.api.nvim_set_keymap("x", "K", '<cmd>lua require("syntax-tree-surfer").surf("prev", "visual")<cr>', NS)
-- vim.api.nvim_set_keymap("x", "H", '<cmd>lua require("syntax-tree-surfer").surf("parent", "visual")<cr>', NS)
-- vim.api.nvim_set_keymap("x", "L", '<cmd>lua require("syntax-tree-surfer").surf("child", "visual")<cr>', NS)
--
-- -- SWAPPING WITH VISUAL SELECTION: Only change the keymap to your liking. Don't change the .surf() parameters!
-- vim.api.nvim_set_keymap("x", "<A-j>", '<cmd>lua require("syntax-tree-surfer").surf("next", "visual", true)<cr>', NS)
-- vim.api.nvim_set_keymap("x", "<A-k>", '<cmd>lua require("syntax-tree-surfer").surf("prev", "visual", true)<cr>', NS)
--
-- -- Align
-- vim.keymap.set('x', 'aa', function() require'align'.align_to_char(1, true)             end, NS) -- Aligns to 1 character, looking left
-- vim.keymap.set('x', 'as', function() require'align'.align_to_char(2, true, true)       end, NS) -- Aligns to 2 characters, looking left and with previews
-- vim.keymap.set('x', 'aw', function() require'align'.align_to_string(false, true, true) end, NS) -- Aligns to a string, looking left and with previews
-- vim.keymap.set('x', 'ar', function() require'align'.align_to_string(true, true, true)  end, NS) -- Aligns to a Lua pattern, looking left and with previews
--
-- -- Undo
-- vim.api.nvim_set_keymap('n', '<leader>u', '<cmd>UndotreeToggle<cr>', NS)

-- Don't touch unnamed register when pasting over visual selection
-- map("x", "p", function() return 'pgv"' .. vim.v.register .. "y" end, { remap = false, expr = true })
