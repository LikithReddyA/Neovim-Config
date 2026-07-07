return {
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
}
