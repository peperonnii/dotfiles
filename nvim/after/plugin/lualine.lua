local function spotify_current_song()
    local handle = io.popen("playerctl -p spotify metadata --format '{{ title }} - {{ artist }}'")
    local result = handle:read("*a")
    handle:close()
    result = result:gsub("^%s*(.-)%s*$", "%1")  -- Trim whitespace from the result
    return ' ' .. result  -- Prepend the Spotify icon
end

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'pywal-nvim',
        component_separators = { left = ')', right = '('},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = {
            { 'mode', separator = { left = '', right = '' }},
        },
        lualine_b = {'branch', 'diff'},
        lualine_c = {
            {
                -- Custom component to display full path
                function()
                    local path = vim.fn.expand("%:p")  -- Get the full path of the current file
                    local home = os.getenv("HOME")     -- Get the user's home directory path
                    if path:sub(1, #home) == home then -- Check if the path starts with the home directory
                        path = '~' .. path:sub(#home + 1) -- Replace the home directory with '~'
                    end
                    return path
                end,
                icon = ' ', -- Optional: add an icon to the component
                -- function()
                --     return vim.fn.expand("%:p")
                -- end,
                -- icon = '', -- Optional: add an icon to the component
            }
        },
        lualine_x = {spotify_current_song, 'filetype'},
        lualine_y = {'diagnostics'},
        lualine_z = {
            {'progress'},
            {
                'location',
                separator = { left = '', right = ''}, padding = 0,
            }
        }
    },
    inactive_sections = {
        lualine_a = {'filename'},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}

