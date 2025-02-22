return {
  { -- alpha.nvim
    'goolord/alpha-nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'nvim-lua/plenary.nvim',
    },
    config = function()
      local alpha = require 'alpha'
      local dashboard = require 'alpha.themes.dashboard'

      -- Set header
      local function footer()
        local total_plugins = #vim.tbl_keys(require('lazy').plugins())
        local version = vim.version()
        local nvim_version_info = '   v' .. version.major .. '.' .. version.minor .. '.' .. version.patch
        return '   ' .. total_plugins .. ' plugins' .. nvim_version_info
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
        -- dashboard.button('<Leader> oh', '  >>> HYPRLAND CONFIG', ':cd ~/.config/hypr <CR>:e .<CR>'),
        -- dashboard.button('<Leader> on', '  >>> NEOVIM CONFIG', ':e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>'),
        -- dashboard.button('<Leader> ol', '󰅩  >>> LEETCODE', ':Leet<CR>'),
        -- dashboard.button('<Leader> or', '  >>> RECENT FILES', ':Telescope oldfiles<CR>'),
      }

      -- Send config to alpha
      alpha.setup(dashboard.opts)

      -- Disable folding on alpha buffer
      vim.cmd [[
          autocmd FileType alpha setlocal nofoldenable
      ]]
    end,
  },
}
