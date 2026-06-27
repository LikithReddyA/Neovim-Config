-----------------------------------------------------------------------
-- UI Highlight Groups
--
-- Defines highlight groups used by the custom statusline and tabline.
-- Keeping them in one place makes it easy to change the overall theme
-- without touching the rendering logic.
-----------------------------------------------------------------------

local api = vim.api

-----------------------------------------------------------------------
-- Statusline
-----------------------------------------------------------------------

api.nvim_set_hl(0, "StNormal", { link = "Keyword" })
api.nvim_set_hl(0, "StInsert", { link = "String" })
api.nvim_set_hl(0, "StVisual", { link = "Function" })
api.nvim_set_hl(0, "StReplace", { link = "Error" })

api.nvim_set_hl(0, "StError", { link = "DiagnosticError" })
api.nvim_set_hl(0, "StWarn", { link = "DiagnosticWarn" })

-----------------------------------------------------------------------
-- File information
-----------------------------------------------------------------------

api.nvim_set_hl(0, "WinbarFile", { link = "Directory" })
api.nvim_set_hl(0, "WinbarModified", { link = "DiagnosticWarn" })
