-- Open the cheat sheet in a side split (path derived from config dir, so it works on any machine)
vim.keymap.set("n", "<leader>ch", function()
  vim.cmd("vsplit " .. vim.fn.stdpath("config") .. "/CHEATSHEET.md")
end, { desc = "Open cheat sheet" })

-- Toggle terminal (opens at bottom, 12 lines)
vim.keymap.set("n", "<leader>`", function()
  local term_win = nil
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].buftype == "terminal" then
      term_win = win
      break
    end
  end
  if term_win then
    vim.api.nvim_win_close(term_win, true)
  else
    vim.cmd("botright 12split | terminal")
    vim.cmd("startinsert")
  end
end, { desc = "Toggle terminal" })

-- Escape terminal mode easily
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Quick jump between terminal and code
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Jump to pane above" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Jump to pane below" })

-- Resize splits
vim.keymap.set("n", "<leader>=", ":resize +3<CR>", { desc = "Increase height" })
vim.keymap.set("n", "<leader>-", ":resize -3<CR>", { desc = "Decrease height" })

-- Resize while in terminal mode
vim.keymap.set("t", "<leader>=", "<C-\\><C-n>:resize +3<CR>i", { desc = "Increase height" })
vim.keymap.set("t", "<leader>-", "<C-\\><C-n>:resize -3<CR>i", { desc = "Decrease height" })
