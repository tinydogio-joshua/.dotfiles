return {
	-- Mason: Install Language Servers
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	-- Mason LSP Config
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		config = function()
			local lspconfig = require("lspconfig")

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

			require("mason-lspconfig").setup_handlers({
				function(server)
					lspconfig[server].setup({})
				end,
			})
		end,
	},

	-- LSP Config
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set({ "n" }, "<leader>rn", vim.lsp.buf.rename, {})
		end,
	},
}
