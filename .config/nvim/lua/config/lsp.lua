local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

-- Configuração global para servidores LSP
local on_attach = function(client, bufnr)
	-- Funcionalidade adicionada em autocmds.lua
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Configuração básica para servidores LSP
local servers = {
	"html",
	"cssls",
	"eslint",
	"ts_ls",
	"lemminx",
	"pyright",
	"yamlls",
	"marksman",
	"sqlls",
}

-- Configuração padrão para servidores LSP
for _, lsp in ipairs(servers) do
	if lsp ~= "jdtls" then
		lspconfig[lsp].setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
	end
end

-- Configurações específicas para alguns servidores LSP

-- Lua language server
lspconfig.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})

-- Rust Analyzer
lspconfig.rust_analyzer.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "rust" },
	root_dir = util.root_pattern("Cargo.toml"),
	settings = {
		["rust-analyzer"] = {
			cargo = {
				allFeatures = true,
			},
		},
	},
})

-- Clangd para C/C++
lspconfig.clangd.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
