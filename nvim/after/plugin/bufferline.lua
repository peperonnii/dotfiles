require('bufferline').setup {
    options = {
        separator_style = "none",
        -- Add any other options you need here
        hover = {
            enabled = true,
            delay = 200,
            reveal = {'close'}
        },
        offsets = {{
            filetype = "NvimTree",
            text = "",
            padding = 1,
            text_align = "right",
        }},
    },
    highlights = {
        fill = {
        },
        background = {
            fg = '#ffffff',
            bg = '#050505'
        },
        buffer_selected = {
            fg = '#ffffff',
            bold = true,
        },
    }
  -- Additional styling for other states...
}

-- -- Set the background color of the buffer line
--
