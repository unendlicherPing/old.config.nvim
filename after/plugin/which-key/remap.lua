local wk = require('which-key')
local map = vim.api.nvim_set_keymap

-- Telescope
wk.register({
    s = {
        name = "sessions",
        l = { "<cmd>SessionLoad<CR>", "Load Session" },
    },
    f = {
        name = "find",
        r = { "<cmd>Telescope oldfiles<CR>", "Open Recently Used File" },
        f = { "<cmd>Telescope find_files find_command=rg,--hidden,--files<CR>", "Find File" },
        w = { "<cmd>Telescope live_grep<CR>", "Find Word" },
        b = { "<cmd>Telescope buffers<CR>", "Find Buffers" },
    },
    b = {
        name = "browse",
        f = { "<cmd>Telescope file_browser<CR>", "File Browser" },
    },
    h = {
        name = "theme",
        t = { "<cmd>Telescope colorscheme<CR>", "Load new Theme" },
    },
}, { prefix = "<leader>" })
