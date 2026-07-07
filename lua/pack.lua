-----------------------------------------------------------------------
-- Plugin Installation
--
-- Installs and updates plugins using Neovim's built-in package manager.
-----------------------------------------------------------------------

vim.pack.add({
    "https://github.com/catppuccin/nvim",
    "https://github.com/nvim-mini/mini.nvim",

    "https://github.com/nvim-tree/nvim-tree.lua",
    "https://github.com/nvim-tree/nvim-web-devicons",

    "https://github.com/saghen/blink.lib",
    "https://github.com/saghen/blink.cmp",

    "https://github.com/L3MON4D3/LuaSnip",
    "https://github.com/rafamadriz/friendly-snippets",

    "https://github.com/nvim-flutter/flutter-tools.nvim",

    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/lewis6991/gitsigns.nvim",

    "https://github.com/ibhagwan/fzf-lua",
    "https://github.com/folke/which-key.nvim.git",

    'https://github.com/MeanderingProgrammer/render-markdown.nvim',
    {
        src = "https://github.com/nvim-treesitter/nvim-treesitter",
        branch = "main",
    },
})

-----------------------------------------------------------------------
-- Plugin Configuration
-----------------------------------------------------------------------

require("plugins")
