return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = {
				"bashls",
				"cssls",
				"css_variables",
				"dockerls",
				"eslint",
				"emmet_language_server",
				"html",
				"jsonls",
				"lua_ls",
				"marksman",
				"rust_analyzer",
				"taplo",
				"ts_ls",
				"yamlls",
			},
		})

		local lspconfig = require("lspconfig")
		require("mason-lspconfig").setup_handlers({
			function(server)
				lspconfig[server].setup({})
			end,
		})

		lspconfig.eslint.setup({
			on_attach = function(_, bufnr)
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = bufnr,
					command = "EslintFixAll",
				})
			end,
		})
	end,
}
