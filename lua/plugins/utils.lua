return {
  {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    config = true,
    keys = {
      { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>", {desc = 'Undo tree'} },
    },
  },

  {
    "deponian/nvim-base64",
    version = "*",
    keys = {
      -- Decode/encode selected sequence from/to base64
      -- (mnemonic: [b]ase64)
      { "<Leader>B", "<Plug>(FromBase64)", mode = "x", desc = "Decode base64" },
      { "<Leader>D", "<Plug>(ToBase64)", mode = "x", desc = "Encode base64" },
    },
    config = function()
      require("nvim-base64").setup()
    end,
  }
}
