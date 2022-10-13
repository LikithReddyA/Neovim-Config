local M = {}

local nls = require "null-ls"
local nls_utils = require "null-ls.utils"
local b = nls.builtins

local with_root_file = function(builtin, file)
  return builtin.with {
    condition = function(utils)
      return utils.root_has_file(file)
    end,
  }
end

local sources = {
  -- formatting
	b.formatting.dart_format,
	b.formatting.clang_format,
  b.formatting.prettierd,
  b.formatting.shfmt,
  b.formatting.fixjson,
  b.formatting.black.with { extra_args = { "--fast" } },
  b.formatting.isort,
  with_root_file(b.formatting.stylua, "stylua.toml"),

  -- hover
  b.hover.dictionary,
}

function M.setup(opts)
  nls.setup {
    -- debug = true,
    debounce = 150,
    save_after_format = false,
    sources = sources,
    on_attach = opts.on_attach,
    root_dir = nls_utils.root_pattern ".git",
  }
end

return M
