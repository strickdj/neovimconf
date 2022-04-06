require "user.options"
vim.cmd("source ~/.config/nvim/vimscript_extra.vim")

require "user.keymaps"
vim.cmd("source ~/.config/nvim/remaps.vim")

require "user.plugins"
require "user.colorscheme"
require "user.cmp"

require "alpha"
require "user.lsp"
require "user.lint"
require "user.telescope"
require "user.treesitter"
require "user.autopairs"
require "user.whichkey"
require "user.autocommands"


-- require "comment"
-- require "nvim-tree"
-- require "impatient"
-- require "indentline"
--
