-----------------------------------------------------------------------
-- Theme
--
-- Configures the editor colorscheme and theme-specific overrides.
-----------------------------------------------------------------------

vim.cmd.colorscheme("catppuccin-mocha")

vim.api.nvim_set_hl(0, "Normal", {
    bg = "NONE",
})

vim.api.nvim_set_hl(0, "NormalNC", {
    bg = "NONE",
})

vim.api.nvim_set_hl(0, "NonText", {
    bg = "NONE",
}) -- Transparent editor background.
