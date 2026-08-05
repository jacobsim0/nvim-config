# Neovim Cheat Sheet

> Leader key = **Space**
>
> Forgot a keymap? Press `Space` and **pause** — which-key pops up everything
> available from there. `Space ?` shows buffer-local maps.
> `Space c h` opens this cheat sheet in a side split from anywhere.

## Finding files (Telescope)

| Keys | Action |
|---|---|
| `Space f f` | Find files by name |
| `Space f g` | Live grep (search file *contents*) |
| `Space f b` | List open buffers |
| `Space f h` | Search help docs |

Inside the Telescope picker: type to filter, `Ctrl-n`/`Ctrl-p` (or arrows) to move,
`Enter` to open, `Ctrl-v` open in vertical split, `Ctrl-x` horizontal split, `Esc` `Esc` to close.

## File tree (Neo-tree)

| Keys | Action |
|---|---|
| `Space e` | Toggle the file tree |
| `Space o` | Reveal current file in the tree |

Inside the tree: `Enter` open, `a` new file, `A` new directory, `d` delete,
`r` rename, `x` cut, `y` copy, `p` paste, `H` toggle hidden files, `?` show all mappings.

## Terminal (custom keymaps)

| Keys | Action |
|---|---|
| ``Space ` `` | Toggle a 12-line terminal at the bottom |
| `Esc` (in terminal) | Exit terminal-insert mode |
| `Ctrl-k` (in terminal) | Jump up to the code pane |
| `Ctrl-j` (in code) | Jump down to the terminal pane |
| `Space =` / `Space -` | Grow / shrink the split (works in terminal too) |

## Completion (nvim-cmp, insert mode)

| Keys | Action |
|---|---|
| `Tab` / `Shift-Tab` | Next / previous suggestion |
| `Enter` | Accept suggestion |
| `Ctrl-Space` | Manually trigger completion |

## LSP (gopls, pyright, terraformls, bashls)

These are Neovim 0.11 built-in defaults — active whenever an LSP is attached:

| Keys | Action |
|---|---|
| `K` | Hover docs for symbol under cursor |
| `Ctrl-]` | Go to definition (`Ctrl-t` to jump back) |
| `g r r` | List references |
| `g r n` | Rename symbol |
| `g r a` | Code action |
| `g r i` | Go to implementation |
| `g O` | Document symbols (outline) |
| `[ d` / `] d` | Previous / next diagnostic |
| `Ctrl-w d` | Show diagnostic detail in a float |
| `:Mason` | Manage installed language servers |

## Treesitter incremental selection

| Keys | Action |
|---|---|
| `g n n` | Start selection at cursor node |
| `g r n` (visual) | Expand selection to next node |
| `g r c` (visual) | Expand to scope |
| `g r m` (visual) | Shrink selection |

## Git (gitsigns)

| Keys | Action |
|---|---|
| `] c` / `[ c` | Next / previous changed hunk |
| `Space h s` | Stage hunk under cursor |
| `Space h r` | Reset (discard) hunk under cursor |
| `Space h p` | Preview hunk diff in a float |
| `Space h b` | Blame current line (full commit info) |

## Formatting (conform)

Format-on-save is enabled: `terraform fmt` for .tf, `gofmt` for Go,
`ruff` for Python, `prettier` for TS/JS/JSON/YAML (install the last two
with `:MasonInstall ruff prettier`).

| Keys | Action |
|---|---|
| `Space c f` | Format buffer manually |

## Markdown

`.md` files render prettified automatically (render-markdown.nvim);
lines revert to raw text while you edit them.

| Command | Action |
|---|---|
| `:RenderMarkdown toggle` | Switch between rendered and raw view |

## Plugin management (lazy.nvim)

| Command | Action |
|---|---|
| `:Lazy` | Open plugin dashboard (shows pending updates) |
| `:Lazy update` | Update plugins + write lazy-lock.json |
| `:Lazy restore` | Roll plugins back to lazy-lock.json versions |

## Core vim survival (built-in, not custom)

| Keys | Action |
|---|---|
| `Ctrl-w v` / `Ctrl-w s` | Vertical / horizontal split |
| `Ctrl-w h/j/k/l` | Move between splits |
| `:w` `:q` `:wq` | Save / quit / both |
| `gg` / `G` | Top / bottom of file |
| `Ctrl-o` / `Ctrl-i` | Jump back / forward in jump history |
| `u` / `Ctrl-r` | Undo / redo |
