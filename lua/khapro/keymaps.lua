vim.g.mapleader = " "

vim.keymap.set("n","<leader>pv",vim.cmd.Ex)

vim.o.number = true           -- Enable line numbers
vim.o.relativenumber = true   -- Enable relative line numbers
vim.o.termguicolors = true    -- Enable true colors
vim.g.autoformat = true

-- save file
vim.api.nvim_set_keymap('i', '<C-s>', '<cmd>w<CR>', { noremap = true, silent = true, desc = 'Save file' })
vim.api.nvim_set_keymap('x', '<C-s>', '<cmd>w<CR>', { noremap = true, silent = true, desc = 'Save file' })
vim.api.nvim_set_keymap('n', '<C-s>', '<cmd>w<CR>', { noremap = true, silent = true, desc = 'Save file' })
vim.api.nvim_set_keymap('s', '<C-s>', '<cmd>w<CR>', { noremap = true, silent = true, desc = 'Save file' })

-- Delete search with esc
vim.api.nvim_set_keymap('i', '<esc>', '<cmd>noh<cr><esc>', { noremap = true, silent = true, desc = "Escape and Clear hlsearch" })
vim.api.nvim_set_keymap('n', '<esc>', '<cmd>noh<cr><esc>', { noremap = true, silent = true, desc = "Escape and Clear hlsearch" })
-- Key mappings for coc.nvim
vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'K', '<Plug>(coc-hover)', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>g', 'gD', { noremap = true, silent = true })
