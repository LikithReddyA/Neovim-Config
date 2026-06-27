-----------------------------------------------------------------------
-- LuaSnip
--
-- Snippet engine used by Blink for snippet expansion and navigation.
-- Loads snippets from both VS Code collections and custom Lua snippets.
-----------------------------------------------------------------------

local luasnip = require("luasnip")

-----------------------------------------------------------------------
-- LuaSnip Configuration
-----------------------------------------------------------------------

luasnip.config.set_config({
    -- Allow jumping back into previous snippets.
    history = true,

    -- Update active snippets while editing.
    updateevents = "TextChanged,TextChangedI",

    -- Enable snippets that expand automatically.
    enable_autosnippets = true,
})

-----------------------------------------------------------------------
-- VS Code Snippets
-----------------------------------------------------------------------

require("luasnip.loaders.from_vscode").lazy_load()

-----------------------------------------------------------------------
-- Custom Lua Snippets
-----------------------------------------------------------------------

require("luasnip.loaders.from_lua").lazy_load({
    paths = {
        vim.fn.stdpath("config") .. "/lua/snippets",
    },
})
