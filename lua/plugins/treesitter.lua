-----------------------------------------------------------------------
-- Tree-sitter
--
-- Provides syntax parsing and highlighting for supported languages.
-- Parsers are installed on startup and attached automatically when a
-- supported filetype is opened.
-----------------------------------------------------------------------

local treesitter = require("nvim-treesitter")

-----------------------------------------------------------------------
-- Parsers
-----------------------------------------------------------------------

-- Languages to install and keep up to date.
local parsers = {
    "bash",
    "dart",
    "json",
    "lua",
    "html",
    "markdown",
}

treesitter.install(parsers)

-----------------------------------------------------------------------
-- Automatic Parser Attachment
-----------------------------------------------------------------------

vim.api.nvim_create_autocmd("FileType", {
    desc = "Start Tree-sitter highlighting for supported filetypes",
    callback = function(args)
        local bufnr = args.buf
        local filetype = vim.bo[bufnr].filetype

        -- Resolve the Tree-sitter language for this filetype.
        local language = vim.treesitter.language.get_lang(filetype)
        if not language then
            return
        end

        -- Skip if parser is unavailable.
        local ok = pcall(vim.treesitter.language.add, language)
        if not ok then
            return
        end

        -- Start Tree-sitter for this buffer.
        pcall(vim.treesitter.start, bufnr, language)
    end,
})
