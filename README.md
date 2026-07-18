# Neovim Configuration

A lightweight, modular Neovim configuration built around Neovim's native APIs and modern plugin ecosystem.

## Philosophy

* Minimal dependencies
* Modular configuration
* Native Neovim features wherever possible
* Fast startup
* Well-commented, maintainable Lua code
* Project-specific tooling over editor-specific configuration

---

# Design Goals

This configuration intentionally avoids large framework plugins and language manager plugins where Neovim already provides native functionality.

Examples:

* Package management via `vim.pack`
* LSP via `vim.lsp.config()` and `vim.lsp.enable()`
* Formatting via `vim.lsp.buf.format()`
* Diagnostics via Neovim's built-in diagnostic API

External plugins are only used when they provide functionality beyond Neovim itself, such as Flutter development, fuzzy finding, snippets, and completion.

---

# Requirements

## Core

* Neovim 0.11+
* Git
* Nerd Font

## CLI Tools

* ripgrep (`rg`)
* fd
* fzf

## Language Servers

* Lua Language Server (`lua_ls`)
* BasedPyright
* Ruff
* Clangd

## Optional

* Flutter SDK (for Flutter development)

---

# Installation (macOS)

## Install Core Dependencies

```bash
brew install git ripgrep fd fzf tree-sitter-cli
```

## Install Lua Language Server

```bash
brew install lua-language-server
```

## Install Python Tools

Install BasedPyright (requires Node.js):

```bash
brew install node
npm install -g basedpyright
```

Install Ruff:

```bash
brew install ruff
```

Alternatively:

```bash
brew install uv
uv tool install ruff
```

## Install C/C++

```bash
brew install llvm
```

Add LLVM to your PATH:

```bash
echo 'export PATH="/opt/homebrew/opt/llvm/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

Verify:

```bash
clangd --version
clang-format --version
```

## Flutter

Install Flutter following the official installation guide.

Ensure these commands are available:

```bash
flutter --version
dart --version
```

## Install Web Development Language Servers

Install all frontend language servers:

```bash
npm install -g \
    typescript \
    typescript-language-server \
    vscode-langservers-extracted \
    emmet-language-server \
    @tailwindcss/language-server \
    yaml-language-server
```

Verify:

```bash
typescript-language-server --version
vscode-html-language-server --version
vscode-css-language-server --version
vscode-json-language-server --version
emmet-language-server --version
tailwindcss-language-server --version
yaml-language-server --version
```

> `vscode-langservers-extracted` installs:
>
> - HTML Language Server
> - CSS Language Server
> - JSON Language Server
> - ESLint Language Server

---

# Features

* Native package manager (`vim.pack`)
* Native LSP configuration (`vim.lsp.config` / `vim.lsp.enable`)
* Native formatting via `vim.lsp.buf.format()`
* Tree-sitter syntax highlighting
* Blink completion
* LuaSnip snippets
* FZF-Lua fuzzy finder
* Mini.nvim utilities
* NvimTree file explorer
* Flutter development support
* Git integration via Gitsigns
* Custom statusline
* Custom tabline
* Custom statuscolumn
* Custom buffer utilities

---

## Supported Languages

| Language       | Language Server         | Formatter           |
| -------------- | ----------------------- | ------------------- |
| Lua            | `lua_ls`                | `lua_ls` / `stylua` |
| Python         | `basedpyright`          | `ruff`              |
| C              | `clangd`                | `clang-format`      |
| C++            | `clangd`                | `clang-format`      |
| JavaScript     | `ts_ls`                 | Prettier / Biome    |
| TypeScript     | `ts_ls`                 | Prettier / Biome    |
| HTML           | `html`                  | Prettier            |
| CSS            | `cssls`                 | Prettier            |
| SCSS           | `cssls`                 | Prettier            |
| LESS           | `cssls`                 | Prettier            |
| JSON           | `jsonls`                | Prettier            |
| YAML           | `yamlls`                | Prettier            |
| Tailwind CSS   | `tailwindcss`           | —                   |
| Emmet          | `emmet_language_server` | —                   |
| Dart / Flutter | `flutter-tools.nvim`    | `dart format`       |


---

# Project Structure

```text
.
├── init.lua
├── lsp/
│   ├── basedpyright.lua
│   ├── clangd.lua
│   ├── lua_ls.lua
│   └── ruff.lua
└── lua/
    ├── config/          # Core configuration
    ├── plugins/         # Plugin setup
    ├── snippets/        # LuaSnip snippets
    ├── ui/              # Statusline, tabline, highlights
    └── utils/           # Shared helper modules
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

| Key          | Action       |
| ------------ | ------------ |
| `<leader>to` | New tab      |
| `<leader>tx` | Close tab    |
| `<leader>tn` | Next tab     |
| `<leader>tp` | Previous tab |

---

## LSP

| Key          | Action                |
| ------------ | --------------------- |
| `gd`         | Go to definition      |
| `gD`         | Go to declaration     |
| `gr`         | References            |
| `gi`         | Go to implementation  |
| `gt`         | Go to type definition |
| `K`          | Hover documentation   |
| `gl`         | Line diagnostics      |
| `<leader>ca` | Code actions          |
| `<leader>rn` | Rename symbol         |
| `<leader>cf` | Format document       |
| `<leader>ds` | Document symbols      |
| `<leader>ws` | Workspace symbols     |
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

# Plugins

* blink.cmp
* LuaSnip
* nvim-treesitter
* fzf-lua
* mini.nvim
* nvim-tree.lua
* flutter-tools.nvim
* gitsigns.nvim
* catppuccin

