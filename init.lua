require("khapro.keymaps")
require("khapro.tree")
require("khapro.tree-sitter")
require("khapro.theme")
require("khapro.icon")
-- require("khapro.mason")

-- Automatically format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.cmd([[CocCommand editor.action.formatDocument]])
  end,
})
