-----------------------------------------------------------------------
-- Terminal Utilities
--
-- Provides:
--   • Floating Terminal
--   • Horizontal Terminal
--   • Reuses terminal sessions
-----------------------------------------------------------------------

local M = {}

-----------------------------------------------------------------------
-- Terminal State
-----------------------------------------------------------------------

local state = {
    float = {
        buf = nil,
        win = nil,
    },

    horizontal = {
        buf = nil,
        win = nil,
    },
}

-----------------------------------------------------------------------
-- Helpers
-----------------------------------------------------------------------

---@param win integer
local function configure_window(win)
    local wo = vim.wo[win]

    wo.number = false
    wo.relativenumber = false
    wo.cursorline = false
    wo.signcolumn = "no"
    wo.foldcolumn = "0"
    wo.list = false
    wo.wrap = false
    wo.spell = false
    wo.statuscolumn = ""
end

---@param term table
local function ensure_terminal(term)
    if term.buf and vim.api.nvim_buf_is_valid(term.buf) then
        return
    end

    term.buf = vim.api.nvim_create_buf(false, true)
end

---@param buf integer
local function ensure_shell(buf)
    if vim.bo[buf].buftype == "terminal" then
        return
    end

    vim.api.nvim_set_current_buf(buf)
    vim.fn.termopen(vim.o.shell)
end

---@param term table
local function close_terminal(term)
    if term.win and vim.api.nvim_win_is_valid(term.win) then
        vim.api.nvim_win_close(term.win, true)
    end

    term.win = nil
end

---@param term table
---@param create_window fun(buf: integer): integer
local function open_terminal(term, create_window)
    ensure_terminal(term)

    term.win = create_window(term.buf)

    configure_window(term.win)

    ensure_shell(term.buf)

    vim.cmd.startinsert()
end

-----------------------------------------------------------------------
-- Floating Terminal
-----------------------------------------------------------------------

local function create_float_window(buf)
    local width = math.floor(vim.o.columns * 0.90)
    local height = math.floor(vim.o.lines * 0.85)

    return vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        style = "minimal",
        border = "rounded",
        width = width,
        height = height,
        row = math.floor((vim.o.lines - height) / 2),
        col = math.floor((vim.o.columns - width) / 2),
    })
end

function M.toggle_float()
    local term = state.float

    if term.win and vim.api.nvim_win_is_valid(term.win) then
        return close_terminal(term)
    end

    open_terminal(term, create_float_window)
end

-----------------------------------------------------------------------
-- Horizontal Terminal
-----------------------------------------------------------------------

local function create_horizontal_window(buf)
    vim.cmd("botright split")

    local win = vim.api.nvim_get_current_win()

    vim.api.nvim_win_set_height(
        win,
        math.floor(vim.o.lines * 0.30)
    )

    vim.api.nvim_win_set_buf(win, buf)

    return win
end

function M.toggle_horizontal()
    local term = state.horizontal

    if term.win and vim.api.nvim_win_is_valid(term.win) then
        return close_terminal(term)
    end

    open_terminal(term, create_horizontal_window)
end

-----------------------------------------------------------------------
-- Default Terminal
-----------------------------------------------------------------------

M.toggle = M.toggle_float

return M
