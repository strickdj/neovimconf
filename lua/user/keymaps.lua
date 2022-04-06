local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Make Y behave like C D etc...
keymap("n", "Y", "y$", opts)

-- Keep Cursor centered
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "J", "mzJ`z", opts)

-- Insert --
-- Press jj fast to enter
keymap("i", "jj", "<ESC>", opts)

-- Undo breakpoints
keymap("i", ",", ",<C-g>u", opts)
keymap("i", ".", ".<C-g>u", opts)
keymap("i", "!", "!<C-g>u", opts)
keymap("i", "?", "?<C-g>u", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Moving Text (alternative)
-- keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
-- keymap("v", "K", ":m '<-2<CR>gv=gv", opts)
-- keymap("n", "<leader>k", ":m .-2<CR>==", opts)
-- keymap("n", "<leader>j", ":m .+1<CR>==", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Telescope Keymaps

keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
keymap("n", "<leader>fr", "<cmd>lua require('telescope.builtin').lsp_references()<cr>", opts)
keymap("n", "<leader>fd", "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>", opts)
keymap("n", "<leader>ft", "<cmd>lua require('telescope.builtin').lsp_type_definitions()<cr>", opts)

-- Trouble Remaps
keymap("n", "<leader>xx", "<cmd>Trouble<cr>", opts)
keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", opts)
keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", opts)
keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", opts)
keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", opts)
keymap("n", "gR", "<cmd>Trouble lsp_references<cr>", opts)

-- -- " Fugative git integration
-- nmap <leader>gj :diffget //3<CR>
-- nmap <leader>gf :diffget //2<CR>
-- nmap <leader>gs :G<CR>
keymap("n", "<leader>gj", "<cmd>diffget //3<cr>", { silent = true })
keymap("n", "<leader>gf", "<cmd>diffget //2<cr>", { silent = true })
keymap("n", "<leader>gs", "<cmd>G<cr>", { silent = true })

-- " remap : to ;
-- nnoremap ; :
-- vnoremap ; :
keymap("n", ";", ":", opts)
keymap("v", ";", ":", opts)

-- " paste last thing yanked
-- nmap ,p "0p
-- nmap ,P "0P
keymap("n", ",p", '"0p', { silent = true })
keymap("n", ",P", '"0P', { silent = true })

-- " vim-surround maps
-- nmap <leader>` ysiw`
keymap("n", "<leader>`", "ysiw`", { silent = true })

-- " next greatest remap ever : asbjornHaland
-- nnoremap <leader>y "+y
-- vnoremap <leader>y "+y
-- nmap <leader>Y "+Y
keymap("n", "<leader>y", '"+y', opts)
keymap("v", "<leader>y", '"+y', opts)
keymap("n", "<leader>Y", '"+Y', { silent = true })
