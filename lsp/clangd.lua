return {
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--completion-style=detailed",
        "--header-insertion=iwyu",
    },

    filetypes = {
        "c",
        "cpp",
        "objc",
        "objcpp",
        "cuda",
        "proto",
    },

    root_markers = {
        ".clangd",
        ".clang-format",
        "compile_commands.json",
        "compile_flags.txt",
        ".git",
    },

    init_options = {
        clangdFileStatus = true,
    },

    settings = {},
}
