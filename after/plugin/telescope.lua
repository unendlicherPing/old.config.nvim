require("telescope").setup {

    theme = "ivy",
    -- disables netrw and use telescope-file-browser in its place
    hijack_netrw = true,
    mappings = {
        ["i"] = {
        -- your custom insert mode mappings
        },
        ["n"] = {
        -- your custom normal mode mappings
        },
    },
    extensions = { }
}
require("telescope").load_extension "file_browser"
