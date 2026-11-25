return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000, -- load early so it can be the saved default (see lua/config/theme.lua)
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        integrations = {
          cmp = true,
          gitsigns = true,
          neotree = true,
          telescope = true,
          treesitter = true,
          which_key = true,
          mason = true,
        },
      })
    end,
  },
}
