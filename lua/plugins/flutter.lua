-----------------------------------------------------------------------
-- Flutter Tools
--
-- Configures Flutter development support including:
--   • LSP integration
--   • Widget guides
--   • Closing tags
--   • Dev log
--   • DevTools
--   • Outline
-----------------------------------------------------------------------
local lsp = require("utils.lsp")

-----------------------------------------------------------------------
-- Setup
-----------------------------------------------------------------------

require("flutter-tools").setup({

    -------------------------------------------------------------------
    -- User Interface
    -------------------------------------------------------------------

    ui = {
        border = "rounded",
    },

    -------------------------------------------------------------------
    -- Project Root Detection
    -------------------------------------------------------------------

    root_patterns = {
        ".git",
        "pubspec.yaml",
    },

    -------------------------------------------------------------------
    -- Widget Guides
    -------------------------------------------------------------------

    widget_guides = {
        enabled = true,
    },

    -------------------------------------------------------------------
    -- Closing Tags
    -------------------------------------------------------------------

    closing_tags = {
        enabled = true,

        -- Highlight group used for the virtual closing tag.
        highlight = "ErrorMsg",

        -- Prefix displayed before the widget name.
        prefix = ">",

        -- Priority of the virtual text.
        priority = 10,
    },

    -------------------------------------------------------------------
    -- Dev Log
    -------------------------------------------------------------------

    dev_log = {
        enabled = true,

        -- Optional callback to filter log output.
        filter = nil,

        notify_errors = false,

        -- Open logs in a horizontal split.
        open_cmd = "15split",

        -- Keep focus in the current window.
        focus_on_open = false,
    },

    -------------------------------------------------------------------
    -- Flutter DevTools
    -------------------------------------------------------------------

    dev_tools = {
        autostart = false,
        auto_open_browser = false,
    },

    -------------------------------------------------------------------
    -- Widget Outline
    -------------------------------------------------------------------

    outline = {
        auto_open = false,

        -- Open outline in a vertical split.
        open_cmd = "30vnew",
    },

    -------------------------------------------------------------------
    -- LSP Configuration
    -------------------------------------------------------------------

    lsp = {
        capabilities = lsp.capabilities,

        on_attach = lsp.on_attach,

        settings = {
            -- Show TODO comments.
            showTodos = true,

            -- Automatically complete function call arguments.
            completeFunctionCalls = true,

            -- Enable snippet completions.
            enableSnippets = true,

            -- Update imports when renaming files.
            updateImportsOnRename = true,

            -- Prompt before renaming classes that match filenames.
            renameFilesWithClasses = "prompt",
        },
    },
})
