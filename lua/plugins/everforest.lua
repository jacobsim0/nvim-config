return {
  {
    "neanias/everforest-nvim",
    lazy = false,
    priority = 1000, -- load before all other plugins so nothing renders unthemed
    config = function()
      require("everforest").setup({
        background = "medium", -- "soft", "medium", "hard"
      })
      vim.cmd.colorscheme("everforest")
    end,
  },
}
