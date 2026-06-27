-----------------------------------------------------------------------
-- Mini.nvim
--
-- Collection of lightweight plugins providing:
--   • File explorer
--   • Notifications
--   • Command-line completion
--   • Auto pairs
-----------------------------------------------------------------------

-----------------------------------------------------------------------
-- Mini Files
-----------------------------------------------------------------------

local MiniFiles = require("mini.files")

MiniFiles.setup({
    -- Customization of shown content
    content = {
        filter = nil,
        highlight = nil,
        prefix = nil,
        sort = nil,
    },

    -- Module mappings created only inside the explorer
    mappings = {
        close = "q",
        go_in = "l",
        go_in_plus = "L",
        go_out = "h",
        go_out_plus = "H",
        mark_goto = "'",
        mark_set = "m",
        reset = "<BS>",
        reveal_cwd = "@",
        show_help = "g?",
        synchronize = "=",
        trim_left = "<",
        trim_right = ">",
    },

    options = {
        permanent_delete = true,
        use_as_default_explorer = true,
        lsp_timeout = 1000,
    },

    windows = {
        max_number = math.huge,
        preview = false,
        width_focus = 50,
        width_nofocus = 15,
        width_preview = 25,
    },
})

-----------------------------------------------------------------------
-- Mini Notify
-----------------------------------------------------------------------

require("mini.notify").setup({
    content = {
        format = function(notif)
            return notif.msg
        end,
    },

    window = {
        config = function()
            return {
                title = "",
                anchor = "SE",
                row = vim.o.lines - 2,
                col = vim.o.columns,
                border = "none",
            }
        end,
    },
})

-----------------------------------------------------------------------
-- Mini Cmdline
-----------------------------------------------------------------------

require("mini.cmdline").setup({
    autocorrect = {
        enable = false,
    },
})

-----------------------------------------------------------------------
-- Mini Pairs
-----------------------------------------------------------------------

require("mini.pairs").setup()
