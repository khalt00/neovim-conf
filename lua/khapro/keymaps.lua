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

-- Diagnostic Mappings
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end

vim.api.nvim_set_keymap("n", "[d", "<Plug>(coc-diagnostic-prev)", { silent = true })
vim.api.nvim_set_keymap("n", "]d", "<Plug>(coc-diagnostic-next)", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>d", ":CocDiagnostics<CR>", { noremap = true, silent = true })

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

-- collapse
vim.api.nvim_set_keymap("n", "<leader>f", "zfa}", { noremap = true, silent = true })

-- quickfix
vim.api.nvim_set_keymap("n", "<C-Space>", "<Plug>(coc-codeaction)", { silent = true })

