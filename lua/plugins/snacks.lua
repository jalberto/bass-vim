return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
      terminal = { enabled = true },
      bigfile = { enabled = true },
      notifier = { timeout = 3000 },
      quickfile = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      dim = { enabled = true },
      indent = { enabled = true },
      scroll = { enabled = true },
      input = { enabled = true },
      scope = { enabled = true },
      styles = {
        notification = {
          wo = { wrap = true }, -- Wrap notifications
        },
      },
      win = {
        border = 'rounded',
      },
    },
    keys = {
      {
        '<leader>un',
        function()
          Snacks.notifier.hide()
        end,
        desc = 'Dismiss All Notifications',
      },
      {
        '<leader>bd',
        function()
          Snacks.bufdelete()
        end,
        desc = 'Delete Buffer',
      },
      {
        '<leader>bx',
        function()
          Snacks.bufdelete.other()
        end,
        desc = 'Delete Other Buffers',
      },
      {
        '<leader>gl',
        function()
          Snacks.lazygit()
        end,
        desc = 'Lazygit',
      },
      {
        '<leader>gf',
        function()
          Snacks.lazygit.log_file()
        end,
        desc = 'Lazygit Current File History',
      },
      {
        '<leader>gb',
        function()
          Snacks.git.blame_line()
        end,
        desc = 'Git Blame Line',
      },
      {
        '<leader>gB',
        function()
          Snacks.gitbrowse()
        end,
        desc = 'Git open Browser',
      },
      {
        '<leader>cR',
        function()
          Snacks.rename.rename_file()
        end,
        desc = 'Rename File',
      },
      {
        '<leader>ge',
        function()
          Snacks.terminal.get('spf ' .. vim.fn.getcwd())
        end,
        desc = 'Toggle file Explorer',
      },
      {
        '¬',
        function()
          Snacks.terminal.toggle()
        end,
        desc = 'Toggle Terminal',
      },
      {
        ']]',
        function()
          Snacks.words.jump(vim.v.count1)
        end,
        desc = 'Next Reference',
        mode = { 'n', 't' },
      },
      {
        '[[',
        function()
          Snacks.words.jump(-vim.v.count1)
        end,
        desc = 'Prev Reference',
        mode = { 'n', 't' },
      },
      {
        '<leader>hy',
        desc = 'Git yank link',
        function()
          Snacks.gitbrowse.open({
            open = function(url)
              vim.fn.setreg('+', url)
              Snacks.notify.info('Yanked url to clipboard')
            end,
          })
        end,
      },
      {
        '<leader>N',
        desc = 'Neovim News',
        function()
          Snacks.win({
            file = vim.api.nvim_get_runtime_file('doc/news.txt', false)[1],
            width = 0.7,
            height = 0.6,
            wo = {
              spell = false,
              wrap = false,
              signcolumn = 'yes',
              statuscolumn = ' ',
              conceallevel = 3,
            },
          })
        end,
      },
      {
        '<leader>.',
        function()
          Snacks.scratch()
        end,
        desc = 'Toggle Scratch Buffer',
      },
      {
        '<leader>S',
        function()
          Snacks.scratch.select()
        end,
        desc = 'Select Scratch Buffer',
      },
      {
        '<leader>F',
        function()
          Snacks.toggle.dim()
        end,
        desc = 'Enable Focus mode',
      },
    },
    init = function()
      vim.api.nvim_create_autocmd('User', {
        pattern = 'VeryLazy',
        callback = function()
          -- Setup some globals for debugging (lazy-loaded)
          _G.dd = function(...)
            Snacks.debug.inspect(...)
          end
          _G.bt = function()
            Snacks.debug.backtrace()
          end
          vim.print = _G.dd -- Override print to use snacks for `:=` command

          -- Create some toggle mappings
          Snacks.toggle.option('spell', { name = 'Spelling' }):map('<leader>us')
          Snacks.toggle.option('wrap', { name = 'Wrap' }):map('<leader>uw')
          Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map('<leader>uL')
          Snacks.toggle.diagnostics():map('<leader>ud')
          Snacks.toggle.line_number():map('<leader>ul')
          Snacks.toggle
            .option('conceallevel', { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
            :map('<leader>uc')
          Snacks.toggle.treesitter():map('<leader>uT')
          Snacks.toggle.option('background', { off = 'light', on = 'dark', name = 'Dark Background' }):map('<leader>ub')
          Snacks.toggle.inlay_hints():map('<leader>uh')
        end,
      })

      vim.api.nvim_create_autocmd('LspProgress', {
        ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
        callback = function(ev)
          local spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' }
          vim.notify(vim.lsp.status(), 'info', {
            id = 'lsp_progress',
            title = 'LSP Progress',
            opts = function(notif)
              notif.icon = ev.data.params.value.kind == 'end' and ' '
                or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
            end,
          })
        end,
      })

      -- Rename file with LSP + Snacks
      vim.api.nvim_create_autocmd('User', {
        pattern = 'MiniFilesActionRename',
        callback = function(event)
          Snacks.rename.on_rename_file(event.data.from, event.data.to)
        end,
      })
    end,
  },
}
