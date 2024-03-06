vim.opt.fillchars = { eob = " " }

vim.opt.nu = true
vim.opt.relativenumber = true
vim.o.number = true
vim.opt.scrolloff = 8

vim.opt.tabstop = 4
vim.opt.softtabstop = 4 
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.wrap = false
vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function() 
        vim.opt_local.conceallevel = 2
        vim.opt_local.textwidth = 80
        vim.opt_local.wrap = true
        vim.opt_local.breakindent = false
        vim.opt_local.linebreak = true
        vim.b.cmp_enabled = false
        vim.opt.tabstop = 2
        vim.opt.shiftwidth = 2
        vim.opt.softtabstop = 2
    end,
})




