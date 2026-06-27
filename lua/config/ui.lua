-----------------------------------------------------------------------
-- UI Configuration
-----------------------------------------------------------------------

require("ui.highlights")
require("ui.diagnostics")

local statusline = require("ui.statusline")
local tabline = require("ui.tabline")
local statuscolumn = require("ui.statuscolumn")

-----------------------------------------------------------------------
-- Global entry points
--
-- Vim evaluates statusline, tabline and statuscolumn expressions using
-- global Lua functions. These globals act only as adapters and keep
-- the implementation inside dedicated UI modules.
-----------------------------------------------------------------------

_G.Statusline = statusline.render
_G.Tabline = tabline.render
_G.StatusColumnFold = statuscolumn.fold_indicator

-----------------------------------------------------------------------
-- UI Options
-----------------------------------------------------------------------

vim.opt.laststatus = 3
vim.opt.showtabline = 2

vim.opt.statusline = "%!v:lua.Statusline()"
vim.opt.tabline = "%!v:lua.Tabline()"

vim.opt.statuscolumn =
"%s%{%v:lua.StatusColumnFold()%} %=%{&rnu ? v:relnum ? v:relnum : v:lnum : v:lnum} "
