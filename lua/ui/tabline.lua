-----------------------------------------------------------------------
-- Custom Tabline
--
-- Displays all listed buffers in the current session.
-- The active buffer is highlighted and modified buffers are marked
-- with a ● indicator.
-----------------------------------------------------------------------

local api = vim.api
local bo = vim.bo
local fn = vim.fn

local buffer = require("utils.buffer")

local M = {}

function M.render()
    local current = api.nvim_get_current_buf()
    local line = ""

    for _, buf in ipairs(buffer.listed_buffers()) do
        local name = fn.fnamemodify(
            api.nvim_buf_get_name(buf.bufnr),
            ":t"
        )

        if name == "" then
            name = "[No Name]"
        end

        local modified = bo[buf.bufnr].modified and " ●" or ""

        local hl = buf.bufnr == current
            and "%#TabLineSel#"
            or "%#TabLine#"

        line = line .. hl
        line = line .. string.format(
            " %s%s ",
            name,
            modified
        )
    end

    return line .. "%#TabLineFill#"
end

return M
