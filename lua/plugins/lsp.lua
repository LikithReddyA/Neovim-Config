-----------------------------------------------------------------------
-- LSP
-----------------------------------------------------------------------
local lsp = require("utils.lsp")

-----------------------------------------------------------------------
-- Default LSP Configuration
-----------------------------------------------------------------------

vim.lsp.config("*", {
    capabilities = lsp.capabilities,

    on_attach = lsp.on_attach,

    handlers = {
        ["textDocument/signatureHelp"] = function(err, result, ctx, config)
            config = config or {}
            config.border = "rounded"

            return vim.lsp.handlers.signature_help(
                err,
                result,
                ctx,
                config
            )
        end,
    },
})

-----------------------------------------------------------------------
-- Enable Servers
-----------------------------------------------------------------------

vim.lsp.enable({
    "lua_ls",
    "basedpyright",
    "ruff",
    "clangd",
    "rust-analyzer",
})
