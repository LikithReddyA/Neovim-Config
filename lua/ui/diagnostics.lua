-----------------------------------------------------------------------
-- Diagnostics
--
-- Global diagnostic appearance and behaviour.
-----------------------------------------------------------------------

vim.diagnostic.config({
    virtual_text = {
        spacing = 2,
        source = "if_many",
        prefix = "●",
        current_line = false,
    },

    virtual_lines = {
        current_line = true,
    },

    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰌶 ",
            [vim.diagnostic.severity.HINT] = "󰋽 ",
        },
    },

    underline = true,
    severity_sort = true,
    update_in_insert = false,

    float = {
        border = "rounded",
        source = "if_many",
        focusable = false,
        header = "",
        prefix = "",
    },
})
