# Neovim Cheat Sheet

> Leader key = **Space**
>
> Forgot a keymap? Press `Space` and **pause** — which-key pops up everything
> available from there. `Space ?` shows buffer-local maps.
> `Space c h` opens this cheat sheet in a side split from anywhere.
> Close it with `q`, `Esc`, or `Space c h` again.

## Finding files (Telescope)

| Keys | Action |
|---|---|
| `Space f f` | Find files by name |
| `Space f g` | Live grep (search file *contents*) |
| `Space f b` | List open buffers |
| `Space f h` | Search help docs |
| `Space f t` | Pick a color theme: arrow keys preview live, `Enter` saves it for next time |

Inside the Telescope picker: type to filter, `Ctrl-n`/`Ctrl-p` (or arrows) to move,
`Enter` to open, `Ctrl-v` open in vertical split, `Ctrl-x` horizontal split, `Esc` `Esc` to close.

## Open files as tabs (bufferline)

Every open file shows as a tab across the top. Opening a file never closes the
previous one; it just adds a tab.

| Keys | Action |
|---|---|
| `Shift-l` / `Shift-h` | Next / previous tab |
| `Space b d` | Close the current tab (refuses if unsaved; `:w` first) |
| `Space b o` | Close every tab except the current one |
| `Space b p` | Pick a tab: letters appear on each tab, press one to jump |
| Mouse click | Click a tab to switch, click its `x` to close |

## File tree (Neo-tree)

| Keys | Action |
|---|---|
| `Space e` | Toggle the file tree |
| `Space o` | Reveal current file in the tree |

Inside the tree: `Enter` open, `a` new file, `A` new directory, `d` delete,
`r` rename, `x` cut, `y` copy, `p` paste, `H` toggle hidden files, `?` show all mappings.

## Resizing windows (tree, code, terminal)

First put the cursor in the window you want to resize (`Ctrl-w h/j/k/l` or click it).

| Keys | Action |
|---|---|
| **Hold** `Shift+Right` / `Shift+Left` | Wider / narrower, keeps going while held |
| **Hold** `Shift+Up` / `Shift+Down` | Taller / shorter, keeps going while held |
| `Space .` | Wider (+5 columns) |
| `Space ,` | Narrower (-5 columns) |
| `Space =` | Taller (+3 lines) |
| `Space -` | Shorter (-3 lines) |
| `Space 0` | Reset: make all windows equal size |
| `Ctrl-w \|` | Maximize this window's width |
| `Ctrl-w _` | Maximize this window's height |

`Space .` etc. can be pressed repeatedly. The file tree defaults to 30 columns
(`width = 30` in `lua/plugins/neo-tree.lua`) if you want a permanent change.

## Terminal (custom keymaps)

| Keys | Action |
|---|---|
| ``Space ` `` | Toggle a 12-line terminal at the bottom |
| `Esc` (in terminal) | Exit terminal-insert mode |
| `Ctrl-k` (in terminal) | Jump up to the code pane |
| `Ctrl-j` (in code) | Jump down to the terminal pane |
| Hold `Shift+Up` / `Shift+Down` (in terminal) | Grow / shrink the split. `Space =` / `Space -` are normal-mode only so spaces reach the shell |

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

## Treesitter

Syntax highlighting and indentation are on automatically for every language in
`lua/plugins/treesitter.lua`. Missing parsers install themselves on first open.

| Command | Action |
|---|---|
| `:TSInstall <lang>` | Install a parser by hand |
| `:TSUpdate` | Update all parsers |
| `:checkhealth nvim-treesitter` | Diagnose treesitter problems |

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
