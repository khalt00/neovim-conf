vim.cmd("packadd! catppuccin") 

require("catppuccin").setup({
    no_italic = true,
    term_colors = false,
    transparent_background = true, -- Keep transparency
    custom_highlights = function(colors)
        return {
            Comment = { fg = colors.flamingo },
            TabLineSel = { bg = colors.pink },
            CmpBorder = { fg = colors.surface2 },
            Pmenu = { bg = colors.none },
        }
    end
})
vim.cmd("colorscheme catppuccin") -- Apply colorscheme


print("Custom Catppuccin theme with transparency loaded!")

