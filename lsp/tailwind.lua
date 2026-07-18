return {
    cmd = { "tailwindcss-language-server", "--stdio" },

    filetypes = {
        "html",
        "css",
        "scss",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
    },

    root_markers = {
        "tailwind.config.js",
        "tailwind.config.cjs",
        "tailwind.config.ts",
        "postcss.config.js",
        "package.json",
        ".git",
    },

    settings = {
        tailwindCSS = {
            validate = true,
            emmetCompletions = true,
        },
    },
}
