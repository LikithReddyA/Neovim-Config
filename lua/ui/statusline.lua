-----------------------------------------------------------------------
-- Custom Statusline
--
-- This module is responsible only for rendering the statusline.
-- Every section is implemented as a small reusable function so new
-- components (Git branch, LSP progress, macro recording, etc.) can be
-- added without modifying the main statusline() function.
-----------------------------------------------------------------------

local fn = vim.fn
local bo = vim.bo

-- local devicons = require("nvim-web-devicons")
local has_devicons, devicons = pcall(require, "nvim-web-devicons")

local M = {}

-----------------------------------------------------------------------
-- Editor mode
-----------------------------------------------------------------------

local function mode()
    local modes = {
        n = "NORMAL",
        i = "INSERT",
        v = "VISUAL",
        V = "VISUAL LINE",
        ["\22"] = "VISUAL BLOCK",
        c = "C",
        R = "R",
        t = "T",
    }

    return modes[fn.mode()] or fn.mode()
end

local function mode_highlight()
    local groups = {
        i = "%#StInsert#",
        R = "%#StReplace#",
        v = "%#StVisual#",
        V = "%#StVisual#",
        ["\22"] = "%#StVisual#",
    }

    return groups[fn.mode()] or "%#StNormal#"
end

-----------------------------------------------------------------------
-- File information
-----------------------------------------------------------------------

local function file_icon()
    if not has_devicons then
        return ""
    end

    local filename = fn.expand("%:t")
    local extension = fn.expand("%:e")

    local icon = devicons.get_icon(filename, extension, {
        default = true,
    })

    return icon or ""
end

local function file_info()
    local modified = bo.modified and "%#WinbarModified# ●" or ""

    return table.concat({
        "%#WinbarFile#",
        " ",
        file_icon(),
        " ",
        fn.expand("%:~:."),
        modified,
        "%*",
    })
end

-----------------------------------------------------------------------
-- Diagnostics
-----------------------------------------------------------------------

local function diagnostics()
    local errors = #vim.diagnostic.get(
        0,
        { severity = vim.diagnostic.severity.ERROR }
    )

    local warnings = #vim.diagnostic.get(
        0,
        { severity = vim.diagnostic.severity.WARN }
    )

    local parts = {}

    if errors > 0 then
        table.insert(parts, "%#StError#󰅚 " .. errors)
    end

    if warnings > 0 then
        table.insert(parts, "%#StWarn#󰀪 " .. warnings)
    end

    if #parts == 0 then
        return ""
    end

    return table.concat(parts, " ") .. "%*"
end

-----------------------------------------------------------------------
-- Cursor information
-----------------------------------------------------------------------

local function cursor_info()
    return table.concat({
        bo.filetype,
        "  ",
        "%p%%",
        " ",
        "%l:%c",
    })
end

-----------------------------------------------------------------------
-- Statusline
-----------------------------------------------------------------------

function M.render()
    local diag = diagnostics()

    return table.concat({
        mode_highlight(),
        " ",
        mode(),
        " ",
        "%*",

        file_info(),

        "%=",

        diag,
        diag ~= "" and "  " or "",

        cursor_info(),

        " ",
    })
end

return M
