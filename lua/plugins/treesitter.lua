return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master", -- the repo is moving to main eventually
    build = ":TSUpdate", -- auto update parsers on install/update
    lazy = false, -- load at startup
    config = function()
      require("nvim-treesitter.configs").setup({
        -- parsers to ensure are installed
        ensure_installed = {
          "lua", "vim", "vimdoc", "query",
          "markdown", "markdown_inline",
          "python", "javascript", "typescript", "html", "css",
          "go", "gomod", "terraform", "hcl",
          "yaml", "json", "bash", "dockerfile",
        },

        sync_install = false,   -- install asynchronously
        auto_install = true,    -- auto install missing parsers when entering buffer

        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },

        indent = {
          enable = true,
        },

        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
      })
    end,
  },
}
