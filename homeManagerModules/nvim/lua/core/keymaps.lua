local map = vim.keymap.set

-- Buffer navigation
map("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<S-Tab>", "<cmd>bprev<cr>", { desc = "Previous buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<S-h>", "<cmd>bprev<cr>", { desc = "Previous buffer" })
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete buffer" })
map("n", "<leader>ba", "<cmd>bufdo bdelete<cr>", { desc = "Delete all buffers" })

-- Dismiss notifications
map("n", "<leader>un", function()
  require("notify").dismiss({ silent = true, pending = true })
end, { desc = "Dismiss notifications" })

-- Add bash shebang
map("n", "<leader>bs", function()
  local ft = vim.bo.filetype
  if ft == "bash" or ft == "sh" then
    vim.api.nvim_buf_set_lines(0, 0, 0, false, { "#!/usr/bin/env bash" })
  end
end, { desc = "Add bash shebang" })

-- Toggle line numbers and diagnostics
local lines_visible = true
map("n", "<leader>ld", function()
  lines_visible = not lines_visible
  if lines_visible then
    vim.opt.number = true
    vim.opt.relativenumber = true
    vim.diagnostic.show()
    vim.notify("Lines and diagnostics shown", vim.log.levels.INFO)
  else
    vim.opt.number = false
    vim.opt.relativenumber = false
    vim.diagnostic.hide()
    vim.notify("Lines and diagnostics hidden", vim.log.levels.INFO)
  end
end, { desc = "Toggle lines and diagnostics" })
