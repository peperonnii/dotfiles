return {
  {
    'wnkz/monoglow.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require('monoglow').setup {
        --   on_colors = function(colors)
        --     colors.glow = '#97CE92'
        --   end,
        on_highlights = function(highlights, colors)
          highlights.Comment = { fg = '#272727', italic = true }
        end,
      }
    end,
    init = function()
      vim.cmd.colorscheme 'monoglow'
      vim.api.nvim_set_hl(0, '@keyword', { fg = '#97CE92' })
      vim.api.nvim_set_hl(0, '@keyword.return', { fg = '#97CE92' })
      -- gray
      vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { bg = 'NONE', strikethrough = true, fg = '#808080' })
      -- blue
      vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { bg = 'NONE', fg = '#97CE92' })
      vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link = 'CmpIntemAbbrMatch' })
      -- light blue
      vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { bg = 'NONE', fg = '#88D0C4' })
      vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { link = 'CmpItemKindVariable' })
      vim.api.nvim_set_hl(0, 'CmpItemKindText', { link = 'CmpItemKindVariable' })
      -- pink
      vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { bg = 'NONE', fg = '#CBA6F7' })
      vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { link = 'CmpItemKindFunction' })
      -- front
      vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { bg = 'NONE', fg = '#88B0F9' })
      vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { link = 'CmpItemKindKeyword' })
      vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { link = 'CmpItemKindKeyword' })
    end,
  },
}
