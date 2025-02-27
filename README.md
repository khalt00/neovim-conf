# Neovim Configuration
This repository contains my Neovim configuration setup with essential plugins and tools for enhanced development.
# Installation Instructions
## Clone the Neovim Configuration
git clone git@github.com:khalt00/neovim-conf.git ~/.config/nvim 

## Install Plugins

Clone the required plugins to your Neovim plugin directory:

- git clone https://github.com/kyazdani42/nvim-web-devicons ~/.local/share/nvim/site/pack/plugins/start/nvim-web-devicons
- git clone https://github.com/catppuccin/nvim ~/.local/share/nvim/site/pack/plugins/start/catppuccin
  - Install a font from https://www.nerdfonts.com/font-downloads
  - unzip [something-font].zip -d ~/.fonts
  - fc-cache -fv
  - open terminal -> preferences -> Unnamed -> click custom font -> choose the font you download
- git clone https://github.com/nvim-treesitter/nvim-treesitter ~/.local/share/nvim/site/pack/plugins/start/nvim-treesitter
- git clone https://github.com/kyazdani42/nvim-tree.lua ~/.local/share/nvim/site/pack/plugins/start/nvim-tree.lua
- git clone https://github.com/neoclide/coc.nvim.git ~/.local/share/nvim/site/pack/plugins/start/coc.nvim
  - cd ~/.local/share/nvim/site/pack/plugins/start/coc.nvim && npm ci
- git clone https://github.com/nvim-telescope/telescope.nvim.git ~/.local/share/nvim/site/pack/plugins/start/telescope.nvim
- git clone https://github.com/nvim-lua/plenary.nvim ~/.local/share/nvim/site/pack/plugins/start/plenary.nvim
- git clone https://github.com/ThePrimeagen/harpoon.git ~/.local/share/nvim/site/pack/plugins/start/harpoon
  - git checkout harpoon2

## Language Server Setup (should install what you use and check [coc](https://github.com/neoclide/coc.nvim) for more information)
- go : go install golang.org/x/tools/gopls@latest
- solidity: npm install -g @nomicfoundation/solidity-language-server
- tailwind: npm install -g @tailwindcss/language-server
- typescript: npm install -g typescript typescript-language-server

