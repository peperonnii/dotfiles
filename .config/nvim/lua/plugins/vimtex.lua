return {
  {
    'lervag/vimtex',
    lazy = false,
    init = function()
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_compiler_latexmk = {
        build_dir = 'build',
        executable = 'latexmk',
        options = {
          '-lualatex', -- Use LuaLaTeX as the engine
        },
      }
      vim.g.vimtex_compiler_latexmk_engines = {
        _ = '-lualatex', -- Set default engine to LuaLaTeX
      }
    end,
  },
}
