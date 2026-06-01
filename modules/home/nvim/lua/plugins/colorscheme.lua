return {
	"rose-pine/neovim",
	name = "rose-pine",
	priority = 1000,
	opts = {
		disable_background = true,
		style = "deep",
		styles = {
			transparency = true,
		},
	},
	config = function(_, opts)
		require("rose-pine").setup(opts)
		vim.cmd.colorscheme("rose-pine")
	end,
}
