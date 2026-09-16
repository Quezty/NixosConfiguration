-- Nix language server. Binary is `nil`, not `nil_ls`.
return {
  cmd = { "nil" },
  filetypes = { "nix" },
  root_markers = { "flake.nix", ".git" },
}
