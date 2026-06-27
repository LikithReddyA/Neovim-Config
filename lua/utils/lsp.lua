-----------------------------------------------------------------------
-- LSP Utilities
--
-- Shared capabilities and on_attach callback used by language servers
-- and plugins integrating with Neovim's built-in LSP.
-----------------------------------------------------------------------

local blink = require("blink.cmp")

local M = {}

-----------------------------------------------------------------------
-- Capabilities
-----------------------------------------------------------------------

M.capabilities = vim.tbl_deep_extend(
    "force",
    vim.lsp.protocol.make_client_capabilities(),
    blink.get_lsp_capabilities()
)

-----------------------------------------------------------------------
-- Buffer Attach
-----------------------------------------------------------------------

function M.on_attach(client, bufnr)
    -------------------------------------------------------------------
    -- Enable inlay hints when supported.
    -------------------------------------------------------------------

    if client:supports_method("textDocument/inlayHint") then
        vim.lsp.inlay_hint.enable(true, {
            bufnr = bufnr,
        })
    end

    -------------------------------------------------------------------
    -- Buffer-local mapping helper
    -------------------------------------------------------------------

    local function bufmap(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, {
            buffer = bufnr,
            silent = true,
            desc = desc,
        })
    end

    -------------------------------------------------------------------
    -- Navigation
    -------------------------------------------------------------------

    bufmap("n", "gd", vim.lsp.buf.definition, "Goto definition")
    bufmap("n", "gr", vim.lsp.buf.references, "List references")
    bufmap("n", "K", vim.lsp.buf.hover, "Hover documentation")

    -------------------------------------------------------------------
    -- Code Actions
    -------------------------------------------------------------------

    bufmap("n", "<leader>ca", vim.lsp.buf.code_action, "Code actions")
    bufmap("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
    bufmap("n", "<leader>cf", vim.lsp.buf.format, "Format document")

    -------------------------------------------------------------------
    -- Diagnostics
    -------------------------------------------------------------------

    bufmap("n", "gl", vim.diagnostic.open_float, "Line diagnostics")

    -------------------------------------------------------------------
    -- Signature Help
    -------------------------------------------------------------------

    bufmap("i", "<C-k>", vim.lsp.buf.signature_help, "Signature help")
end

-----------------------------------------------------------------------
-- Numbered Code Actions
-----------------------------------------------------------------------

local select = require("utils.select")

function M.numbered_code_actions()
    select.with_numbered(function()
        vim.lsp.buf.code_action()
    end)
end
return M
