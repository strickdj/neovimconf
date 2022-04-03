-- Make some modules easier to access.
local execute = vim.api.nvim_command
local fn = vim.fn
local fmt = string.format

-- Work out where our plugins will be stored.

local pack_path = fn.stdpath("data") .. "/site/pack"
function ensure (user, repo)
  -- Ensures a given github.com/USER/REPO is cloned in the pack/packer/start directory.
  local install_path = fmt("%s/packer/start/%s", pack_path, repo, repo)
  if fn.empty(fn.glob(install_path)) > 0 then
    execute(fmt("!git clone https://github.com/%s/%s %s", user, repo, install_path))
    execute(fmt("packadd %s", repo))
  end
end

-- Packer plugin manager
ensure("wbthomason", "packer.nvim")

-- added a comment
vim.cmd 'source ~/.config/nvim/vimscript_extra.vim'

--vim.g.ale_completion_enabled = 1

-- Require plugins
require('plugins')


local map = vim.api.nvim_set_keymap
local mapopts = { noremap = true, silent = true }

vim.opt.colorcolumn = '80'
-- print(vim.inspect(vim.opt.colorcolumn))
vim.opt.listchars = {eol = '↲', tab = '▸ ', trail = '·'}
vim.opt.list = true

map('n', '<Space>', '', {})
vim.g.mapleader = ' '

vim.g.material_style = 'darker'
vim.cmd 'colorscheme material'

vim.cmd 'source ~/.config/nvim/remaps.vim'

-- Make Y behave like C D etc...
map("n", "Y", "y$", mapopts)

-- Keep Cursor centered
map("n", "n", "nzzzv", mapopts)
map("n", "N", "Nzzzv", mapopts)
map("n", "J", "mzJ`z", mapopts)

-- Undo breakpoints
map("i", ",", ",<C-g>u", mapopts)
map("i", ".", ".<C-g>u", mapopts)
map("i", "!", "!<C-g>u", mapopts)
map("i", "?", "?<C-g>u", mapopts)

-- Moving Text
map("v", "J", ":m '>+1<CR>gv=gv", mapopts)
map("v", "K", ":m '<-2<CR>gv=gv", mapopts)
map("i", "<C-j>", "<Esc>:m .+1<CR>==", mapopts)
map("i", "<C-k>", "<Esc>:m .-2<CR>==", mapopts)
map("n", "<leader>k", ":m .-2<CR>==", mapopts)
map("n", "<leader>j", ":m .+1<CR>==", mapopts)

require('material').setup({
  lualine_style = 'default' -- or ''stealth'
})
require('lualine').setup()
require('which-key').setup()

-- vim.g.ale_linters = {
--   javascript = {'eslint', 'tslint'},
--   jsx = {'stylelint', 'eslint'},
--   clojure = {'clj-kondo', 'joker'},
--   go = {'golint'},
--   php = {'intelephense'},
-- }

-- vim.g.ale_fixers = {
--    ['*'] = {'remove_trailing_lines', 'trim_whitespace'},
--    javascript = {'prettier'},
--    css = {'prettier'},
-- }
-- vim.g.ale_javascript_prettier_options = '--single-quote --trailing-comma all'
-- vim.g.ale_fix_on_save = true


-- Telescope
local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

local telescope = require("telescope")

telescope.setup {
  defaults = {
    mappings = {
      i = { ["<c-t>"] = trouble.open_with_trouble },
      n = { ["<c-t>"] = trouble.open_with_trouble },
    },
  },
  fzf = {
    fuzzy = true,
    override_generic_sorter = true,
    override_file_sorter = true,
    case_mode = 'ignore_case',
  }
}

-- telescope.load_extension('fzf')

-- Telescope Mappings
map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", mapopts)
map("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", mapopts)
map("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", mapopts)
map("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", mapopts)
map("n", "<leader>fr", "<cmd>lua require('telescope.builtin').lsp_references()<cr>", mapopts)
map("n", "<leader>fd", "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>", mapopts)
map("n", "<leader>ft", "<cmd>lua require('telescope.builtin').lsp_type_definitions()<cr>", mapopts)


require('nvim-treesitter.configs').setup({
  ensure_installed = 'maintained',
  highlight = {
    enabled = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enabled = true,
  },
})


-- Trouble Remaps
map("n", "<leader>xx", "<cmd>Trouble<cr>", mapopts)
map("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", mapopts)
map("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", mapopts)
map("n", "<leader>xl", "<cmd>Trouble loclist<cr>", mapopts)
map("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", mapopts)
map("n", "gR", "<cmd>Trouble lsp_references<cr>", mapopts)

-- LSP Server Configurations

-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },

  completion = {
    completeopt = 'menu,menuone,noselect',
  },

  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace,
    }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
-- cmp.setup.filetype('gitcommit', {
--   sources = cmp.config.sources({
--     { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
--   }, {
--     { name = 'buffer' },
--   })
-- })

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})


require("null-ls").setup({
    -- you can reuse a shared lspconfig on_attach callback here
    on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
            vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]])
        end
    end,
})

-- -- Setup lspconfig.
local nvim_lsp = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
nvim_lsp['intelephense'].setup {
  capabilities = capabilities
}

nvim_lsp["null-ls"].setup({ on_attach = on_attach })

-- short cut methods.
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = mapopts

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end
