-----------------------------------------------------------------------
-- Custom Bufferline
--
-- Features:
--   • Displays listed buffers
--   • Active buffer is always visible
--   • Filename truncation
--   • Overflow indicators (◀ ▶)
--   • Modified buffer indicator (●)
-----------------------------------------------------------------------

--TODO: Need to update the spaces for overflow scenarios properly

local api = vim.api
local bo = vim.bo
local fn = vim.fn

local buffer = require("utils.buffer")

local M = {}

-----------------------------------------------------------------------
-- Configuration
-----------------------------------------------------------------------

local MAX_NAME_LENGTH = 18

-----------------------------------------------------------------------
-- Helpers
-----------------------------------------------------------------------

---@param name string
---@return string
local function truncate(name)
    if #name <= MAX_NAME_LENGTH then
        return name
    end

    return name:sub(1, MAX_NAME_LENGTH - 1) .. "…"
end

-----------------------------------------------------------------------
-- Render
-----------------------------------------------------------------------

function M.render()
    local buffers = buffer.listed_buffers()
    local current = api.nvim_get_current_buf()

    if #buffers == 0 then
        return "%#TabLineFill#"
    end

    -------------------------------------------------------------------
    -- Build entries
    -------------------------------------------------------------------

    local entries = {}
    local current_index = 1

    for i, buf in ipairs(buffers) do
        local name = fn.fnamemodify(
            api.nvim_buf_get_name(buf.bufnr),
            ":t"
        )

        if name == "" then
            name = "[No Name]"
        end

        name = truncate(name)

        if bo[buf.bufnr].modified then
            name = name .. " ●"
        end

        local text = " " .. name .. " "

        entries[i] = {
            bufnr = buf.bufnr,
            text = text,
            width = fn.strdisplaywidth(text),
        }

        if buf.bufnr == current then
            current_index = i
        end
    end

    -------------------------------------------------------------------
    -- Sliding Window
    -------------------------------------------------------------------

    local available = vim.o.columns - 4 -- room for ◀ ▶

    local start = current_index
    local finish = current_index

    local width = entries[current_index].width

    while true do
        local expanded = false

        if start > 1 then
            local w = width + entries[start - 1].width

            if w <= available then
                start = start - 1
                width = w
                expanded = true
            end
        end

        if finish < #entries then
            local w = width + entries[finish + 1].width

            if w <= available then
                finish = finish + 1
                width = w
                expanded = true
            end
        end

        if not expanded then
            break
        end
    end

    -------------------------------------------------------------------
    -- Draw
    -------------------------------------------------------------------

    local line = ""

    if start > 1 then
        line = line .. "%#TabLineFill# ◀ "
    end

    for i = start, finish do
        local hl = i == current_index
                and "%#TabLineSel#"
            or "%#TabLine#"

        line = line .. hl .. entries[i].text
    end

    if finish < #entries then
        line = line .. "%#TabLineFill# ▶ "
    end

    return line .. "%#TabLineFill#"
end

return M
