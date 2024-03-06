vim.g.mapleader = " "
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }


--clipboard
map('v', '<C-c>', '"+y', opts)
map('i', '<C-v>', '<C-r>+', opts)-- Paste from clipboard in Insert Mode with Ctrl+v

--nvim tree
map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)

--buffer navigation
map('n', '<C-s>', ':w<CR>', opts)-- Save the current buffer with Ctrl+s in Normal Mode
map('n', '<Leader>q', ':bd<CR>', opts)-- Close the current buffer with Ctrl+w in Normal Mode
map('n', '<Leader>a', 'ggVG', opts)-- Close the current buffer with Ctrl+w in Normal Mode
map('n', '<C-h>', ':bp<CR>:echom "Switched to previous buffer"<CR>', opts)
map('n', '<C-l>', ':bn<CR>:echom "Switched to next buffer"<CR>', opts)
map('n', '<C-j>', ':bprev<CR>', opts) -- Ctrl+j for down
map('n', '<C-k>', ':bnext<CR>', opts) -- Ctrl+k for up
map('n', '<Leader>h', '^', opts) -- jump to start of line
map('n', '<Leader>l', '$', opts) -- jump to end of line
map('n', '<Leader>j', 'G', opts) -- jump to bottom of file
map('n', '<Leader>k', 'gg', opts)-- jump to top of file
map('n', '<Leader>5', ':vsp<CR>', opts)
map('n', '<Leader>\'', ':sp<CR>', opts)
map('i', '<C-h>', '<C-Left>', opts)
map('i', '<C-l>', '<C-Right>', opts)

function ToggleLineNumbers()
    if vim.wo.relativenumber then
        vim.wo.relativenumber = false
    else
        vim.wo.relativenumber = true
    end
end

--find and replace 
map('n', '<Leader>frg', ':%s/', opts)
function PromptSearchAndReplace()
    ToggleLineNumbers()
    local start = vim.fn.input("START: ")
    local finish = vim.fn.input("END: ")
    local command = start .. ',' .. finish .. 's/'
    vim.cmd(command)
    ToggleLineNumbers()
end
map('n', '<leader>frl', '<cmd>lua PromptSearchAndReplace()<CR>', opts)

map('n', '<leader>nn', '<cmd>lua ToggleLineNumbers()<CR>', opts)
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '>-2<CR>gv=gv", opts)

map("n", "<Leader>nd", "<cmd>NoiceDismiss<CR>", opts)

map('n', '<leader>p', ':Lazy<CR>', opts)
map('i', '<C-BS>', '<C-w>', opts)

function Bold()
    local original_cursor = vim.api.nvim_win_get_cursor(0)
    local _, start_row, start_col, _ = unpack(vim.fn.getpos("'<"))
    local _, end_row, end_col, _ = unpack(vim.fn.getpos("'>"))
    if end_col ~= 0 then
        end_col = end_col - 1
    end
    local lines = vim.api.nvim_buf_get_text(0, start_row - 1, start_col, end_row - 1, end_col + 1, {})
    local text = table.concat(lines)
    local new_text = "**" .. text .. "**"
    vim.api.nvim_buf_set_text(0, start_row - 1, start_col, end_row - 1, end_col + 1, {new_text})
    vim.api.nvim_win_set_cursor(0, original_cursor)
end
map('v', '<leader>b', ':lua Bold()<CR>', opts)
function Italic()
    local original_cursor = vim.api.nvim_win_get_cursor(0)
    local _, start_row, start_col, _ = unpack(vim.fn.getpos("'<"))
    local _, end_row, end_col, _ = unpack(vim.fn.getpos("'>"))
    if end_col ~= 0 then
        end_col = end_col - 1
    end
    local lines = vim.api.nvim_buf_get_text(0, start_row - 1, start_col, end_row - 1, end_col + 1, {})
    local text = table.concat(lines)
    local new_text = "*" .. text .. "*"
    vim.api.nvim_buf_set_text(0, start_row - 1, start_col, end_row - 1, end_col + 1, {new_text})
    vim.api.nvim_win_set_cursor(0, original_cursor)
end
map('v', '<leader>i', ':lua Italic()<CR>', opts)
map('n', '<leader>v', 'viw', opts)

