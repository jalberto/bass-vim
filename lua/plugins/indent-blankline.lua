return {
  {
    "lukas-reineke/indent-blankline.nvim",
    lazy = false,
    config = function ()
      require('indent_blankline').setup {
        show_current_context       = true,
        show_current_context_start = true,
        buftype_exclude            = {"terminal", "TelescopePrompt", "man", "nofile", "NvimTree"},
        filetype_exclude           = {"help", "packer", "NvimTree"}
      }
    end
  }
}
