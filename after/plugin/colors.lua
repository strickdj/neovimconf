function ColorScheme(color)
    color = color or "gruvbox"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end
-- Enable telescope theme
vim.g.gruvbox_baby_telescope_theme = 1

-- vim.cmd([[
-- try
--   colorscheme gruvbox-baby
-- catch /^Vim\%((\a\+)\)\=:E185/
--   colorscheme default
--   set background=dark
-- endtry
-- ]])

ColorScheme()
