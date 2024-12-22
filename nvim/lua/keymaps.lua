local map = vim.keymap.set
local opts = { noremap = true, silent = true }

--clipboard
map('n', '<Leader>y', '"+y', opts)
map('n', '<Leader>p', '"+p', opts) -- Paste from clipboard in Insert Mode with Ctrl+v

map('n', 'J', '5j', opts)
map('n', 'K', '5k', opts)

map('n', '<A-i>', ':Lazy<CR>', opts)
map('n', '<A-I>', ':Mason<CR>', opts)

map('i', '<C-CR>', '<C-o>A', opts)

map('n', '<A-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<A-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<A-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<A-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
--buffer navigation
map('n', '<C-s>', ':w<CR>', opts) -- Save the current buffer with Ctrl+s in Normal Mode
map('n', '<A-w>', ':bd<CR>', opts) -- Close the current buffer with Ctrl+w in Normal Mode
map('n', '<C-a>', 'ggVG', opts)
map('n', '<A-p>', ':bprev<CR>', opts) -- Ctrl+j for down
map('n', '<A-n>', ':bnext<CR>', opts) -- Ctrl+k for up

map('n', '<Leader>5', ':vsp<CR>', opts)
map('n', "<Leader>'", ':sp<CR>', opts)

map('v', 'J', ":m '>+1<CR>gv=gv", opts)
map('v', 'K', ":m '>-2<CR>gv=gv", opts)

map('n', '<Leader>nd', '<cmd>NoiceDismiss<CR>', opts)

map('n', '<leader>Enter', ':Lazy<CR>', opts)
map('i', '<C-BS>', '<C-w>', opts)

map('n', '<leader>v', 'viw', opts)

map('n', ';', ':', { desc = 'CMD enter command mode' })
-- map('i', 'jk', '<ESC>')
map('i', '<C-c>', '<ESC>', opts)

map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
