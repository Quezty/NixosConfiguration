-- Binary is `haskell-language-server-wrapper`; it picks the GHC-matched
-- server itself. No `*.cabal` root marker: root_markers matches exact
-- filenames, not globs.
return {
  cmd = { "haskell-language-server-wrapper", "--lsp" },
  filetypes = { "haskell", "lhaskell" },
  root_markers = {
    "hie.yaml",
    "stack.yaml",
    "cabal.project",
    "package.yaml",
    ".git",
  },
  settings = {
    haskell = {
      formattingProvider = "ormolu",
      checkProject = true,
    },
  },
}
