-----------------------------------------------------------------------
-- Custom Status Column
--
-- Responsible for rendering the left gutter:
--   • Fold indicators
--   • Line numbers
--   • (Future) Git signs
--   • (Future) Breakpoints
--   • (Future) Diagnostics
-----------------------------------------------------------------------

local M = {}

-----------------------------------------------------------------------
-- Fold Indicator
-----------------------------------------------------------------------

---Returns the fold indicator for the current line.
---
---Symbols:
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

-----------------------------------------------------------------------
-- Line Number
-----------------------------------------------------------------------

---Returns the formatted line number.
---
---@return string
function M.line_number()
    if not vim.wo.number then
        return ""
    end

    -- Current line
    if vim.v.relnum == 0 then
        return string.format("%%#CursorLineNr#%-4d", vim.v.lnum)
    end

    -- Relative numbers
    if vim.wo.relativenumber then
        return string.format(
            "%%#StatusColumnRelative# %2d",
            vim.v.relnum
        )
    end

    -- Absolute numbers
    return string.format(
        "%%#LineNr# %2d",
        vim.v.lnum
    )
end
return M
