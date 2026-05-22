return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
    },
  },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<leader>fw", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
    { "<leader>fg", "<cmd>Telescope git_commits<cr>", desc = "Git commits" },
    { "<leader>fh", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
    { "<leader>ch", "<cmd>Telescope colorscheme<cr>", desc = "Colorschemes" },
    { "<leader>fm", "<cmd>Telescope man_pages<cr>", desc = "Man pages" },
  },
  config = function()
    require("telescope").setup({})
    pcall(function()
      require("telescope").load_extension("fzf")
    end)
  end,
}
