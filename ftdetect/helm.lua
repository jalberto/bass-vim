-- autocmd BufRead,BufNewFile */templates/*.yaml,*/templates/*.tpl setf helm

vim.filetype.add({
  pattern = {
    ['.*/chart/*/templates/.{yaml,tpl}'] = 'helm'
  }
})
