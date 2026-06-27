-----------------------------------------------------------------------
-- Keymaps
--
-- Global keymaps used throughout Neovim.
--
-- Structure:
--   • Editing
--   • Navigation
--   • Windows & Splits
--   • Tabs
--   • Buffers
--   • Clipboard
--   • General
--   • Plugin Keymaps
-----------------------------------------------------------------------

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

local buffers = require("utils.buffer")
local lsp = require("utils.lsp")

-----------------------------------------------------------------------
-- Editing
-----------------------------------------------------------------------

-- Paste over the current selection without replacing the unnamed register.
map("x", "p", [["_dP]], {
    desc = "Paste without overwriting register",
})

-- Delete without copying into a register.
map({ "n", "v" }, "<leader>d", [["_d]], {
    desc = "Delete without yanking",
})

-- Prevent `x` from yanking deleted characters.
map("n", "x", '"_x', opts)

-- Exit insert mode.
map("i", "<C-c>", "<Esc>", {
    desc = "Exit insert mode",
})

-- Move selected lines.
map("v", "J", ":m '>+1<CR>gv=gv", {
    desc = "Move selection down",
})

map("v", "K", ":m '<-2<CR>gv=gv", {
    desc = "Move selection up",
})

-- Join lines while preserving cursor position.
map("n", "J", "mzJ`z", {
    desc = "Join lines",
})

-- Keep selection after indenting.
map("v", "<", "<gv", {
    desc = "Indent left",
})

map("v", ">", ">gv", {
    desc = "Indent right",
})

-- Replace the word under the cursor.
map(
    "n",
    "<leader>s",
    [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    {
        desc = "Replace word under cursor",
    }
)

-----------------------------------------------------------------------
-- Navigation
-----------------------------------------------------------------------

map("n", "<C-d>", "<C-d>zz", {
    desc = "Half page down",
})

map("n", "<C-u>", "<C-u>zz", {
    desc = "Half page up",
})

map("n", "n", "nzzzv", {
    desc = "Next search result",
})

map("n", "N", "Nzzzv", {
    desc = "Previous search result",
})

-----------------------------------------------------------------------
-- Windows & Splits
-----------------------------------------------------------------------

map("n", "<leader>sv", "<C-w>v", {
    desc = "Split vertically",
})

map("n", "<leader>sh", "<C-w>s", {
    desc = "Split horizontally",
})

map("n", "<leader>sx", "<Cmd>close<CR>", {
    desc = "Close split",
})

map("n", "<leader>s=", "<C-w>=", {
    desc = "Equalize splits",
})

map("n", "<C-h>", "<C-w>h", {
    desc = "Focus left split",
})

map("n", "<C-j>", "<C-w>j", {
    desc = "Focus lower split",
})

map("n", "<C-k>", "<C-w>k", {
    desc = "Focus upper split",
})

map("n", "<C-l>", "<C-w>l", {
    desc = "Focus right split",
})

-----------------------------------------------------------------------
-- Tabs
-----------------------------------------------------------------------

map("n", "<leader>to", "<Cmd>tabnew<CR>", {
    desc = "New tab",
})

map("n", "<leader>tx", "<Cmd>tabclose<CR>", {
    desc = "Close tab",
})

map("n", "<leader>tn", "<Cmd>tabnext<CR>", {
    desc = "Next tab",
})

map("n", "<leader>tp", "<Cmd>tabprevious<CR>", {
    desc = "Previous tab",
})

map("n", "<leader>tf", "<Cmd>tabnew %<CR>", {
    desc = "Current buffer in new tab",
})

-----------------------------------------------------------------------
-- Buffers
-----------------------------------------------------------------------

map("n", "<leader>bd", buffers.close_current, {
    desc = "Close current buffer",
})

map("n", "<leader>bo", buffers.close_others, {
    desc = "Close other buffers",
})

map("n", "<leader>bh", buffers.close_left, {
    desc = "Close left buffers",
})

map("n", "<leader>bl", buffers.close_right, {
    desc = "Close right buffers",
})

map("n", "<S-h>", buffers.previous, {
    desc = "Previous buffer",
})

map("n", "<S-l>", buffers.next, {
    desc = "Next buffer",
})

-----------------------------------------------------------------------
-- Clipboard
-----------------------------------------------------------------------

map("n", "<leader>fp", function()
    local path = vim.fn.expand("%:~")
    vim.fn.setreg("+", path)
    vim.notify("Copied: " .. path)
end, {
    desc = "Copy file path",
})

map("n", "<leader>yd", function()
    local line = vim.api.nvim_win_get_cursor(0)[1] - 1
    local diagnostics = vim.diagnostic.get(0, { lnum = line })

    if #diagnostics > 0 then
        vim.fn.setreg("+", diagnostics[1].message)
        vim.notify("Diagnostic copied")
    end
end, {
    desc = "Copy diagnostic",
})

-----------------------------------------------------------------------
-- General
-----------------------------------------------------------------------

map("n", "<C-c>", "<Cmd>nohlsearch<CR>", {
    desc = "Clear search highlight",
})

map("n", "<leader>X", "<Cmd>!chmod +x %<CR>", {
    desc = "Make current file executable",
})

map("n", "<leader>re", "<Cmd>restart<CR>", {
    desc = "Restart Neovim",
})

map("n", "<leader>lr", function()
    vim.cmd("LspRestart")
    vim.notify("LSP restarted")
end, {
    desc = "Restart LSP",
})

-----------------------------------------------------------------------
-- Mini.nvim
-----------------------------------------------------------------------

local MiniFiles = require("mini.files")
local MiniPick = require("mini.pick")
local MiniExtra = require("mini.extra")

map("n", "-", function()
    MiniFiles.open()
end, {
    desc = "Open Mini Files",
})

map("n", "<leader>-", function()
    MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
    MiniFiles.reveal_cwd()
end, {
    desc = "Reveal current file",
})


-----------------------------------------------------------------------
-- FZF-Lua
-----------------------------------------------------------------------

local fzf = require("fzf-lua")

map("n", "<leader>ff", fzf.files, {
    desc = "Find files",
})

map("n", "<leader>fg", fzf.live_grep, {
    desc = "Live grep",
})

map("n", "<leader>fb", fzf.buffers, {
    desc = "Find buffers",
})

map("n", "<leader>fh", fzf.help_tags, {
    desc = "Help tags",
})

map("n", "<leader>fk", fzf.keymaps, {
    desc = "Keymaps",
})

map("n", "<leader>fc", function()
    fzf.files({
        cwd = vim.fn.stdpath("config"),
        prompt = "Neovim Config ❯ ",
    })
end, {
    desc = "Neovim config",
})

map("n", "<leader>fl", function()
    fzf.files({
        cwd = "lib",
        prompt = "Flutter lib ❯ ",
    })
end, {
    desc = "Flutter lib",
})

map("n", "<leader>fr", fzf.resume, {
    desc = "Resume last search",
})

-----------------------------------------------------------------------
-- NvimTree
-----------------------------------------------------------------------

map("n", "<leader>e", "<Cmd>NvimTreeToggle<CR>", {
    desc = "Toggle file explorer",
})

map("n", "<leader>o", function()
    require("nvim-tree.api").tree.find_file({
        open = true,
        focus = true,
    })
end, {
    desc = "Reveal current file",
})

-----------------------------------------------------------------------
-- LSP
-----------------------------------------------------------------------

map("n", "<leader>cA", lsp.numbered_code_actions, {
    desc = "Numbered code actions",
})

-----------------------------------------------------------------------
-- Flutter
-----------------------------------------------------------------------

-- map("n", "<leader>fr", "<Cmd>FlutterRun<CR>", {
--     desc = "Run Flutter app",
-- })
--
-- map("n", "<leader>fR", "<Cmd>FlutterRestart<CR>", {
--     desc = "Hot restart",
-- })
--
-- map("n", "<leader>fh", "<Cmd>FlutterReload<CR>", {
--     desc = "Hot reload",
-- })
--
-- map("n", "<leader>fd", "<Cmd>FlutterDevices<CR>", {
--     desc = "Flutter devices",
-- })
--
-- map("n", "<leader>fe", "<Cmd>FlutterEmulators<CR>", {
--     desc = "Flutter emulators",
-- })
--
map("n", "<leader>fo", "<Cmd>FlutterOutlineToggle<CR>", {
    desc = "Flutter outline",
})
--
-- map("n", "<leader>fgl", "<Cmd>FlutterLogToggle<CR>", {
--     desc = "Flutter log",
-- })
--
-- map("n", "<leader>fq", "<Cmd>FlutterQuit<CR>", {
--     desc = "Quit Flutter app",
-- })

-----------------------------------------------------------------------
-- Git
-----------------------------------------------------------------------

local gs = require("gitsigns")

-- Navigation
map("n", "]h", gs.next_hunk, {
    desc = "Next hunk",
})

map("n", "[h", gs.prev_hunk, {
    desc = "Previous hunk",
})

-- Stage / Reset
map("n", "<leader>hs", gs.stage_hunk, {
    desc = "Stage hunk",
})

map("v", "<leader>hs", function()
    gs.stage_hunk({
        vim.fn.line("."),
        vim.fn.line("v"),
    })
end, {
    desc = "Stage selected hunk",
})

map("n", "<leader>hr", gs.reset_hunk, {
    desc = "Reset hunk",
})

map("v", "<leader>hr", function()
    gs.reset_hunk({
        vim.fn.line("."),
        vim.fn.line("v"),
    })
end, {
    desc = "Reset selected hunk",
})

map("n", "<leader>hS", gs.stage_buffer, {
    desc = "Stage buffer",
})

map("n", "<leader>hR", gs.reset_buffer, {
    desc = "Reset buffer",
})

-- Preview / Diff
map("n", "<leader>hp", gs.preview_hunk, {
    desc = "Preview hunk",
})

map("n", "<leader>hd", gs.diffthis, {
    desc = "Diff against index",
})

map("n", "<leader>hD", function()
    gs.diffthis("~")
end, {
    desc = "Diff against HEAD",
})

-- Blame
map("n", "<leader>hb", gs.blame_line, {
    desc = "Blame line",
})

map("n", "<leader>tb", gs.toggle_current_line_blame, {
    desc = "Toggle line blame",
})

map("n", "<leader>th", gs.toggle_deleted, {
    desc = "Toggle deleted lines",
})

-- Text object
map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", {
    desc = "Git hunk",
})

-----------------------------------------------------------------------
-- LuaSnip
-----------------------------------------------------------------------

local luasnip = require("luasnip")

map({ "i", "s" }, "<C-e>", function()
    if luasnip.choice_active() then
        luasnip.change_choice(1)
    end
end, {
    desc = "Next snippet choice",
})
