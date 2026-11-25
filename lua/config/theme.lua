-- Persistent colorscheme picker.
-- Space f t opens Telescope with live preview; Enter applies the theme AND saves it
-- to <nvim data dir>/colorscheme.txt so it comes back on the next launch.
-- Runs after lazy.nvim so every theme plugin (lazy = false) is already installed.

local M = {}
local save_file = vim.fn.stdpath("data") .. "/colorscheme.txt"
local fallback = "everforest"

local function apply(name)
  local ok = pcall(vim.cmd.colorscheme, name)
  if not ok then
    vim.notify("Theme '" .. name .. "' not found, using " .. fallback, vim.log.levels.WARN)
    vim.cmd.colorscheme(fallback)
  end
end

-- On startup: load the saved theme, or the fallback
function M.load()
  local name = fallback
  if vim.fn.filereadable(save_file) == 1 then
    name = (vim.fn.readfile(save_file)[1] or fallback):gsub("%s+$", "")
  end
  apply(name)
end

-- Picker: preview live, Enter = apply + save
function M.pick()
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")
  require("telescope.builtin").colorscheme({
    enable_preview = true,
    ignore_builtins = true, -- hide vim's stock themes (blue, desert, ...)
    attach_mappings = function(prompt_bufnr)
      actions.select_default:replace(function()
        local entry = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        if not entry then return end
        apply(entry.value)
        vim.fn.writefile({ entry.value }, save_file)
        vim.notify("Theme saved: " .. entry.value)
      end)
      return true
    end,
  })
end

vim.keymap.set("n", "<leader>ft", M.pick, { desc = "Pick theme (live preview, Enter saves)" })

M.load()
return M
