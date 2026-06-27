-----------------------------------------------------------------------
-- Code Actions
--
-- Provides an inputlist-based numbered code action picker.
-----------------------------------------------------------------------

local M = {}

function M.numbered()
    local original = vim.ui.select

    vim.ui.select = function(items, opts, on_choice)
        local menu = {}

        for i, item in ipairs(items) do
            local text = opts.format_item
                    and opts.format_item(item)
                or tostring(item)

            table.insert(menu, string.format("%d. %s", i, text))
        end

        local choice = vim.fn.inputlist(
            vim.list_extend(
                { opts.prompt or "Code Actions" },
                menu
            )
        )

        vim.ui.select = original

        if choice >= 1 and choice <= #items then
            on_choice(items[choice], choice)
        else
            on_choice(nil, nil)
        end
    end

    vim.lsp.buf.code_action()
end

return M
