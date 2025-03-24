
require('telescope').setup {
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    entry_prefix = "  ",
    sorting_strategy = "ascending",
    layout_config = {
      prompt_position = "top",
    },
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    winblend = 10, 
  },
  pickers = {
    find_files = {
      theme = "dropdown", 
    },
    live_grep = {
      theme = "ivy",
    },
  },
  extensions = {},
}

vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true, silent = true })

