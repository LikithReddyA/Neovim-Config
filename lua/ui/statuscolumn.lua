-----------------------------------------------------------------------
-- Custom Status Column
--
-- Responsible for rendering the left gutter:
--   • Fold indicators
--   • (Future) Git signs
--   • (Future) Breakpoints
--   • (Future) Diagnostics
-----------------------------------------------------------------------

local M = {}

--- Returns the fold indicator for the current line.
---
--- Symbols:
---     Closed fold
---     Fold starts here
---      No fold
---
---@return string
function M.fold_indicator()
    local line = vim.v.lnum

    if vim.fn.foldlevel(line) == 0 then
        return " "
    end

    if vim.fn.foldclosed(line) ~= -1 then
        return " "
    end

    if vim.fn.foldlevel(line) > vim.fn.foldlevel(line - 1) then
        return " "
    end

    return "  "
end

return M
