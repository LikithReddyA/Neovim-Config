local M = {}

function M.setup()
 require("nvim-tree").setup { -- BEGIN_DEFAULT_OPTS
	disable_netrw = true,
	hijack_netrw = true,
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	view = {
		width = 30,
		side = "left",
		number = true,
		relativenumber = true,
		signcolumn = "yes",
	},
	diagnostics = {
		enable = true,
		show_on_dirs = false,
		debounce_delay = 50,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	filters = {
		custom = {".git"},
	},
	actions = {
		open_file = {
			quit_on_open = true,
		},
	},
} 
  vim.g.nvim_tree_respect_buf_cwd = 1
end

return M
