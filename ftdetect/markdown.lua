-- autocmd BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown

vim.filetype.add({
  pattern = {
    ['.*.{md,markdown,mdown,mkd,mkdn,txt}'] = 'markdown'
  }
})


vim.opt.foldlevelstart = 99 --ble initial folding
-- vim.opt.foldlevel = 99 --ble initial folding
