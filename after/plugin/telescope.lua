local builtin = require("telescope.builtin")

-- print("yo")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>fr", builtin.lsp_references, {})
vim.keymap.set("n", "<leader>fd", builtin.lsp_definitions, {})
vim.keymap.set("n", "<leader>ft", builtin.lsp_type_definitions, {})

vim.keymap.set("n", "<C-p>", builtin.git_files, {})

vim.keymap.set("n", "<leader>ps", function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

-- keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
-- keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
-- keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
-- keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
-- keymap("n", "<leader>fr", "<cmd>lua require('telescope.builtin').lsp_references()<cr>", opts)
-- keymap("n", "<leader>fd", "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>", opts)
-- keymap("n", "<leader>ft", "<cmd>lua require('telescope.builtin').lsp_type_definitions()<cr>", opts)
-- j
--
--
