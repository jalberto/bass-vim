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

-- Insert empty line without entering insert mode
map('n', '<leader>o', ':<C-u>call append(line("."), repeat([""], v:count1))<CR>', NS)
map('n', '<leader>O', ':<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>', NS)

-- better up/down
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
-- map("n", "<A-h>", "<C-w>h", { desc = "Go to left window" })
-- map("n", "<A-j>", "<C-w>j", { desc = "Go to lower window" })
-- map("n", "<A-k>", "<C-w>k", { desc = "Go to upper window" })
-- map("n", "<A-l>", "<C-w>l", { desc = "Go to right window" })
map('n', '<tab><tab>', '<C-w>w', { desc = "Cycle buffers" })
map({ 'n', 'i' }, '<C-h>', ':tabprevious<cr>', { desc = 'Go to prev Tab' })
map({ 'n', 'i' }, '<C-l>', ':tabnext<cr>', { desc = 'Go to next Tab' })

-- Resize window using <alt> arrow keys
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

map("n", "gV", "gV `[v`]", { noremap = true, desc = "Visually select the text that was last edited/pasted" })

-- FIX: doesnt works, it just paste
-- map("n", "gp", "gp `[v`]", { noremap = true,desc = "Select what you've just pasted" })

-- lazy
map("n", "<leader>l", "<cmd>:Lazy<cr>", { desc = "Lazy" })

-- new file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })

map('n', '<Leader>dbl', ':g/^$/d<CR>:nohls<CR>', { desc = "Delete Blank Lines" })
-- map('n', '<Leader>dts', ":%s/\s\+$//e<CR>", {desc = "Delete trailing spaces"})

map('n', '<Leader>gg', 'ggVG', { desc = 'Select all' })

map('n', '<Leader>jq', ":%!jq '.'<CR>", { desc = 'Beurify json' })

-- -- Undo
-- vim.api.nvim_set_keymap('n', '<leader>u', '<cmd>UndotreeToggle<cr>', NS)

-- Don't touch unnamed register when pasting over visual selection
-- map("x", "p", function() return 'pgv"' .. vim.v.register .. "y" end, { remap = false, expr = true })
