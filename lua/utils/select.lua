-----------------------------------------------------------------------
-- Selection Utilities
--
-- Reusable selection helpers built on top of Neovim's `vim.ui.select()`.
-----------------------------------------------------------------------

local M = {}

-----------------------------------------------------------------------
-- Numbered Selection
--
-- Presents a numbered menu using `vim.fn.inputlist()` while preserving
-- the `vim.ui.select()` API.
--
-- This is useful when a simple numbered prompt is preferred over a
-- floating picker.
-----------------------------------------------------------------------

function M.numbered(items, opts, on_choice)
    opts = opts or {}

    local menu = {}

    for index, item in ipairs(items) do
        local text = opts.format_item
            and opts.format_item(item)
            or tostring(item)

        table.insert(menu, string.format("%d. %s", index, text))
    end

    local choice = vim.fn.inputlist(
        vim.list_extend(
            { opts.prompt or "Select an option" },
            menu
        )
    )

    if choice >= 1 and choice <= #items then
        on_choice(items[choice], choice)
    else
        on_choice(nil, nil)
    end
end

-----------------------------------------------------------------------
-- Numbered vim.ui.select
--
-- Temporarily replaces `vim.ui.select()` with the numbered selector for
-- the duration of the supplied callback.
-----------------------------------------------------------------------

function M.with_numbered(callback)
    local original = vim.ui.select

    vim.ui.select = function(items, opts, on_choice)
        M.numbered(items, opts, on_choice)
    end

    callback()

    vim.ui.select = original
end

return M
