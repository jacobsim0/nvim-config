return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "gopls",
          "pyright",
          "terraformls",
          "bashls",
        },
        automatic_installation = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config("gopls", {})
      vim.lsp.config("pyright", {})
      vim.lsp.config("terraformls", {})
      vim.lsp.config("bashls", {})
      vim.lsp.enable({"gopls", "pyright", "terraformls", "bashls"})
    end,
  },
}
