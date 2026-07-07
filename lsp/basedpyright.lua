return {
    cmd = { "basedpyright-langserver", "--stdio" },

    filetypes = { "python" },

    root_markers = {
        "pyproject.toml",
        "setup.py",
        "setup.cfg",
        "requirements.txt",
        ".git",
    },

    settings = {
        basedpyright = {
            analysis = {
                typeCheckingMode = "recommended",

                autoSearchPaths = true,
                useLibraryCodeForTypes = true,

                diagnosticMode = "workspace",

                inlayHints = {
                    variableTypes = true,
                    functionReturnTypes = true,
                    callArgumentNames = true,
                },
            },
        },
    },
}
