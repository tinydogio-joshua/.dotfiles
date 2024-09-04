return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")

		config.setup({
			ensure_installed = {
				"c",
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
				"rust",
				"typescript",
				"vim",
				"vimdoc",
				"yaml",
			},
			auto_instll = true,
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
