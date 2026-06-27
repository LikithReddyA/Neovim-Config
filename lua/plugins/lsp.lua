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
-- Lua Language Server
-----------------------------------------------------------------------

vim.lsp.config("lua_ls", {
    cmd = { "lua-language-server" },

    filetypes = { "lua" },

    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },

            workspace = {
                checkThirdParty = false,
            },

            telemetry = {
                enable = false,
            },

            hint = {
                enable = true,
                setType = true,
                paramType = true,
                paramName = "Disable",
                semicolon = "Disable",
                arrayIndex = "Disable",
            },
        },
    },
})

-----------------------------------------------------------------------
-- Enable Servers
-----------------------------------------------------------------------

vim.lsp.enable({
    "lua_ls",
})
