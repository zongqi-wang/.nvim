# Ced's Neovim Config

Personal Neovim config for macOS, built on `lazy.nvim` with LSP, Treesitter,
Blink completion, Neo-tree, fzf-lua, Harpoon, ToggleTerm, Catppuccin, and
language support for Zig, Rust, Go, TypeScript, Lua, and Ruby.
Blink uses Neovim's built-in `vim.snippet` engine for LSP snippets.

## Install

Clone this repo into Neovim's config path:

```sh
git clone git@github.com:zongqi-wang/.nvim.git ~/.config/nvim
```

If `~/.config/nvim` already exists, back it up first:

```sh
mv ~/.config/nvim ~/.config/nvim.backup
git clone git@github.com:zongqi-wang/.nvim.git ~/.config/nvim
```

## System Dependencies

Install the core tools with Homebrew:

```sh
brew install neovim git make unzip ripgrep fd fzf wget tree-sitter-cli
```

Install language toolchains used by this config:

```sh
brew install go rust ruby zig
```

Install Node.js with your preferred manager. With Homebrew:

```sh
brew install node
```

If you use `nvm`, install and select a current Node instead:

```sh
nvm install --lts
nvm use --lts
```

Use a Nerd Font in your terminal so icons render correctly.

## Provider Hosts

These clear the optional Neovim provider health warnings for Node, Python, and
Ruby:

```sh
npm install -g neovim
python3 -m pip install --user pynvim
gem install neovim
```

Perl provider is intentionally disabled in `lua/config/settings.lua`.

## Bootstrap Plugins And Tools

Start Neovim and let Lazy install plugins:

```sh
nvim
```

Inside Neovim:

```vim
:Lazy sync
:MasonToolsInstall
:TSUpdate
:checkhealth
```

Useful headless checks:

```sh
nvim --headless "+Lazy! sync" +qa
nvim --headless "+MasonToolsInstallSync" +qa
nvim --headless "+TSUpdate" +qa
nvim --headless "+checkhealth" "+qa"
```

## Installed Language Support

Mason is configured to manage:

- Lua: `lua-language-server`, `stylua`
- Zig: `zls`
- Rust: `rust-analyzer`
- Go: `gopls`, `gofumpt`, `goimports`
- TypeScript/JavaScript: `typescript-language-server`, `prettier`
- Ruby: `ruby-lsp`, `rubocop`

## Keymaps

Leader is space.

File and workspace search:

- `<leader><leader>` find files
- `<leader>ff` find files
- `<leader>sg` search workspace
- `<leader>fg` live grep
- `<leader>fb` find open buffers
- `<leader>fk` search keymaps

Explorer:

- `<leader>ee` toggle Neo-tree
- `<leader>ef` reveal current file
- `<leader>eg` Neo-tree git status
- `<leader>eb` Neo-tree buffers

Buffers, shown as tabs in the top bufferline:

- `<S-h>` previous buffer
- `<S-l>` next buffer
- `[b` previous buffer
- `]b` next buffer
- `<leader>1` through `<leader>9` jump to bufferline item 1-9
- `<leader>bd` delete current buffer
- `<leader>bp` pin current buffer

Real Neovim tabpages:

- `<leader><Tab>n` new tab
- `<leader><Tab>d` close tab
- `<leader><Tab>]` next tab
- `<leader><Tab>[` previous tab
- `<leader><Tab>o` close other tabs
- Built-ins still work: `gt` next tab, `gT` previous tab

Terminal:

- `<C-,>` toggle bottom terminal
- `<leader>tt` toggle bottom terminal
- `<leader>tf` toggle floating terminal
- `<Esc><Esc>` exit terminal mode

Navigation and code:

- `<C-h/j/k/l>` move between windows
- `[d` / `]d` previous/next diagnostic
- `<leader>cd` line diagnostics
- `<leader>cq` diagnostics quickfix
- `<leader>j` Flash jump
- `<leader>J` Flash Treesitter jump

Harpoon:

- `<leader>ha` add current file
- `<leader>hh` open Harpoon menu
- `<leader>h1` through `<leader>h4` jump to Harpoon entries
- `<leader>hn` next Harpoon entry
- `<leader>hp` previous Harpoon entry

## Maintenance

Update plugins and tooling:

```vim
:Lazy sync
:MasonToolsUpdate
:TSUpdate
```

Run health checks after updates:

```vim
:checkhealth
```

Optional warnings for PHP, Composer, Java, Julia, or terminal image preview
tools can be ignored unless you plan to use those languages/features.
