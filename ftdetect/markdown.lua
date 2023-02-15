-- autocmd BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown

vim.filetype.add({
  pattern = {
    ['.*.{md,markdown,mdown,mkd,mkdn,txt}'] = 'markdown'
  }
})
