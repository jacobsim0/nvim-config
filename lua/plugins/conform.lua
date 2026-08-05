return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          go = { "gofmt" },
          terraform = { "terraform_fmt" },
          tf = { "terraform_fmt" },
          ["terraform-vars"] = { "terraform_fmt" },
          python = { "ruff_format" }, -- install with :MasonInstall ruff
          typescript = { "prettier" }, -- install with :MasonInstall prettier
          javascript = { "prettier" },
          json = { "prettier" },
          yaml = { "prettier" },
        },
        format_on_save = function(bufnr)
          -- skip silently if no formatter is configured/installed for this filetype
          return { timeout_ms = 1000, lsp_format = "fallback" }
        end,
        -- don't pop errors when a formatter isn't installed yet
        notify_on_error = false,
      })

      -- manual format, for when format-on-save isn't enough
      vim.keymap.set("n", "<leader>cf", function()
        require("conform").format({ timeout_ms = 1000, lsp_format = "fallback" })
      end, { desc = "Format buffer" })
    end,
  },
}
