-- Open the cheat sheet in a side split (path derived from config dir, so it works on any machine)
-- Space c h toggles it; inside the sheet, `q` or Esc closes it.
local cheat_path = vim.fn.stdpath("config") .. "/CHEATSHEET.md"
vim.keymap.set("n", "<leader>ch", function()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win)) == cheat_path then
      vim.api.nvim_win_close(win, false)
      return
    end
  end
  vim.cmd("vsplit " .. cheat_path)
  vim.bo.buflisted = false
  local close = function() vim.cmd("close") end
  vim.keymap.set("n", "q", close, { buffer = true, desc = "Close cheat sheet" })
  vim.keymap.set("n", "<Esc>", close, { buffer = true, desc = "Close cheat sheet" })
end, { desc = "Toggle cheat sheet" })

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
vim.keymap.set("n", "<leader>.", ":vertical resize +5<CR>", { desc = "Increase width" })
vim.keymap.set("n", "<leader>,", ":vertical resize -5<CR>", { desc = "Decrease width" })
vim.keymap.set("n", "<leader>0", "<C-w>=", { desc = "Equalize all splits" })


-- Hold-to-resize: Shift+arrows auto-repeat while held (Alt+arrows too, if the terminal sends them)
for _, mods in ipairs({ "S", "A" }) do
  local n = { ["Right"] = ":vertical resize +2<CR>", ["Left"] = ":vertical resize -2<CR>",
              ["Up"] = ":resize +1<CR>",             ["Down"] = ":resize -1<CR>" }
  for key, cmd in pairs(n) do
    local lhs = "<" .. mods .. "-" .. key .. ">"
    vim.keymap.set("n", lhs, cmd, { silent = true, desc = "Resize (" .. key .. ")" })
    vim.keymap.set("t", lhs, "<C-\\><C-n>" .. cmd .. "i", { silent = true, desc = "Resize (" .. key .. ")" })
  end
end
