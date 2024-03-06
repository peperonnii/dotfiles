require("nvim-tree").setup({
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 25,
    },
    renderer = {
        group_empty = true,
        indent_markers = {
            enable = true,
        },
    },
    filters = {
        dotfiles = false,
    },
})
