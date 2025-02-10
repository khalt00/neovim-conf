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
vim.api.nvim_set_keymap('n', '<leader>q', ':lua vim.fn.CocActionAsync("doHover")<CR>', { noremap = true, silent = true })

-- diagnostic

-- Diagnostic Mappings
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end

-- Diagnostic key mappings
vim.api.nvim_set_keymap('n', '<leader>cd', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true, desc = 'Line Diagnostics' })
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true, desc = 'Next Diagnostic' })
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true, desc = 'Prev Diagnostic' })
vim.api.nvim_set_keymap('n', ']e', '<cmd>lua vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })<CR>', { noremap = true, silent = true, desc = 'Next Error' })
vim.api.nvim_set_keymap('n', '[e', '<cmd>lua vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })<CR>', { noremap = true, silent = true, desc = 'Prev Error' })
vim.api.nvim_set_keymap('n', ']w', '<cmd>lua vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN })<CR>', { noremap = true, silent = true, desc = 'Next Warning' })
vim.api.nvim_set_keymap('n', '[w', '<cmd>lua vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN })<CR>', { noremap = true, silent = true, desc = 'Prev Warning' })

vim.cmd [[
  highlight YankHighlight guibg=#ffdd00 gui=reverse
]]

-- Create an autocommand group
vim.api.nvim_create_augroup("highlight_yank", { clear = true })

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = "highlight_yank",
  callback = function()
    vim.highlight.on_yank({ timeout = 200 }) -- Adjust timeout as needed
  end,
})

-- Visual replace without overwriting the default register
vim.keymap.set("x", "<leader>p", [["_dP]])
-- code suggestion => enter
vim.api.nvim_set_keymap('i', '<CR>', [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], { noremap = true, expr = true, silent = true })
