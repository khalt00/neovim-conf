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


