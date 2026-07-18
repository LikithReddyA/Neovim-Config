return {
    cmd = { "yaml-language-server", "--stdio" },

    filetypes = {
        "yaml",
        "yml",
    },

    root_markers = {
        ".git",
    },

    settings = {
        yaml = {
            validate = true,
            hover = true,
            completion = true,
        },
    },
}
