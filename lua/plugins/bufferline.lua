-- Open files shown as tabs across the top.
-- Shift-h / Shift-l move left / right, Space b d closes the current tab.
return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
      require("bufferline").setup({
        options = {
          diagnostics = "nvim_lsp", -- show LSP error/warning counts on each tab
          -- keep the tab bar from drawing over the file tree
          offsets = {
            { filetype = "neo-tree", text = "Files", highlight = "Directory", separator = true },
          },
          -- hide the Space ` terminal from the tab bar
          custom_filter = function(buf)
            return vim.bo[buf].buftype ~= "terminal"
          end,
        },
      })

      -- Close the current file without closing its window (so the tree never takes over the screen)
      local function close_buffer()
        local buf = vim.api.nvim_get_current_buf()
        if vim.bo[buf].buftype ~= "" then return end -- tree, terminal, help: not a file tab
        if vim.bo[buf].modified then
          vim.notify("Unsaved changes: save with :w first, or :bd! to discard", vim.log.levels.WARN)
          return
        end
        local others = vim.tbl_filter(function(b)
          return b ~= buf and vim.bo[b].buflisted and vim.bo[b].buftype == ""
        end, vim.api.nvim_list_bufs())
        if #others == 0 then
          vim.cmd("enew") -- last file: leave an empty buffer behind
        else
          vim.cmd("BufferLineCyclePrev")
        end
        vim.cmd("bdelete " .. buf)
      end

      vim.keymap.set("n", "<S-h>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Previous tab" })
      vim.keymap.set("n", "<S-l>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next tab" })
      vim.keymap.set("n", "<leader>bd", close_buffer, { desc = "Close this tab" })
      vim.keymap.set("n", "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", { desc = "Close all other tabs" })
      vim.keymap.set("n", "<leader>bp", "<Cmd>BufferLinePick<CR>", { desc = "Pick a tab by letter" })
    end,
  },
}
