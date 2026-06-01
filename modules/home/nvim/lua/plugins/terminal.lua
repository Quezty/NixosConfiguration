return {
  "akinsho/toggleterm.nvim",
  keys = {
    { "<leader>tn", "<cmd>ToggleTerm direction=float<cr>", desc = "New floating terminal" },
    { "<leader>to", "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle floating terminal" },
  },
  opts = {
    size = 30,
    float_opts = {
      width = 130,
      height = 30,
      border = "curved",
    },
    direction = "float",
    autochdir = true,
    close_on_exit = true,
  },
}
