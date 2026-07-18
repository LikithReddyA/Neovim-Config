-----------------------------------------------------------------------
-- Blink
--
-- High-performance completion engine providing:
--   • LSP completion
--   • Snippet expansion
--   • Completion documentation
--   • Ghost text
-----------------------------------------------------------------------

local blink = require("blink.cmp")

-- Build native components if required.
blink.build():pwait()

blink.setup({
    -------------------------------------------------------------------
    -- Completion Keymaps
    -------------------------------------------------------------------
    keymap = {
        -- Disable Blink's default mappings and define our own.
        preset = "none",

        -- Navigate completion items.
        ["<C-n>"] = { "select_next", "fallback" },
        ["<C-p>"] = { "select_prev", "fallback" },

        -- Accept selected completion.
        ["<CR>"] = { "accept", "fallback" },

        -- Navigate LuaSnip placeholders.
        ["<Tab>"] = { "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },

        -- Completion menu controls.
        ["<C-Space>"] = { "show" },
        ["<C-e>"] = { "hide" },
    },

    -------------------------------------------------------------------
    -- Completion Behaviour
    -------------------------------------------------------------------
    completion = {
        list = {
            selection = {
                -- Preselect the first completion item.
                preselect = false,

                -- Only insert text after explicit confirmation.
                auto_insert = false,
            },
        },

        trigger = {
            -- Trigger completion while typing.
            show_on_insert = true,
            show_on_keyword = true,
        },

        documentation = {
            -- Automatically show documentation popup.
            auto_show = true,
            auto_show_delay_ms = 200,
        },

        -- Show inline suggestion preview.
        ghost_text = {
            enabled = false,
        },
    },

    -------------------------------------------------------------------
    -- Snippet Engine
    -------------------------------------------------------------------
    snippets = {
        preset = "luasnip",
    },
})
