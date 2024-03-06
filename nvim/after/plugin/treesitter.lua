require('nvim-treesitter.configs').setup ({
    ensure_installed = {"markdown", "markdown_inline", "javascript", "typescript", "c", "lua", "vim", "vimdoc", "query" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    modules = {}, -- Typically not needed unless using advanced configuration
    ignore_install = {},
})
