require("khapro.keymaps")
require("khapro.tree")
require("khapro.tree-sitter")
require("khapro.theme")
require("khapro.icon")
require("khapro.harpoon")
require("khapro.telescope")
-- require("khapro.lsp")
-- require("khapro.mason")

-- Automatically format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.cmd([[CocCommand editor.action.formatDocument]])
  end,
})

-- This line make y,p, d => use system clipboard
vim.opt.clipboard = vim.opt.clipboard + 'unnamedplus'

vim.diagnostic.config({
  virtual_text = true, -- Show inline errors
  signs = true,        -- Show signs in the gutter
  underline = true,    -- Underline errors
  update_in_insert = false, -- Update diagnostics only after insert mode
  severity_sort = true, -- Sort by severity
})
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*.go",
--   callback = function()
--     vim.fn.CocAction('runCommand', 'editor.action.organizeImport')
--     vim.fn.CocAction('runCommand', 'editor.action.formatDocument')
--   end,
-- })
-- This one suck 
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*.go",
--   callback = function()
--     vim.fn.CocAction('runCommand', 'editor.action.organizeImport')
--   end
-- })
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*.go",
--   callback = function()
--     pcall(vim.fn.CocAction, 'runCommand', 'editor.action.organizeImport')
--   end,
-- })

