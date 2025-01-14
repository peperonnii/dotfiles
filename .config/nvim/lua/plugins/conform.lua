return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        local disable_filetypes = { c = true, cpp = true }
        local lsp_format_opt
        if disable_filetypes[vim.bo[bufnr].filetype] then
          lsp_format_opt = 'never'
        else
          lsp_format_opt = 'fallback'
        end
        return {
          timeout_ms = 500,
          lsp_format = lsp_format_opt,
        }
      end,
      formatters_by_ft = {
        cpp = {
          'clang_format',
          stop_after_first = true,
        },
        lua = {
          'stylua',
          stop_after_first = true,
        },
        python = {
          'isort',
          'black',
          stop_after_first = true,
        },
        javascript = {
          'prettierd',
          'prettier',
          stop_after_first = true,
        },
      },
      formatters = {
        clang_format = {
          cmd = 'clang-format',
          args = {
            '--style={BasedOnStyle: Google, IndentWidth: 2, TabWidth: 2, UseTab: Never}',
          },
          stdin = true,
        },
      },
    },
  },
}
