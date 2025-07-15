return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")

		config.setup({
			ensure_installed = {
				"css",
				"go",
				"html",
				"java",
				"javascript",
				"json",
				"kotlin",
				"lua",
				"python",
				"query",
				"typescript",
				"vim",
				"vimdoc",
				"xml",
				"yaml",
			},
			auto_instll = true,
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
