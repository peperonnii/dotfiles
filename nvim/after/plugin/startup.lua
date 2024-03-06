local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header
local function footer()
    local total_plugins = #vim.tbl_keys(require("lazy").plugins())
    local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
    local version = vim.version()
    local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch
    return datetime .. "   " .. total_plugins .. " plugins" .. nvim_version_info
end
dashboard.section.footer.val = footer()
-- vim.api.nvim_exec([[
--   highlight CustomFooterColor guifg=#ffffff
-- ]], false)
-- dashboard.section.footer.opts.hl = "CustomFooterColor"
dashboard.section.header.val = {
    [[=================     ===============     ===============   ========  ========]],
    [[\\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //]],
    [[||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||]],
    [[|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||]],
    [[||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||]],
    [[|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||]],
    [[||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||]],
    [[|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||]],
    [[||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||]],
    [[||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||]],
    [[||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||]],
    [[||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||]],
    [[||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||]],
    [[||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||]],
    [[||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||]],
    [[||.=='    _-'                                                     `' |  /==.||]],
    [[=='    _-'                        N E O V I M                         \/   `==]],
    [[\   _-'                                                                `-_   /]],
    [[ `''                                                                      ``' ]],
}
-- vim.api.nvim_exec([[
--   highlight CustomHeaderColor guifg=#98C379
-- ]], false)
-- dashboard.section.header.opts.hl = "CustomHeaderColor"
-- Set menu
dashboard.section.buttons.val = {
    dashboard.button("<Leader> oh", "  >>> HYPRLAND CONFIG", ":cd ~/.config/hypr <CR>:e .<CR>"),
    dashboard.button( "<Leader> on", "  >>> NEOVIM CONFIG" , ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
    dashboard.button("<Leader> oo", "󰑴  >>> OBSIDIAN", ":cd ~/Documents/SKYNET <CR>:e .<CR>"),
    dashboard.button( "<Leader> ol", "󰅩  >>> LEETCODE"   , ":Leet<CR>"),
    dashboard.button( "<Leader> or", "  >>> RECENT FILES"   , ":Telescope oldfiles<CR>"),
}

-- Set footer
--   NOTE: This is currently a feature in my fork of alpha-nvim (opened PR #21, will update snippet if added to main)
--   To see test this yourself, add the function as a dependecy in packer and uncomment the footer lines
--   ```init.lua
--   return require('packer').startup(function()
--       use 'wbthomason/packer.nvim'
--       use {
--           'goolord/alpha-nvim', branch = 'feature/startify-fortune',
--           requires = {'BlakeJC94/alpha-nvim-fortune'},
--           config = function() require("config.alpha") end
--       }
--   end)
--   ```
-- local fortune = require("alpha.fortune") 

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
