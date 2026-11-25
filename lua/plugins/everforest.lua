return {
  {
    "neanias/everforest-nvim",
    lazy = false,
    priority = 1000, -- load before all other plugins so nothing renders unthemed
    config = function()
      require("everforest").setup({
        background = "medium", -- "soft", "medium", "hard"
      })
      -- default theme is chosen in lua/config/theme.lua (Space f t to change and save)
    end,
  },
}
