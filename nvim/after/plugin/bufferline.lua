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
}
-- Set the background color of the buffer line

