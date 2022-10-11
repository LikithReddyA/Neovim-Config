local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end
local g=vim.g
-- Map <leader> to space
g.mapleader = ' '
g.maplocalleader = ' '

-- Quit neovim
map('n', '<C-Q>', '<CMD>q<CR>')

-- Move to the next/previous buffer
map('n', '<leader>[', '<CMD>bp<CR>')
map('n', '<leader>]', '<CMD>bn<CR>')

-- Move line up and down in NORMAL and VISUAL modes
-- Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
map('n', '<C-j>', '<CMD>move .+1<CR>')
map('n', '<C-k>', '<CMD>move .-2<CR>')
map('x', '<C-j>', ":move '>+1<CR>gv=gv")
map('x', '<C-k>', ":move '<-2<CR>gv=gv")

-- Split Navigation
map('n', '<C-J>', '<C-W><C-J>')
map('n', '<C-K>', '<C-W><C-K>')
map('n', '<C-L>', '<C-W><C-L>')
map('n', '<C-H>', '<C-W><C-H>')

-- Split resize
map('n', '<C-Left>',':vertical resize +3<CR>')
map('n', '<C-Right>',':vertical resize -3<CR>')
map('n', '<C-Up>',':resize +3<CR>')
map('n', '<C-Down>',':resize -3<CR>')

-- Key mappings to run python and c++ programs
map('n', '<F7>', '<ESC>:w <CR> :!python3 % < input.txt > output.txt <CR>')
map('n', '<F8>', '<ESC>:w <CR> :!g++ -o %< % && ./%< < input.txt > output.txt <CR>')

-- Key binding to launch code file, input file and output file in split mode
map('n', '<F4>', ':e code.cpp <bar> :vsplit input.txt <bar> :split output.txt <bar> :vertical resize 20 <bar> :wincmd h <CR>')

-- Key mappings for shifting a selected block in visual mode
map('v', '>', '>gv')
map('v', '<', '<gv')

-- Key mapping for nvim toggle
map('n', '<leader>b', ':NvimTreeToggle<CR>')
