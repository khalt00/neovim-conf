require'nvim-treesitter.configs'.setup {
  ensure_installed = { "go", "lua", "javascript", "python","solidity" }, -- List of languages
  highlight = {
    enable = true,              -- Enable Tree-sitter-based highlighting
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,              -- Enable Tree-sitter-based indentation
  },
}
