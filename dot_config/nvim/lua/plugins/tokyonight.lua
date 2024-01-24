return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	enabled = false,
	opts = {
		style = "storm",
	},
	init = function()
		vim.o.background = "dark"
		vim.cmd.colorscheme("tokyonight")
	end,
}
