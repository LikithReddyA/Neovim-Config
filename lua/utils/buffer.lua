local M = {}

--- Returns all listed buffers in the order maintained by Neovim.
---
--- We use `getbufinfo({ buflisted = 1 })` instead of `nvim_list_bufs()`
--- because:
---   - it ignores unlisted buffers (help, terminal, etc.)
---   - it preserves the order shown by :buffers and most bufferline plugins.
---
---@return table[]
function M.listed_buffers()
    return vim.fn.getbufinfo({ buflisted = 1 })
end

--- Finds the position of the current buffer within the listed buffers.
---
--- This index is used by `close_left()` and `close_right()` to determine
--- which buffers lie before or after the current one.
---
---@param buffers table[]
---@return integer|nil
local function current_buffer_index(buffers)
    local current = vim.api.nvim_get_current_buf()

    for i, buf in ipairs(buffers) do
        if buf.bufnr == current then
            return i
        end
    end

    return nil
end

--- Closes the current buffer.
function M.close_current()
    vim.cmd.bdelete()
end

--- Closes every listed buffer except the current one.
---
--- Useful when you want to keep only the file you're actively working on.
function M.close_others()
    local current = vim.api.nvim_get_current_buf()

    for _, buf in ipairs(M.listed_buffers()) do
        if buf.bufnr ~= current then
            vim.cmd.bdelete(buf.bufnr)
        end
    end
end

--- Closes all listed buffers that appear before the current buffer.
---
--- The "left" side refers to the order of listed buffers,
--- not the buffer number.
function M.close_left()
    local buffers = M.listed_buffers()
    local current_index = current_buffer_index(buffers)

    if not current_index then
        return
    end

    for i = 1, current_index - 1 do
        vim.cmd.bdelete(buffers[i].bufnr)
    end
end

--- Closes all listed buffers that appear after the current buffer.
---
--- The "right" side refers to the order of listed buffers,
--- not the buffer number.
function M.close_right()
    local buffers = M.listed_buffers()
    local current_index = current_buffer_index(buffers)

    if not current_index then
        return
    end

    for i = current_index + 1, #buffers do
        vim.cmd.bdelete(buffers[i].bufnr)
    end
end

function M.next()
    vim.cmd.bnext()
end

function M.previous()
    vim.cmd.bprevious()
end

function M.first()
    vim.cmd.bfirst()
end

function M.last()
    vim.cmd.blast()
end

return M
