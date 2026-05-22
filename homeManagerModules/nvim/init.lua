-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Set leader before lazy
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Load core config
require("core.options")
require("core.keymaps")

-- Load plugins
require("lazy").setup("plugins", {
  change_detection = { notify = false },
  concurrency = 1,
  git = {
    filter = false,
  },
})
