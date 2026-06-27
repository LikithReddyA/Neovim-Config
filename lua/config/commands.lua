-----------------------------------------------------------------------
-- User Commands
--
-- Defines custom commands that extend Neovim with convenient wrappers
-- around the built-in package manager.
-----------------------------------------------------------------------

local api = vim.api

-----------------------------------------------------------------------
-- :PackAdd
--
-- Install one or more plugins.
--
-- Example:
--   :PackAdd nvim-mini/mini.nvim
--   :PackAdd nvim-mini/mini.nvim nvim-lua/plenary.nvim
-----------------------------------------------------------------------

api.nvim_create_user_command("PackAdd", function(opts)
    vim.pack.add(opts.fargs)
end, {
    nargs = "+",
    desc = "Install one or more plugins",
})

-----------------------------------------------------------------------
-- :PackDel
--
-- Remove one or more installed plugins.
--
-- Example:
--   :PackDel nvim-mini/mini.nvim
-----------------------------------------------------------------------

api.nvim_create_user_command("PackDel", function(opts)
    vim.pack.del(opts.fargs)
end, {
    nargs = "+",
    desc = "Remove one or more plugins",
})

-----------------------------------------------------------------------
-- :PackUpdate
--
-- Update plugins.
--
-- Without arguments:
--   :PackUpdate
--     Updates all installed plugins.
--
-- With arguments:
--   :PackUpdate nvim-mini/mini.nvim
--   :PackUpdate plugin1 plugin2
--     Updates only the specified plugins.
-----------------------------------------------------------------------

api.nvim_create_user_command("PackUpdate", function(opts)
    if opts.args == "" then
        vim.pack.update()
        return
    end

    local plugins = vim.split(opts.args, "%s+", {
        trimempty = true,
    })

    vim.pack.update(plugins)
end, {
    nargs = "*",
    desc = "Update all plugins or selected plugins",
})

-----------------------------------------------------------------------
-- :PackList
-----------------------------------------------------------------------
vim.api.nvim_create_user_command("PackList", function()
    local plugins = vim.pack.get(nil, { info = false })

    table.sort(plugins, function(a, b)
        return a.spec.name < b.spec.name
    end)

    for _, plugin in ipairs(plugins) do
        local icon = plugin.active and "󰄬" or "󰄱"
        print(string.format("%s %s", icon, plugin.spec.name))
    end
end, {
    desc = "List installed plugins",
})
