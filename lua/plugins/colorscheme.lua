return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false, -- kept installed (and visible in :Telescope colorscheme) but no longer the default
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
