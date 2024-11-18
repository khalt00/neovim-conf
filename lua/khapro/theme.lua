vim.cmd.colorscheme "catppuccin"

-- local colorschemes = { 
--     "blue", "catppuccin", "catppuccin-frappe", "catppuccin-latte", 
--     "catppuccin-macchiato", "catppuccin-mocha", "darkblue", "default", 
--     "delek", "desert", "elflord", "evening", "habamax", "industry", 
--     "koehler", "lunaperche", "morning", "murphy", "pablo", 
--     "peachpuff", "quiet", "retrobox", "ron", "shine", "slate", 
--     "sorbet", "torte", "vim", "wildcharm", "zaibatsu", "zellner" 
-- }
--
-- local current_index = 1 -- Start with the first colorscheme
--
-- -- Function to toggle colorschemes
-- local function toggle_colorscheme()
--     -- Get the current colorscheme and set it
--     local current_colorscheme = colorschemes[current_index]
--     vim.cmd("colorscheme " .. current_colorscheme)
--
--     -- Print the currently applied colorscheme
--     print("Colorscheme set to: " .. current_colorscheme)
--
--     -- Move to the next colorscheme in the list
--     current_index = (current_index % #colorschemes) + 1
-- end
--
-- -- Keybinding to toggle colorschemes
-- vim.keymap.set("n", "<leader>tc", toggle_colorscheme, { noremap = true, silent = true })
--
local colorschemes = { 
    "blue", "catppuccin", "catppuccin-frappe", "catppuccin-latte", 
    "catppuccin-macchiato", "catppuccin-mocha", "darkblue", "default", 
    "delek", "desert", "elflord", "evening", "habamax", "industry", 
    "koehler", "lunaperche", "morning", "murphy", "pablo", 
    "peachpuff", "quiet", "retrobox", "ron", "shine", "slate", 
    "sorbet", "torte", "vim", "wildcharm", "zaibatsu", "zellner" 
}

local telescope = require('telescope')
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

-- Function to open a picker for colorschemes
local function pick_colorscheme()
    pickers.new({}, {
        prompt_title = "Choose Colorscheme",
        finder = finders.new_table(colorschemes),
        sorter = require('telescope.sorters').get_generic_fuzzy_sorter(),
        attach_mappings = function(prompt_bufnr, map)
            -- Preview colorscheme on hover
            local preview_colorscheme = function()
                local selection = action_state.get_selected_entry()
                if selection then
                    vim.cmd("colorscheme " .. selection[1])
                end
            end

            -- Bind <CR> to select the colorscheme
            map('i', '<CR>', function()
                local selection = action_state.get_selected_entry()
                actions.close(prompt_bufnr)
                if selection then
                    vim.cmd("colorscheme " .. selection[1])
                    print("Colorscheme set to: " .. selection[1])
                end
            end)

            -- Update colorscheme on hover
            map('i', '<Tab>', preview_colorscheme)
            map('n', '<Tab>', preview_colorscheme)

            -- Automatically preview as selection changes
            actions.select_default:replace(function()
                preview_colorscheme()
            end)

            return true
        end,
    }):find()
end

-- Keybinding to open the colorscheme picker
vim.keymap.set("n", "<leader>tc", pick_colorscheme, { noremap = true, silent = true })
