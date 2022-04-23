-- vim.g.material_style = "darker"

-- Enable telescope theme
vim.g.gruvbox_baby_telescope_theme = 1

vim.cmd([[
try
  " colorscheme material
  colorscheme gruvbox-baby
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]])

-- require("material").setup()
