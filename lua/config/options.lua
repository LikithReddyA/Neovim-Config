-----------------------------------------------------------------------
-- Editor Options
--
-- This module configures Neovim's built-in editor behaviour.
-- It intentionally contains only options. UI components,
-- autocmds and helper functions live in their own modules.
-----------------------------------------------------------------------

local opt = vim.opt
local g = vim.g
local fn = vim.fn

-----------------------------------------------------------------------
-- Built-in plugins
-----------------------------------------------------------------------

-- Hide the Netrw banner when opening the file explorer.
g.netrw_banner = 0
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
-----------------------------------------------------------------------
-- User Interface
-----------------------------------------------------------------------

opt.number = true
opt.relativenumber = true

vim.o.winborder = "rounded"

opt.signcolumn = "yes:1"
opt.termguicolors = true
opt.scrolloff = 8

-----------------------------------------------------------------------
-- Indentation
-----------------------------------------------------------------------

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-----------------------------------------------------------------------
-- Search
-----------------------------------------------------------------------

opt.ignorecase = true
opt.smartcase = true

-----------------------------------------------------------------------
-- Windows
-----------------------------------------------------------------------

opt.splitbelow = true
opt.splitright = true

-----------------------------------------------------------------------
-- Editing
-----------------------------------------------------------------------

opt.wrap = false
opt.inccommand = "split"

-----------------------------------------------------------------------
-- Files
-----------------------------------------------------------------------

opt.swapfile = false
opt.backup = false

opt.undofile = true
opt.undodir = fn.stdpath("data") .. "/undodir"

-----------------------------------------------------------------------
-- Completion
-----------------------------------------------------------------------

opt.completeopt = {
    "menuone",
    "noselect",
    "fuzzy",
    "nosort",
}

opt.shortmess:append("c")

-----------------------------------------------------------------------
-- Clipboard
-----------------------------------------------------------------------

opt.clipboard:append("unnamedplus")

-----------------------------------------------------------------------
-- Key Mapping Timeouts
-----------------------------------------------------------------------

opt.timeout = true      -- Enable mapping timeouts
opt.timeoutlen = 300    -- Wait 300ms for key sequence completion

-----------------------------------------------------------------------
-- Folding
-----------------------------------------------------------------------

opt.foldenable = true

-- Start with all folds open.
opt.foldlevel = 99
opt.foldlevelstart = 99

-- Use Tree-sitter to determine fold regions.
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- Hide the dedicated fold column. The fold indicator is rendered
-- inside the custom statuscolumn instead.
opt.foldcolumn = "0"

opt.fillchars:append({
  fold = " ",
  vert = "┃",
  horiz = "━",
})
opt.foldtext = ""
