return {
  -- DevDocs browser
  {
    "luckasRanarison/nvim-devdocs",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    cmd = { "DevdocsFetch", "DevdocsInstall", "DevdocsUpdate", "DevdocsUpdateAll", "DevdocsUninstall", "DevdocsOpen", "DevdocsOpenFloat", },
    opts = {
      previewer_cmd = "glow",
      picker_cmd = true,
      -- picker_cmd_args = {"-p"},
      ensure_installed = {
        "css",
        "elixir-1.15",
        "phoenix",
        "kubernetes",
        "ruby-3.2"
      }
    }
  },

  {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    config = true,
    keys = {
      { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>", {desc = 'Undo tree'} },
    },
  },

  { 'christianrondeau/vim-base64' }, -- encode using b64
}
