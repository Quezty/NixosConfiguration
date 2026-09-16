-- Neovim 0.11+ autoloads this from `lsp/` on the runtimepath.
-- Binaries come from the Nix nvim wrapper's PATH, so bare names resolve.
-- capabilities/settings are merged on top by lua/plugins/lsp.lua.
return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = {
    ".luarc.json",
    ".luarc.jsonc",
    ".luacheckrc",
    ".stylua.toml",
    "stylua.toml",
    "selene.toml",
    "selene.yml",
    ".git",
  },
}
