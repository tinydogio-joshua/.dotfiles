return {
	"sainnhe/everforest",
	config = function()
		vim.opt.termguicolors = true
		vim.g.everforest_background = "soft"
		vim.g.everforest_disable_italic_comment = true
		vim.cmd.colorscheme("everforest")
	end,
}
