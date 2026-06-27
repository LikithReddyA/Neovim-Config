-----------------------------------------------------------------------
-- FZF-Lua
--
-- Fast fuzzy finder for files, grep, buffers, LSP, Git and more.
-----------------------------------------------------------------------

local fzf = require("fzf-lua")

fzf.setup({
    winopts = {
        height = 0.80,
        width = 0.80,
        border = "rounded",
        preview = {
            layout = "vertical",
            vertical = "right:55%",
        },

        -- Prompt at the bottom (Telescope style)
        -- vertical = {
        --     layout = "vertical",
        --     prompt_position = "bottom",
        -- },
    },

    fzf_opts = {
        ["--layout"] = "reverse-list",
        ["--info"] = "inline-right",
    },

    keymap = {
        builtin = {
            ["<C-u>"] = "preview-page-up",
            ["<C-d>"] = "preview-page-down",
        },

        fzf = {
            ["ctrl-u"] = "preview-page-up",
            ["ctrl-d"] = "preview-page-down",
        },
    },

    files = {
        cwd_prompt = false,
        prompt = "Files ❯ ",
    },

    grep = {
        prompt = "Grep ❯ ",
    },

    buffers = {
        prompt = "Buffers ❯ ",
    },

    hls = {
        prompt = "Highlights ❯ ",
    },
})
