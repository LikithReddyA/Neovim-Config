-----------------------------------------------------------------------
-- Autocommands
-----------------------------------------------------------------------

local api = vim.api

-----------------------------------------------------------------------
-- Highlight yanked text
-----------------------------------------------------------------------

api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight yanked text",

    callback = function()
        vim.hl.on_yank()
    end,
})
-----------------------------------------------------------------------
-- LSP Signature Help
-----------------------------------------------------------------------

local signature_triggers = {
    ["("] = true,
    [","] = true,
}

vim.api.nvim_create_autocmd("TextChangedI", {
    desc = "Show LSP signature help while typing",
    callback = function()
        local line = vim.api.nvim_get_current_line()
        local col = vim.api.nvim_win_get_cursor(0)[2]

        if col == 0 then
            return
        end

        local last = line:sub(col, col)

        if signature_triggers[last] then
            vim.schedule(vim.lsp.buf.signature_help)
        end
    end,
})

--------------------------------------------------------------------------------
-- Flutter: Enable document colors
--------------------------------------------------------------------------------

local flutter_group =
    vim.api.nvim_create_augroup("FlutterColors", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
    group = flutter_group,

    desc = "Enable Flutter document colors",

    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if client and client.name == "dartls" then
            vim.lsp.document_color.enable(true, {
                bufnr = args.buf,
            })
        end
    end,
})

-----------------------------------------------------------------------
-- Terminal
-----------------------------------------------------------------------

local terminal_group = vim.api.nvim_create_augroup("Terminal", {
    clear = true,
})

vim.api.nvim_create_autocmd("TermOpen", {
    group = terminal_group,
    callback = function(args)
        local bo = vim.bo[args.buf]

        bo.buflisted = false
        bo.bufhidden = "hide"
        bo.swapfile = false

        vim.cmd.startinsert()
    end,
})

vim.api.nvim_create_autocmd("BufEnter", {
    group = terminal_group,
    pattern = "term://*",
    command = "startinsert",
})
