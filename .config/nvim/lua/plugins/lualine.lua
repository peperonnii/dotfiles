return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = function(_, opts)
      -- Ensure sections table exists
      opts.sections = opts.sections or {}
      -- Ensure lualine_c exists before modifying it
      opts.sections.lualine_c = opts.sections.lualine_c or {}

      -- Load the trouble module safely
      local trouble_ok, trouble = pcall(require, 'trouble')
      if not trouble_ok then
        vim.notify('Trouble plugin is not installed', vim.log.levels.ERROR)
        return
      end

      -- Define symbols using trouble
      local symbols = trouble.statusline {
        mode = 'lsp_document_symbols',
        groups = {},
        title = false,
        filter = { range = true },
        format = '{kind_icon}{symbol.name:Normal}',
        hl_group = 'lualine_c_normal',
      }

      -- Insert the symbols into lualine_c
      table.insert(opts.sections.lualine_c, {
        symbols.get,
        cond = symbols.has,
      })
    end,
    config = function()
      local function count_buffers()
        local buffers = vim.fn.getbufinfo { buflisted = 1 } -- Get all listed buffers
        return ' ' .. #buffers
      end
      --
      -- local cross = ' '

      -- Function to get active LSP servers
      local function lsp()
        local clients = vim.lsp.get_active_clients { bufnr = 0 }
        if next(clients) == nil then
          return ''
        end
        local server_names = {}
        for _, client in ipairs(clients) do
          table.insert(server_names, client.name)
        end
        return '󰣖 ' .. table.concat(server_names, ', ')
      end

      local function size()
        local file = vim.fn.expand '%:p' -- Get the full path of the current file
        if file == '' or not vim.loop.fs_stat(file) then
          return '' -- Return an icon with "No File" if no file is loaded
        end
        local filesize = vim.loop.fs_stat(file).size
        if filesize < 1024 then
          return string.format('%dB', filesize) -- Bytes
        elseif filesize < 1024 * 1024 then
          return string.format('%.1fKB', filesize / 1024) -- Kilobytes
        else
          return string.format('%.1fMB', filesize / (1024 * 1024)) -- Megabytes
        end
      end

      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          always_show_tabline = true,
          globalstatus = true,
          refresh = {
            statusline = 100,
            tabline = 100,
            winbar = 100,
          },
        },

        sections = {
          lualine_a = {
            {
              'mode',
              icon = '',
              separator = { left = '', right = '' },
            },
          },
          lualine_b = {
            { 'filetype', icon_only = true, separator = '', padding = { right = 0, left = 1 } },
            {
              'filename',
              path = 0,
              separator = '',
              padding = { right = 1, left = 0 },
              symbols = {
                modified = '+', -- Text to show when the file is modified.
                readonly = 'x', -- Text to show when the file is non-modifiable or readonly.
                unnamed = '', -- Text to show for unnamed buffers.
                newfile = '󰎔', -- Text to show for newly created file before first write
              },
            },
            { count_buffers },
          },
          lualine_c = {
            {
              function()
                return '%='
              end,
            }, -- This centers the following component
            { 'diagnostics' },
            { 'diff' },
          },
          lualine_x = { 'searchcount' },
          lualine_y = { lsp, size },
          lualine_z = { '%p%%/%L', { '%l:%c', separator = { right = '' } } },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {},
      }
    end,
  },
}
