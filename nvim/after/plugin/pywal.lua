local pywal = require('pywal')
pywal.setup()


vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "TextChanged", "InsertLeave" }, {
    pattern = "*.md",
    callback = function()
        vim.cmd [[highlight ObsidianBullet gui=bold guifg=#FFFFFF]]
        vim.cmd [[highlight @markup.list.markdown gui=bold guifg=#FFFFFF]]
        vim.cmd [[highlight @markup.italic.markdown_inline guifg=#808080 gui=italic]]
        vim.cmd [[highlight @markup.strong.markdown_inline guifg=#ffffff gui=bold]]
        vim.cmd [[highlight @markup.heading.2.markdown guifg=#000000 guibg=#aaaaaa gui=bold]]
        vim.cmd [[highlight @markup.heading.2.marker.markdown guifg=#FFFFFF]]
        vim.cmd [[highlight @markup.heading.1.markdown guifg=#050505 guibg=#FFFFFF gui=bold]]
        vim.cmd [[highlight @markup.heading.1.marker.markdown guifg=#FFFFFF]]
    end
})
vim.cmd[[highlight VertSplit guibg=background guifg=foreground]]
vim.cmd[[highlight BufferLineFill guibg=#090909]]
vim.cmd[[ highlight @keyword.lua guifg=#98C379]]
vim.cmd[[ highlight @variable.lua guifg=#98C379]]
