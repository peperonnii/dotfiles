return {
  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'nvim-telescope/telescope-file-browser.nvim' },
      { 'debugloop/telescope-undo.nvim' },
    },
    config = function()
      local fb_actions = require 'telescope._extensions.file_browser.actions'
      --
      require('telescope').setup {
        theme = 'dropdown',
        defaults = {
          mappings = {
            ['n'] = {
              ['d'] = require('telescope.actions').delete_buffer,
            },
          },
        },
        pickers = {
          find_files = {
            theme = 'dropdown',
          },
          diagnostics = {
            theme = 'cursor',
          },
          buffers = {
            theme = 'dropdown',
            previewer = false,
          },
          undo = {
            theme = 'dropdown',
          },
        },
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
          file_browser = {
            hijack_netrw = true,
            hidden = { file_browser = true, folder_browser = true },
            collapse_dirs = true,
            grouped = true,
            theme = 'dropdown',
            mappings = {
              ['i'] = {},
              ['n'] = {
                ['a'] = fb_actions.create,
                ['r'] = fb_actions.rename,
                ['m'] = fb_actions.move,
                ['y'] = fb_actions.copy,
                ['d'] = fb_actions.remove,
                ['o'] = fb_actions.open,
                ['g'] = fb_actions.goto_parent_dir,
                ['e'] = fb_actions.goto_home_dir,
                ['w'] = fb_actions.goto_cwd,
                ['t'] = fb_actions.change_cwd,
                ['f'] = fb_actions.toggle_browser,
                ['h'] = fb_actions.toggle_hidden,
                ['s'] = fb_actions.toggle_all,
              },
            },
          },
        },
      }
      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')
      pcall(require('telescope').load_extension, 'file_browser')
      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>st', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<leader>e', ':Telescope file_browser path=%:p:h select_buffer=true<CR>')
      vim.keymap.set('n', '<leader>su', ':Telescope undo<CR>')
      vim.keymap.set('n', '<leader>sn', require('telescope').extensions.notify.notify, { desc = 'Show notifications' })

      vim.keymap.set('n', '<leader>?', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
