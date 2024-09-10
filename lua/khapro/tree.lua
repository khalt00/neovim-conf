-- Keybinding to toggle nvim-tree
vim.api.nvim_set_keymap("n", "<leader>fe", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
require("nvim-tree").setup {
  view = {
    width = 30,               -- Width of the file explorer
    side = "left",            -- File explorer on the left
  },
}

