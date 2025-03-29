return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("config.mason")
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"html",
					"cssls",
					"eslint",
					"pyright",
					"rust_analyzer",
					"jdtls",
					"clangd",
					"yamlls",
				},
			})
		end,
	},
}
