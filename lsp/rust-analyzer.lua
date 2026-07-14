return {
    cmd = { "rust-analyzer" },

    filetypes = { "rust" },

    root_markers = {
        "Cargo.toml",
        "Cargo.lock",
        ".git",
    },

    settings = {
        ["rust-analyzer"] = {
            cargo = {
                allFeatures = true,
            },

            check = {
                command = "clippy",
            },

            procMacro = {
                enable = true,
            },

            completion = {
                postfix = {
                    enable = true,
                },
            },

            inlayHints = {
                bindingModeHints = {
                    enable = false,
                },
                closureReturnTypeHints = {
                    enable = "with_block",
                },
                lifetimeElisionHints = {
                    enable = "skip_trivial",
                },
            },
        },
    },
}
