local NS = { noremap = true, silent = true }

-- Normal Mode Swapping
vim.api.nvim_set_keymap("n", "vd", '<cmd>lua require("syntax-tree-surfer").move("n", false)<cr>', NS)
vim.api.nvim_set_keymap("n", "vu", '<cmd>lua require("syntax-tree-surfer").move("n", true)<cr>', NS)
-- .select() will show you what you will be swapping with .move(), you'll get used to .select() and .move() behavior quite soon!
vim.api.nvim_set_keymap("n", "vx", '<cmd>lua require("syntax-tree-surfer").select()<cr>', NS)
-- .select_current_node() will select the current node at your cursor
vim.api.nvim_set_keymap("n", "vn", '<cmd>lua require("syntax-tree-surfer").select_current_node()<cr>', NS)

-- NAVIGATION: Only change the keymap to your liking. I would not recommend changing anything about the .surf() parameters!
vim.api.nvim_set_keymap("x", "J", '<cmd>lua require("syntax-tree-surfer").surf("next", "visual")<cr>', NS)
vim.api.nvim_set_keymap("x", "K", '<cmd>lua require("syntax-tree-surfer").surf("prev", "visual")<cr>', NS)
vim.api.nvim_set_keymap("x", "H", '<cmd>lua require("syntax-tree-surfer").surf("parent", "visual")<cr>', NS)
vim.api.nvim_set_keymap("x", "L", '<cmd>lua require("syntax-tree-surfer").surf("child", "visual")<cr>', NS)

-- SWAPPING WITH VISUAL SELECTION: Only change the keymap to your liking. Don't change the .surf() parameters!
vim.api.nvim_set_keymap("x", "<A-j>", '<cmd>lua require("syntax-tree-surfer").surf("next", "visual", true)<cr>', NS)
vim.api.nvim_set_keymap("x", "<A-k>", '<cmd>lua require("syntax-tree-surfer").surf("prev", "visual", true)<cr>', NS)

-- Align
vim.keymap.set('x', 'aa', function() require'align'.align_to_char(1, true)             end, NS) -- Aligns to 1 character, looking left
vim.keymap.set('x', 'as', function() require'align'.align_to_char(2, true, true)       end, NS) -- Aligns to 2 characters, looking left and with previews
vim.keymap.set('x', 'aw', function() require'align'.align_to_string(false, true, true) end, NS) -- Aligns to a string, looking left and with previews
vim.keymap.set('x', 'ar', function() require'align'.align_to_string(true, true, true)  end, NS) -- Aligns to a Lua pattern, looking left and with previews

-- Undo
vim.api.nvim_set_keymap('n', '<leader>u', '<cmd>UndotreeToggle<cr>', {noremap = true})

-- Don't touch unnamed register when pasting over visual selection
-- vim.keymap.set("x", "p", function() return 'pgv"' .. vim.v.register .. "y" end, { remap = false, expr = true })
