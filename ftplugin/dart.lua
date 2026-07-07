-----------------------------------------------------------------------
-- Flutter
-----------------------------------------------------------------------

local map = vim.keymap.set

map("n", "<leader>ff", function()
    require("fzf-lua").files({
        cwd = "lib",
        prompt = "Flutter lib ❯ ",
    })
end, {
    desc = "Flutter lib",
})

map("n", "<leader>fr", "<Cmd>FlutterRun<CR>", {
    desc = "Run Flutter app",
})

map("n", "<leader>fR", "<Cmd>FlutterRestart<CR>", {
    desc = "Hot restart",
})

map("n", "<leader>fh", "<Cmd>FlutterReload<CR>", {
    desc = "Hot reload",
})

map("n", "<leader>fd", "<Cmd>FlutterDevices<CR>", {
    desc = "Flutter devices",
})

map("n", "<leader>fe", "<Cmd>FlutterEmulators<CR>", {
    desc = "Flutter emulators",
})

map("n", "<leader>fo", "<Cmd>FlutterOutlineToggle<CR>", {
    desc = "Flutter outline",
})

map("n", "<leader>fl", "<Cmd>FlutterLogToggle<CR>", {
    desc = "Flutter log",
})

map("n", "<leader>fq", "<Cmd>FlutterQuit<CR>", {
    desc = "Quit Flutter app",
})
