-- Path to the file where the selected colorscheme will be stored
local colorscheme_file = vim.fn.stdpath('config') .. '/colorscheme.txt'

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
                    -- Save the selected colorscheme to file
                    vim.fn.writefile({selection[1]}, colorscheme_file)
                    vim.cmd("colorscheme " .. selection[1])
                    print("Colorscheme set to: " .. selection[1])
                end
            end)

	  -- Apply theme temporarily on arrow key navigation
            map('i', '<Down>', function()
                actions.move_selection_next(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                if selection then
                    preview_colorscheme(selection[1])
                end
            end)

            map('i', '<Up>', function()
                actions.move_selection_previous(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                if selection then
                    preview_colorscheme(selection[1])
                end
            end)

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

-- Load the colorscheme when vim starts
local function load_colorscheme()
    local theme = vim.fn.readfile(colorscheme_file)
    if #theme > 0 then
        vim.cmd("colorscheme " .. theme[1])
    else
        vim.cmd("colorscheme catppuccin") -- Default theme if none is saved
    end
end

-- Call the function to load the colorscheme at startup
load_colorscheme()
