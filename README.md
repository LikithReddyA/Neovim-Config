# Neovim Configuration

A lightweight, modular Neovim configuration built entirely on Neovim's native APIs.

## Philosophy

* Minimal dependencies
* Modular configuration
* Native Neovim features wherever possible
* Fast startup
* Well-commented, maintainable Lua code

## Requirements

* Neovim 0.11+
* Git
* Nerd Font
* Ripgrep (`rg`)
* fd
* fzf

## Features

* Native package manager (`vim.pack`)
* Built-in LSP configuration
* Tree-sitter syntax highlighting
* Blink completion
* LuaSnip snippets
* FZF-Lua fuzzy finder
* NvimTree file explorer
* Flutter development support
* Git integration via Gitsigns
* Custom statusline, tabline and statuscolumn
* Custom buffer utilities

## Project Structure

```text
lua/
├── config/          # Core configuration
├── plugins/         # Plugin setup
├── ui/              # Statusline, tabline, highlights
├── utils/           # Reusable helper modules
└── snippets/        # Custom LuaSnip snippets
```

---

# Keymaps

Leader key: `<Space>`

## Files

| Key          | Action                 |
| ------------ | ---------------------- |
| `<leader>ff` | Find files             |
| `<leader>fg` | Find files in Git root |
| `<leader>fs` | Live grep              |
| `<leader>fc` | Search Neovim config   |
| `<leader>fb` | Open buffers           |
| `<leader>fh` | Help tags              |
| `<leader>fk` | Keymaps                |
| `<leader>fp` | Copy current file path |

---

## Explorer

| Key         | Action                            |
| ----------- | --------------------------------- |
| `-`         | Open Mini Files                   |
| `<leader>-` | Reveal current file in Mini Files |
| `<leader>e` | Toggle NvimTree                   |
| `<leader>o` | Reveal current file in NvimTree   |

---

## Buffers

| Key          | Action                     |
| ------------ | -------------------------- |
| `<S-h>`      | Previous buffer            |
| `<S-l>`      | Next buffer                |
| `<leader>bd` | Close current buffer       |
| `<leader>bo` | Close other buffers        |
| `<leader>bh` | Close buffers to the left  |
| `<leader>bl` | Close buffers to the right |

---

## Windows

| Key          | Action           |
| ------------ | ---------------- |
| `<leader>sv` | Vertical split   |
| `<leader>sh` | Horizontal split |
| `<leader>s=` | Equalize splits  |
| `<leader>sx` | Close split      |
| `<C-h>`      | Move left        |
| `<C-j>`      | Move down        |
| `<C-k>`      | Move up          |
| `<C-l>`      | Move right       |

---

## Tabs

| Key          | Action                         |
| ------------ | ------------------------------ |
| `<leader>to` | New tab                        |
| `<leader>tx` | Close tab                      |
| `<leader>tn` | Next tab                       |
| `<leader>tp` | Previous tab                   |

---

## LSP

| Key          | Action                |
| ------------ | --------------------- |
| `gd`         | Go to definition      |
| `gr`         | References            |
| `gi`         | Implementations       |
| `K`          | Hover                 |
| `gl`         | Line diagnostics      |
| `<leader>ca` | Code actions          |
| `<leader>rn` | Rename symbol         |
| `<leader>cf` | Format document       |
| `<leader>ds` | Document symbols      |
| `<leader>ws` | Workspace symbols     |
| `<leader>dd` | Document diagnostics  |
| `<leader>dD` | Workspace diagnostics |
| `<C-k>`      | Signature help        |

---

## Flutter

| Key           | Action         |
| ------------- | -------------- |
| `<leader>fr`  | Run            |
| `<leader>fq`  | Quit           |
| `<leader>fd`  | Devices        |
| `<leader>fo`  | Toggle Outline |
| `<leader>fl`  | Toggle Logs    |
| `<leader>fe`  | Emulators      |
| `<leader>frr` | Hot Reload     |
| `<leader>frR` | Hot Restart    |

---

## Editing

| Key            | Action                             |
| -------------- | ---------------------------------- |
| `<leader>d`    | Delete without yanking             |
| `x`            | Delete character without yanking   |
| `p` (Visual)   | Paste without overwriting register |
| `J`            | Join lines                         |
| `J/K` (Visual) | Move selected lines                |
| `<` / `>`      | Keep selection while indenting     |
| `<leader>s`    | Replace word under cursor          |
| `<leader>X`    | Make current file executable       |

---

## Navigation

| Key     | Action                                 |
| ------- | -------------------------------------- |
| `<C-d>` | Half-page down (center cursor)         |
| `<C-u>` | Half-page up (center cursor)           |
| `n`     | Next search result (center cursor)     |
| `N`     | Previous search result (center cursor) |

---

## Utilities

| Key          | Action                  |
| ------------ | ----------------------- |
| `<leader>yd` | Copy diagnostic message |
| `<leader>lr` | Restart LSP             |
| `<leader>re` | Restart Neovim          |

---

## Plugins

* blink.cmp
* LuaSnip
* nvim-treesitter
* fzf-lua
* mini.nvim
* nvim-tree
* flutter-tools.nvim
* gitsigns.nvim
* catppuccin

---
