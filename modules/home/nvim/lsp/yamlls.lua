return {
  cmd = { "yaml-language-server", "--stdio" },
  filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab" },
  root_markers = { ".git" },
  settings = {
    yaml = {
      keyOrdering = false,
      validate = true,
      schemaStore = { enable = true, url = "https://www.schemastore.org/api/json/catalog.json" },
    },
  },
}
