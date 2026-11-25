-- Extra color themes. All load early (lazy = false, priority = 1000) so they are
-- available to the picker (Space f t) and can be the saved default.
-- None of these call vim.cmd.colorscheme; lua/config/theme.lua decides the active one.
-- Many ship several variants that show up as separate entries in the picker.
return {
  { "folke/tokyonight.nvim", lazy = false, priority = 1000 },       -- tokyonight, -night, -storm, -moon, -day
  { "rebelot/kanagawa.nvim", lazy = false, priority = 1000 },       -- kanagawa, -wave, -dragon, -lotus
  { "rose-pine/neovim", name = "rose-pine", lazy = false, priority = 1000 }, -- rose-pine, -moon, -dawn
  { "ellisonleao/gruvbox.nvim", lazy = false, priority = 1000 },    -- gruvbox
  { "EdenEast/nightfox.nvim", lazy = false, priority = 1000 },      -- nightfox, dayfox, dawnfox, duskfox, nordfox, terafox, carbonfox
  { "navarasu/onedark.nvim", lazy = false, priority = 1000 },       -- onedark
  { "shaunsingh/nord.nvim", lazy = false, priority = 1000 },        -- nord
  { "Mofiqul/dracula.nvim", lazy = false, priority = 1000 },        -- dracula, dracula-soft
  { "projekt0n/github-nvim-theme", lazy = false, priority = 1000 }, -- github_dark, github_light, github_dark_dimmed, ...
  { "sainnhe/gruvbox-material", lazy = false, priority = 1000 },    -- gruvbox-material
  { "sainnhe/sonokai", lazy = false, priority = 1000 },             -- sonokai
  { "Shatur/neovim-ayu", lazy = false, priority = 1000 },           -- ayu, ayu-dark, ayu-mirage, ayu-light
  -- cyberdream, cyberdream-light, cyberdream-muted
  -- transparent = true drops the theme's background so the terminal's opacity/blur shows through
  { "scottmckendry/cyberdream.nvim", lazy = false, priority = 1000, opts = { transparent = true } },
}
