# Neovim Configuration

## Structure

```
nvim/
├── init.lua                    # Entry point — bootstraps lazy.nvim, loads everything
└── lua/
    ├── core/
    │   ├── options.lua          # Vim settings (tabs, line numbers, etc.)
    │   └── keymaps.lua          # Your custom keybindings (non-plugin)
    └── plugins/
        ├── colorscheme.lua      # Theme
        ├── lsp.lua              # Language servers
        ├── cmp.lua              # Autocompletion
        ├── telescope.lua        # Fuzzy finder
        ├── ui.lua               # Statusline, bufferline, notifications, etc.
        ├── git.lua              # Gitsigns, lazygit
        ├── editor.lua           # Oil, comments, autopairs, undotree, etc.
        ├── formatting.lua       # Auto-formatting (conform.nvim)
        ├── linting.lua          # Linting (nvim-lint)
        ├── treesitter.lua       # Syntax highlighting
        ├── terminal.lua         # Floating terminal
        ├── dap.lua              # Debugger
        └── tmux.lua             # Tmux navigation
```

## Changing the theme

Edit `plugins/colorscheme.lua`. For example, to switch to catppuccin:

```lua
return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    flavour = "mocha",
    transparent_background = true,
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin")
  end,
}
```

Or just change the rose-pine variant from `"macchiato"` to `"moon"` or `"dawn"`.

## Adding keybinds

**For general keybinds** — edit `core/keymaps.lua`:
```lua
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })
```

**For plugin-specific keybinds** — add them in that plugin's file. For example, to add a telescope keybind, edit `plugins/telescope.lua` and add to the `keys` table:
```lua
keys = {
  { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
  -- ... existing keys
},
```

## Adding a new plugin

Create a new file in `plugins/` or add to an existing one. Each file returns a lazy.nvim spec. For example, `plugins/which-key.lua`:

```lua
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {},
}
```

Lazy.nvim auto-discovers every file in the `plugins/` directory — no imports needed.

## Adding a new LSP or tool

This is the **one thing that requires a rebuild**. Edit `neovim.nix` and add the package to `extraPackages`, then add the server name to the list in `plugins/lsp.lua`.

## Changing settings

Edit `core/options.lua` — it's just `vim.opt.*` calls. For example:
```lua
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
```

## Workflow

1. Edit files in `modules/home/nvim/`
2. Rebuild (`sudo nixos-rebuild switch --flake .`)
3. Reopen neovim

Every plugin file follows the same pattern — it's just a Lua table that lazy.nvim reads. The [lazy.nvim docs](https://lazy.folke.io) are the best reference for the spec format.
