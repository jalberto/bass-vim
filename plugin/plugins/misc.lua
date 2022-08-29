local status_ok, modes = pcall(require, "modes")
if status_ok then
  modes.setup({
    colors = {
      -- insert = "#718e3f",
      visual = "#ffffff"
    }
  })
end

local status_ok, auto_session = pcall(require, "auto-session")
if status_ok then
  vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
  auto_session.setup({
    log_level = 'error',
    auto_session_suppress_dirs = {'~/', '~/Projects'}
  })
end
