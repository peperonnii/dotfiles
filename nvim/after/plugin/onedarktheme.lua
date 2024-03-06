-- require('onedark').setup  {
--     -- main options --
--     style = 'warmer', -- default theme style. choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
--     transparent = true,  -- show/hide background
--     term_colors = true, -- change terminal color as per the selected theme style
--     ending_tildes = false, -- show the end-of-buffer tildes. by default they are hidden
--     cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
--     -- toggle theme style ---
--     toggle_style_key = nil, -- keybind to toggle theme style. leave it nil to disable it, or set it to a string, for example "<leader>ts"
--     toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- list of styles to toggle between
--     code_style = {
--         comments = 'italic',
--         keywords = 'none',
--         functions = 'none',
--         strings = 'none',
--         variables = 'none'
--     },
--     -- lualine options --
--     lualine = {
--         transparent = false, -- lualine center bar transparency
--     },
--     bufferline = {
--         transparent = false
--     },
--     -- custom highlights --
--     colors = {}, -- override default colors
--     highlights = {}, -- override highlight groups
--     -- plugins config --
--     diagnostics = {
--         darker = true, -- darker colors for diagnostic
--         undercurl = true,   -- use undercurl instead of underline for diagnostics
--         background = true,    -- use background color for virtual text
--     },
-- }
-- require('onedark').load()


vim.cmd(string.format("highlight bufferlinebackground guifg=%s guibg=%s", "#c7c7c7", "#000000"))
vim.cmd(string.format("highlight bufferlinebuffervisible guifg=%s guibg=%s","#61afef" , "#000000"))
vim.cmd(string.format("highlight bufferlinebufferselected guifg=%s guibg=%s gui=bold", "#61afef" , "#000000"))
vim.cmd[[highlight nvimtreenormal guibg=#050505]]
vim.cmd[[highlight bufferlinefill guibg=#101010]]

-- change the color of the buffer tab separators
vim.cmd[[highlight bufferlineseparator guifg=#101010]]
vim.cmd[[highlight bufferlineseparatorvisible guifg=#101010]]
vim.cmd[[highlight bufferlineseparatorinactive guifg=#101010]]


-- you might also want to adjust group indicators or equivalent if they exist
vim.cmd[[highlight bufferlinegroupindicator guifg=#]]
vim.cmd[[highlight nvimtreenormalfloat guibg=#050505 guifg=#101010]]
vim.cmd[[highlight nvimtreefoldername guifg=#ffffff]]

vim.cmd [[
  highlight TroubleNormal guibg=#050505
]]

-- vim.cmd[[highlight NvimTreeFolderIcon guifg=#ffffff]]
-- vim.cmd[[highlight NvimTreeFolderName guifg=#ffffff]]
-- vim.cmd[[highlight NvimTreeOpenedFolderName guifg=#ffffff gui=bold]]
-- vim.cmd[[highlight NvimTreeEmptyFolderName guifg=#505050]]
-- vim.cmd[[highlight NvimTreeRootFolder guifg=#98C379 gui=bold]]

-- vim.cmd[[highlight TelescopeBorder guifg=#ffffff]]
-- vim.cmd[[highlight TelescopePromptBorder guifg=#ffffff]]
-- vim.cmd[[highlight TelescopeResultsBorder guifg=#98C379]]
-- vim.cmd[[highlight TelescopePreviewBorder guifg=#c678dd]]

-- vim.cmd [[highlight @spell.markdown guifg=#404040 ]]
vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "TextChanged", "InsertLeave" }, {
    pattern = "*.md",
    callback = function()
        vim.cmd [[highlight ObsidianBullet gui=bold guifg=#FFFFFF]]
        vim.cmd [[highlight @markup.list.markdown gui=bold guifg=#FFFFFF]]
        vim.cmd [[highlight @markup.italic.markdown_inline guifg=#808080 gui=italic]]
        vim.cmd [[highlight @markup.strong.markdown_inline guifg=#ffffff gui=bold]]
        vim.cmd [[highlight @markup.heading.2.markdown guifg=#000000 guibg=#aaaaaa gui=bold]]
        vim.cmd [[highlight @markup.heading.2.marker.markdown guifg=#FFFFFF]]
        vim.cmd [[highlight @markup.heading.1.markdown guifg=#050505 guibg=#FFFFFF gui=bold]]
        vim.cmd [[highlight @markup.heading.1.marker.markdown guifg=#FFFFFF]]
    end
})


-- vim.cmd[[ highlight cmpitemabbr guifg=#505050]]
-- vim.cmd[[ highlight cmpitemabbrdefault guifg=#ff0000]]
-- vim.cmd[[ highlight cmpitemabbrdeprecated gui=strikethrough guifg=#00f0f0]]
-- vim.cmd[[ highlight cmpitemabbrdeprecateddefault guifg=#5a5b5e]]
-- vim.cmd[[ highlight cmpitemabbrmatch guifg=#98C379]]
-- vim.cmd[[ highlight cmpitemabbrmatchdefault guifg=#ff0000]]
-- vim.cmd[[ highlight cmpitemabbrmatchfuzzy gui=underline guifg=#98C379]]
-- vim.cmd[[ highlight cmpitemabbrmatchfuzzydefault guifg=#ff0000]]
-- vim.cmd[[ highlight CmpItemMenu guifg=#050505]]
-- vim.cmd[[ highlight CmpItemKind guifg=#bb70d2]]
-- vim.cmd[[ highlight CmpItemKindDefault guifg=#de5d68]]
-- vim.cmd[[ highlight FloatBorder guifg=#98C379 guibg=#000000]]


vim.cmd[[ highlight @keyword.lua guifg=#98C379]]
vim.cmd[[ highlight @variable.lua guifg=#98C379]]
