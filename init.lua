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

-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*.go",
--   callback = function()
--     vim.fn.CocAction('runCommand', 'editor.action.organizeImport')
--   end
-- })
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    pcall(vim.fn.CocAction, 'runCommand', 'editor.action.organizeImport')
  end,
})

