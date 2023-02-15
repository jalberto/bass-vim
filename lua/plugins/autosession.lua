return {
  {
    'rmagatti/auto-session',
    lazy = false,
    opts = {
      log_level = 'error',
      config = function()
        vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
      end,
      auto_session_suppress_dirs = {'~/', '~/Projects'}
    }
  }
}
