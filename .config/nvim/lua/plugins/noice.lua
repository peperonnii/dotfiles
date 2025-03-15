return {
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {},
    dependencies = {
      'MunifTanjim/nui.nvim',
      {
        'rcarriga/nvim-notify',
        config = function()
          require('notify').setup {
            background_colour = '#000000', -- Use the 'Normal' highlight group
            stages = 'slide', -- Sets the animation style to "slide"
            render = 'compact', -- Uses compact notification rendering
            timeout = 2000,
          }
        end,
      },
    },
  },
}
