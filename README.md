# Neovim Configuration Guide

Your Neovim config has been fully updated to a modern, modular Lua configuration using `lazy.nvim` as the plugin manager. It is optimized for speed, aesthetics, and modern web & system development (JS/TS/JSX/TSX, Rust, JSON, YAML, Docker).

---

## 📥 Installation & Setup

To clone and install this Neovim configuration on a new machine or reset your environment, follow these steps:

### 1. Back up your existing Neovim files (Optional)
If you already have a Neovim setup, back up your current configuration and state files to avoid conflicts:
```bash
# Backup configuration
mv ~/.config/nvim ~/.config/nvim.bak

# Backup state, data, and cache
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

### 2. Clone the configuration
Clone your Neovim configuration repository directly into `~/.config/nvim`:
```bash
git clone <your-repo-url> ~/.config/nvim
```
*(Replace `<your-repo-url>` with your configuration's Git repository link, e.g. a private/public GitHub repository.)*

### 3. Install plugins automatically
Open Neovim:
```bash
nvim
```
On startup, `lazy.nvim` will automatically bootstrap itself and begin downloading and setting up all the defined plugins (including treesitter, LSP servers via Mason, fuzzy finder, file explorer, etc.).

Once the installation finishes, exit (`:qa`) and restart Neovim to ensure everything initializes correctly.

> [!IMPORTANT]
> **Prerequisite for Neovim 0.12+ (Treesitter CLI)**:
> Since this configuration tracks the `main` branch of `nvim-treesitter` to maintain compatibility with Neovim 0.12+, you **must** have the `tree-sitter` command-line tool installed on your system to compile language parsers.
>
> On macOS, install it via Homebrew:
> ```bash
> brew install tree-sitter-cli
> ```
> *(Note: Do not install `tree-sitter` via npm, and do not use the standard `tree-sitter` Homebrew formula directly as it now packages only the library; use `tree-sitter-cli` to get the executable tool).*

---

## 📂 Configuration Directory Structure

The setup is organized into modular files located in your home config directory (`~/.config/nvim/`):

*   **[init.lua](file:///Users/ricardo/.config/nvim/init.lua)**: Main entry point. Bootstraps `lazy.nvim` and silences legacy plugin deprecation warnings.
*   **[lua/config/options.lua](file:///Users/ricardo/.config/nvim/lua/config/options.lua)**: Basic Neovim settings (line numbers, search, relative numbering, cursor highlights, clipboard sync).
*   **[lua/config/keymaps.lua](file:///Users/ricardo/.config/nvim/lua/config/keymaps.lua)**: Editor keybindings (splits, window navigation, tabs, toggle file explorer).
*   **[lua/config/lazy.lua](file:///Users/ricardo/.config/nvim/lua/config/lazy.lua)**: Boots the lazy plugin loader.
*   **`lua/plugins/`**: Individual plugin configurations:
    *   **[colorscheme.lua](file:///Users/ricardo/.config/nvim/lua/plugins/colorscheme.lua)**: Premium Catppuccin Mocha theme.
    *   **[neotree.lua](file:///Users/ricardo/.config/nvim/lua/plugins/neotree.lua)**: Modern file explorer (bound to `<Leader>e`).
    *   **[fern.lua](file:///Users/ricardo/.config/nvim/lua/plugins/fern.lua)**: Alternative project drawer file explorer (bound to `<Leader>fn`).
    *   **[dirbuf.lua](file:///Users/ricardo/.config/nvim/lua/plugins/dirbuf.lua)**: Directory buffer editor for managing files like text (bound to `<Leader>db`).
    *   **[telescope.lua](file:///Users/ricardo/.config/nvim/lua/plugins/telescope.lua)**: Advanced fuzzy finder for file search and text search.
    *   **[treesitter.lua](file:///Users/ricardo/.config/nvim/lua/plugins/treesitter.lua)**: Syntax highlighting and incremental selection/code-folding.
    *   **[lsp.lua](file:///Users/ricardo/.config/nvim/lua/plugins/lsp.lua)**: Configuration for Language Servers (LSPs).
    *   **[cmp.lua](file:///Users/ricardo/.config/nvim/lua/plugins/cmp.lua)**: Autocompletion engines and sources.
    *   **[autopairs.lua](file:///Users/ricardo/.config/nvim/lua/plugins/autopairs.lua)**: Automatic bracket and quote closer.
    *   **[comment.lua](file:///Users/ricardo/.config/nvim/lua/plugins/comment.lua)**: Easy commenting utility.
    *   **[surround.lua](file:///Users/ricardo/.config/nvim/lua/plugins/surround.lua)**: Add/change/delete parentheses/quotes/tags surrounding code.
    *   **[flash.lua](file:///Users/ricardo/.config/nvim/lua/plugins/flash.lua)**: Lightning-fast code navigation and character motions.
    *   **[sleuth.lua](file:///Users/ricardo/.config/nvim/lua/plugins/sleuth.lua)**: Automatically detects and sets indentation style (tabs/spaces, width).
    *   **[neoformat.lua](file:///Users/ricardo/.config/nvim/lua/plugins/neoformat.lua)**: Formatter runner for external code formatters (bound to `<Leader>nf`).
    *   **[fugitive.lua](file:///Users/ricardo/.config/nvim/lua/plugins/fugitive.lua)**: Premier Git integration inside Neovim.
    *   **[lualine.lua](file:///Users/ricardo/.config/nvim/lua/plugins/lualine.lua)**: Catppuccin-themed status line.
    *   **[gitsigns.lua](file:///Users/ricardo/.config/nvim/lua/plugins/gitsigns.lua)**: Inline git diff indicators in the gutter.
    *   **[bufferline.lua](file:///Users/ricardo/.config/nvim/lua/plugins/bufferline.lua)**: Displays open buffers as visual tabs at the top of the editor.
    *   **[markdown.lua](file:///Users/ricardo/.config/nvim/lua/plugins/markdown.lua)**: Installs render-markdown.nvim for inline rich parsing, and markdown-preview.nvim for full HTML browser preview.
    *   **[obsidian.lua](file:///Users/ricardo/.config/nvim/lua/plugins/obsidian.lua)**: Integrates Neovim with your Obsidian vault at ~/Documents/my_brain.

---

## ⌨️ Useful Keybindings

### 1. General & Navigation
*   `Space` is set as your `<Leader>` key.
*   `<Leader>nh`: Clear search highlighting.
*   `<Ctrl-h>` / `<Ctrl-j>` / `<Ctrl-k>` / `<Ctrl-l>`: Move cursor between split windows.
*   `<Ctrl-Up/Down/Left/Right>`: Resize split windows.
*   `<Shift-h>` / `<Shift-l>`: Go to previous / next buffer tab.
*   `<Leader>bd`: Close current buffer.

### 2. File Navigation & Search
*   **`<Leader>e`**: Toggle Neo-tree File Explorer (replaces old NERDTree).
*   **`<Leader>fn`**: Toggle Fern Drawer File Explorer.
*   **`<Leader>db`**: Open Dirbuf directory editor buffer.
*   **`<Leader>ff`**: Search files by name (Fuzzy Finder).
*   **`<Leader>fg`**: Find text across all files (Live Grep / Ripgrep).
*   **`<Leader>fb`**: List open buffers.
*   **`<Leader>fh`**: Search Neovim help documentation.

### 3. Code Editing
*   **`gcc`**: Toggle line comment.
*   **`gc`**: Toggle selection comment (Visual mode).
*   **`<Tab>` / `<Shift-Tab>` / `<Ctrl-j>` / `<Ctrl-k>`**: Navigate autocomplete menu.
*   **`<CR>` (Enter)**: Confirm completion selection.
*   **`<Leader>mp`**: Toggle Markdown Preview in the browser.
*   **`<Leader>nf`**: Run Neoformat on current file/selection.

### 4. LSP Keybindings (Active when editing code)
*   **`gd`**: Go to definition.
*   **`gD`**: Go to declaration.
*   **`gi`**: Go to implementation.
*   **`gr`**: Show all code references (using Telescope).
*   **`K`**: Open documentation popup (Hover details).
*   **`<Leader>rn`**: Rename symbol project-wide.
*   **`<Leader>ca`**: Open LSP code actions.
*   **`[d` / `]d`**: Go to previous / next diagnostic warning/error.
*   **`<Leader>d`**: Open diagnostic detail float (popup).

### 5. Obsidian Note-Taking (Active when opening markdown files in vault)
*   **`gf`**: Follow a link to another note under your cursor.
*   **`<Leader>ch`**: Toggle checkbox markdown lists (e.g. `- [ ]` -> `- [x]`).

### 6. Git Operations (Fugitive)
*   **`<Leader>gs`**: Run `:Git` to show interactive Git status dashboard.
*   **`<Leader>gd`**: Run `:Gdiffsplit` to view changes side-by-side.
*   **`<Leader>gp`**: Run `:Git push` to push to the remote repository.
*   **`<Leader>gl`**: Run `:Git log` to view git commit history.

### 7. Jump Motion & Surrounds (Flash & nvim-surround)
*   **`s`**: Activate Flash jump (type characters to highlight match labels across the screen).
*   **`S`**: Activate Flash treesitter selection.
*   **`ys{motion}{char}`**: Add surrounding `char` around target `motion` (e.g. `ysiw"` wraps the inner word in double quotes).
*   **`ds{char}`**: Delete surrounding `char` (e.g. `ds"` removes surrounding double quotes).
*   **`cs{old}{new}`**: Change surrounding `old` character to `new` character (e.g. `cs"'` converts double quotes to single quotes).


---

## 🚀 Installed Language Servers (LSPs)

The following servers have been downloaded via Mason and configured to launch automatically:

1.  **Javascript, TypeScript, TSX, JSX**: `ts_ls` (TypeScript Language Server)
2.  **Rust**: `rust_analyzer`
3.  **JSON**: `jsonls`
4.  **YAML**: `yamlls`
5.  **Docker**: `dockerls`

---

## 📓 Useful Obsidian Commands

When editing files in your vault, you can use these custom commands:

*   **`:ObsidianNew`**: Create a new note in your vault.
*   **`:ObsidianQuickSwitch`**: Quick switcher to find and open another note.
*   **`:ObsidianSearch`**: Search for text across all notes in the vault using ripgrep.
*   **`:ObsidianToday`**: Create/open today's daily note.
*   **`:ObsidianYesterday`**: Create/open yesterday's daily note.
*   **`:ObsidianTomorrow`**: Create/open tomorrow's daily note.
*   **`:ObsidianLink`**: Link visual selection to an existing note.
*   **`:ObsidianLinkNew`**: Create a new note and link visual selection to it.
