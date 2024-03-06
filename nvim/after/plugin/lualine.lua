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
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = {
            { 'mode', separator = { left = '', right = '' }, right_padding = 2 },
        },
        lualine_b = {'branch', 'diff'},
        lualine_c = {
            {
                -- Custom component to display full path
                function()
                    return vim.fn.expand("%:p")
                end,
                icon = '', -- Optional: add an icon to the component
            }
        },
        lualine_x = {'filetype'},
        lualine_y = {'diagnostics', 'progress'},
        lualine_z = {
            {'location', separator = { left = '', right = ''}, left_padding = 2}
        }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = { 
            {'location', separator = { left = '', right = ''}, left_padding = 2}
        },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}

