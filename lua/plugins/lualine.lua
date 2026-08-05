return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto", -- follow the active colorscheme
          globalstatus = true, -- one statusline across all splits
        },
        sections = {
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_x = { "filetype" },
        },
      })
    end,
  },
}
