return {
	"renerocksai/telekasten.nvim",
	dependencies = { "nvim-telescope/telescope.nvim", "renerocksai/calendar-vim" },
	opts = {
		dailies = vim.fn.expand("~/Notes/daily"),
		templates = vim.fn.expand("~/Notes/templates"),
		home = vim.fn.expand("~/Notes"),
		template_new_note = vim.fn.expand("~/Notes/templates/note.md"),
		template_new_daily = vim.fn.expand("~/Notes/templates/daily.md"),
	},
}
