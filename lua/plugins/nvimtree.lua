-----------------------------------------------------------------------
-- NvimTree
--
-- File explorer configuration.
-----------------------------------------------------------------------

local tree = require("nvim-tree")
local api = require("nvim-tree.api")

-----------------------------------------------------------------------
-- Buffer-local Keymaps
-----------------------------------------------------------------------

-- These mappings are available only when the NvimTree window is focused.
local function on_attach(bufnr)
    -- Load NvimTree's default keymaps first.
    api.config.mappings.default_on_attach(bufnr)

    local function bufmap(lhs, rhs, desc)
        vim.keymap.set("n", lhs, rhs, {
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true,
            desc = "NvimTree: " .. desc,
        })
    end

    -------------------------------------------------------------------
    -- Open Files
    -------------------------------------------------------------------

    bufmap("v", api.node.open.vertical, "Open in vertical split")
    bufmap("s", api.node.open.horizontal, "Open in horizontal split")

    -- Uncomment if you prefer Vim-style navigation.
    --
    -- bufmap("l", api.node.open.edit, "Open")
    -- bufmap("h", api.node.navigate.parent_close, "Close directory")
end

-----------------------------------------------------------------------
-- Setup
-----------------------------------------------------------------------

tree.setup({
    on_attach = on_attach,

    -------------------------------------------------------------------
    -- File Opening
    -------------------------------------------------------------------

    actions = {
        open_file = {
            -- Automatically close the explorer after opening a file.
            quit_on_open = true,
        },
    },

    -------------------------------------------------------------------
    -- Git
    -------------------------------------------------------------------

    git = {
        enable = true,
        ignore = false,
    },

    -------------------------------------------------------------------
    -- Diagnostics
    -------------------------------------------------------------------

    diagnostics = {
        enable = true,
    },

    -------------------------------------------------------------------
    -- Renderer
    -------------------------------------------------------------------

    renderer = {
        highlight_git = true,
        highlight_opened_files = "name",
    },
})
