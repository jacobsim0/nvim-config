return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
    lazy = false, -- load at startup
    config = function()
      require("neo-tree").setup({
        -- enable follow_current_file so it highlights the file you’re editing
        filesystem = {
          follow_current_file = {
            enabled = true,
          },
          hijack_netrw_behavior = "open_current",
        },
        window = {
          width = 30,
        },
      })

      -- keymaps
      vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle NeoTree" })
      vim.keymap.set("n", "<leader>o", ":Neotree reveal<CR>", { desc = "Reveal current file in NeoTree" })
    end,
  }
}
