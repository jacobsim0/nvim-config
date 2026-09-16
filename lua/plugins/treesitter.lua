return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main", -- master is archived and breaks on Neovim 0.12+
    build = ":TSUpdate",
    lazy = false, -- load at startup
    config = function()
      local ts = require("nvim-treesitter")
      ts.setup({})

      -- parsers to ensure are installed (needs `tree-sitter` CLI + C compiler)
      local parsers = {
        "lua", "vim", "vimdoc", "query",
        "markdown", "markdown_inline",
        "python", "javascript", "typescript", "html", "css",
        "go", "gomod", "terraform", "hcl",
        "yaml", "json", "bash", "dockerfile",
      }
      ts.install(parsers)

      -- highlight + indent: main branch has no modules; enable per buffer
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("treesitter_enable", { clear = true }),
        callback = function(ev)
          local lang = vim.treesitter.language.get_lang(ev.match)
          if not lang then return end
          -- skip plugin UI buffers (neo-tree, telescope, lazy, ...) and unknown languages
          if vim.bo[ev.buf].buftype ~= "" then return end
          if not vim.list_contains(ts.get_available(), lang) then return end
          -- auto-install missing parsers when entering a buffer
          if not vim.treesitter.language.add(lang) then
            ts.install({ lang }):await(function()
              if vim.api.nvim_buf_is_valid(ev.buf) then
                pcall(vim.treesitter.start, ev.buf, lang)
              end
            end)
            return
          end
          pcall(vim.treesitter.start, ev.buf, lang)
          vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
}
