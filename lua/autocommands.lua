-- Scope augroups to avoid conflicts
local function augroup(name)
  return vim.api.nvim_create_augroup("bass_" .. name, { clear = true })
end

-- Try to autoreload files on external changes
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup("checktime"),
  command = "checktime",
})

-- Auto reload vimrc
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = 'init.lua,.vimrc,init.vim',
  command = 'so $MYVIMRC'
})

-- when numbering is on, toggle relative to active buffer
-- vim.api.nvim_create_autocmd({"BufEnter", "FocusGained", "InsertLeave", "WinEnter", "CmdlineLeave"}, {
--   pattern = "*",
--   group = augroup('numbertoggle'),
--   desc = "turn relative number on",
--   command = 'if &nu | set rnu | endif'
-- })
-- -- vim.api.nvim_create_autocmd({'BufLeave', 'FocusLost','InsertEnter','WinLeave'}, {
-- vim.api.nvim_create_autocmd({"BufLeave", "FocusLost", "InsertEnter", "WinLeave", "CmdlineEnter"}, {
--   pattern = "*",
--   group = augroup('numbertoggle'),
--   desc = "turn relative number off",
--   command = 'if &nu | set nornu | endif'
-- })

-- Auto highlite current panel
vim.api.nvim_create_autocmd({'WinEnter'}, {
  group = augroup('activefocus'),
  pattern = '*',
  command = 'set cul'
})
vim.api.nvim_create_autocmd({'WinLeave'}, {
  group = augroup('activefocus'),
  pattern = '*',
  command = 'set nocul'
})

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank {higroup="IncSearch", timeout=200, on_visual=true}
  end
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("last_loc"),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "qf",
    "help",
    "man",
    "notify",
    "lspinfo",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "PlenaryTestPopup",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("wrap_spell"),
  pattern = { "gitcommit", "markdown", "txt" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- fix folding when using telescope https://github.com/nvim-treesitter/nvim-treesitter/issues/1337
-- vim.api.nvim_create_autocmd({ "BufEnter" }, { pattern = { "*" }, command = "normal zx", })

-- Open diagnostics on hover in a float with debounce
local diagnostic_hover_timer
vim.api.nvim_create_autocmd({ "CursorHold" }, {
    pattern = "*",
    callback = function()
        if diagnostic_hover_timer then
            vim.fn.timer_stop(diagnostic_hover_timer)
        end
        diagnostic_hover_timer = vim.fn.timer_start(300, function()
            -- Check if there's already a float visible
            for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
                if vim.api.nvim_win_get_config(winid).zindex then
                    return
                end
            end
            -- Only show float if there are diagnostics
            local line = vim.fn.line(".")
            local bufnr = vim.api.nvim_get_current_buf()
            local diagnostics = vim.diagnostic.get(bufnr, { lnum = line - 1 })
            if #diagnostics > 0 then
                vim.diagnostic.open_float({
                    scope = "cursor",
                    focusable = false,
                    close_events = {
                        "CursorMoved",
                        "CursorMovedI",
                        "BufHidden",
                        "InsertCharPre",
                        "WinLeave",
                    },
                })
            end
        end)
    end
})
