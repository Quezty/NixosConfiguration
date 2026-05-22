return {
	-- Status line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
		opts = {},
	},

	-- Buffer line
	{
		"akinsho/bufferline.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
		opts = {},
	},

	-- Dashboard
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		config = function()
			require("alpha").setup(require("alpha.themes.dashboard").config)
		end,
	},

	-- Fancy UI
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		opts = {},
	},

	-- Notifications
	{
		"rcarriga/nvim-notify",
		opts = {
			timeout = 450,
			top_down = true,
			fps = 60,
			background_colour = "#000000",
		},
	},

	-- Discord presence
	{
		"IogaMaster/neocord",
		event = "VeryLazy",
		opts = {},
	},

	-- Illuminate word under cursor
	{
		"RRethy/vim-illuminate",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			filetypes_denylist = { "Outline", "TelescopePrompt", "alpha", "harpoon", "reason" },
		},
		config = function(_, opts)
			require("illuminate").configure(opts)
		end,
	},
}
