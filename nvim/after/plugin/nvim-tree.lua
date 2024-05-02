require("nvim-tree").setup({
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        centralize_selection = false,
        cursorline = true,
        debounce_delay = 15,
        side = "left",
        preserve_window_proportions = true,
        number = false,
        relativenumber = false,
        signcolumn = "yes",
        width = 25,
        float = {
          enable = true,
          quit_on_focus_loss = true,
          open_win_config = {
            relative = "editor",
            border = "rounded",
            width = 30,
            row = 3,
            col = 0,
          },
        },

    },
    renderer = {
        group_empty = true,
        indent_markers = {
            enable = true,
            icons = {
                corner = "╰",
                edge = "│",
                item = "│",
                bottom = "─",
                none = " ",
            },

        },
    },
    filters = {
        dotfiles = false,
    },
})
