require('lazy').setup({

  -- NOTE: THEMES
  require 'plugins.themes.monoglow',
  -- require 'plugins.themes.catpuccin',
  -- require 'plugins.themes.oxocarbon',

  -- NOTE: TOOLS
  require 'plugins.vim-sleuth',
  require 'plugins.nvim-surround',
  require 'plugins.auto-session',
  require 'plugins.colorizer',
  require 'plugins.toggle-bool',
  require 'plugins.which-key',
  require 'plugins.mini',
  require 'plugins.todo-comments',
  require 'plugins.autopairs',
  require 'plugins.indent_line',
  -- require 'plugins.snippets-latex',

  -- NOTE: UI/UX
  require 'plugins.visual-whitespace',
  require 'plugins.trouble',
  require 'plugins.lualine',
  require 'plugins.alpha',
  require 'plugins.noice',
  require 'plugins.telescope',
  require 'plugins.gitsigns',
  require 'plugins.floatterm',
  require 'plugins.leetcode',
  -- require 'plugins.neoscroll',

  -- NOTE: IDE
  require 'plugins.cmp',
  require 'plugins.lspconfig',
  require 'plugins.treesitter',
  require 'plugins.debug',
  require 'plugins.conform',
  require 'plugins.lint',
  require 'plugins.flutter',
  require 'plugins.vimtex',
}, {
  ui = {
    border = 'rounded',
  },
  icons = vim.g.have_nerd_font and {} or {},
})
