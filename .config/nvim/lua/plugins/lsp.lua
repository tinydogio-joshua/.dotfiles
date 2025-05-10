return {
	{
		"neovim/nvim-lspconfig",
	},
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"mason-org/mason.nvim",
		},
		opts = {
			ensure_installed = {
				"bashls",
				"cssls",
				"css_variables",
				"dockerls",
				"eslint",
				"emmet_language_server",
				"gopls",
				"html",
				"jsonls",
				"lua_ls",
				"marksman",
				"rust_analyzer",
				"taplo",
				"ts_ls",
				"yamlls",
			},
		},
	},
}
