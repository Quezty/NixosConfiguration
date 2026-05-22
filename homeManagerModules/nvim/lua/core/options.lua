local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 0
opt.expandtab = true
opt.smarttab = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.gdefault = true

-- Display
opt.wrap = false
opt.cursorline = true
opt.signcolumn = "yes"
opt.ruler = true
opt.scrolloff = 5

-- System
opt.clipboard = "unnamedplus"

-- Comment highlight
vim.api.nvim_set_hl(0, "Comment", {
  fg = "#ff00ff",
  bg = "#000000",
  bold = true,
  underline = true,
})

-- Command aliases
vim.api.nvim_create_user_command("Q", "q", {})
vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("Wq", "wq", {})
vim.api.nvim_create_user_command("WQ", "wq", {})
