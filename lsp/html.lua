return {
    cmd = { "vscode-html-language-server", "--stdio" },

    filetypes = {
        "html",
    },

    root_markers = {
        ".git",
        "package.json",
    },

    init_options = {
        provideFormatter = true,
    },

    settings = {
        html = {
            hover = {
                documentation = true,
                references = true,
            },
            format = {
                wrapLineLength = 120,
                wrapAttributes = "auto",
            },
        },
    },
}
