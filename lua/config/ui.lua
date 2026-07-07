-----------------------------------------------------------------------
-- UI Configuration
-----------------------------------------------------------------------

require("ui.highlights")
require("ui.diagnostics")

local statusline = require("ui.statusline")
local tabline = require("ui.tabline")
local statuscolumn = require("ui.statuscolumn")

-----------------------------------------------------------------------
-- Global Entry Points
-----------------------------------------------------------------------

_G.Statusline = statusline.render
_G.Tabline = tabline.render
_G.StatusColumnFold = statuscolumn.fold_indicator
_G.StatusColumnNumber = statuscolumn.line_number

-----------------------------------------------------------------------
-- UI Options
-----------------------------------------------------------------------

vim.opt.laststatus = 3
vim.opt.showtabline = 2

vim.opt.statusline = "%!v:lua.Statusline()"
vim.opt.tabline = "%!v:lua.Tabline()"

vim.opt.statuscolumn =
    "%s%{%v:lua.StatusColumnFold()%}%{%v:lua.StatusColumnNumber()%}"
