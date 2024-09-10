-- Load 'telescope' plugin
require('telescope').setup{
  defaults = {
    -- Your Telescope configuration options
  }
}

-- Optionally, set up Telescope key mappings
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true, silent = true })

