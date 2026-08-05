# nvim config

Personal Neovim setup — Lua config managed with [lazy.nvim](https://github.com/folke/lazy.nvim),
plugin versions pinned in `lazy-lock.json` so every machine gets the identical editor.

See **[CHEATSHEET.md](CHEATSHEET.md)** for all keymaps (or press `Space c h` inside nvim).

## What's in it

- **Theme**: everforest (catppuccin also installed — `:Telescope colorscheme` live-previews)
- **Finding things**: telescope (fuzzy find + grep), neo-tree (file tree)
- **Editing**: treesitter highlighting, nvim-cmp completion, autopairs, render-markdown
- **LSP**: mason-managed servers — gopls, pyright, terraformls, bashls
- **Formatting**: conform format-on-save — terraform fmt, gofmt, ruff, prettier
- **Git**: gitsigns (gutter markers, hunk staging, blame)
- **UI**: lualine statusline, which-key (press `Space` and pause to discover keymaps)

## Install

```bash
# Mac / Linux
git clone https://github.com/jacobsim0/nvim-config ~/.config/nvim

# Windows (PowerShell)
git clone https://github.com/jacobsim0/nvim-config $env:LOCALAPPDATA\nvim
```

Launch `nvim` — lazy.nvim bootstraps itself, installs all plugins at the locked
versions, and Mason downloads the language servers. Then inside nvim:

```
:MasonInstall ruff prettier
```

### Prerequisites

- Neovim ≥ 0.11
- git, a C compiler (treesitter parsers), node (pyright/bashls/prettier)
- A [Nerd Font](https://www.nerdfonts.com) set in your terminal (e.g. JetBrainsMono Nerd Font)

## Layout

```
init.lua              entry point
lua/config/           lazy.nvim bootstrap, keymaps, options
lua/plugins/          one file per plugin
lazy-lock.json        pinned plugin versions (commit this)
CHEATSHEET.md         all keymaps
```
