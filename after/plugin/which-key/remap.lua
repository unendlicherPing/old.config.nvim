local wk = require('which-key')

-- Telescope
wk.register({
    f = {
        name = "find",
        f = { "<cmd>Telescope find_files find_command=rg,--hidden,--files<CR>", "Find File" },
    },
    b = {
        name = "browse",
        f = { "<cmd>Telescope file_browser<CR>", "File Browser" },
    },
    s = {
        name = "set / change",
        t = { "<cmd>Telescope colorscheme<CR>", "Load new Theme" },
    },
    o = {
        name = "open/new",
        l = { '<cmd>FloatermNew --height=0.9 --width=0.9 lg<CR>', "Open lazygit" },
        s = { '<cmd>FloatermNew --autoclose=2<CR>', "Open terminal" },
        t = { '<cmd>$tabnew<CR>', "New tab" },
    },
    c = {
        name = "close",
        t = { '<cmd>tabclose', "Close tab" },
    },
}, { prefix = "<leader>" })
