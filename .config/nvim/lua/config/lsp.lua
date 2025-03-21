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
	"tsserver",
	"eslint",
	"pyright",
	"yamlls",
	"marksman",
}

-- Configuração padrão para servidores LSP
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
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

-- Java LSP
lspconfig.jdtls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xmx1g",

		-- Configuração do Lombok
		"-javaagent:" .. vim.fn.expand("~/.local/share/nvim/mason/share/jdtls/lombok.jar"),

		-- Suprimir avisos de incubadora
		"-Djdt.ls.warn.incubator=false",

		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",

		"-jar",
		vim.fn.glob("~/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
		"-configuration",
		"~/.local/share/nvim/mason/packages/jdtls/config_linux", -- Ajuste para seu SO (linux, mac, win)
		"-data",
		"~/.cache/jdtls-workspace", -- Diretório de workspace
	},

	-- Configurações específicas para Spring Boot
	settings = {
		java = {
			configuration = {
				updateBuildConfiguration = "automatic",
			},
			maven = {
				downloadSources = true,
			},
			implementationsCodeLens = {
				enabled = true,
			},
			referencesCodeLens = {
				enabled = true,
			},
			format = {
				enabled = true,
			},
			signatureHelp = {
				enabled = true,
			},
			contentProvider = {
				preferred = "fernflower",
			},
			import = {
				maven = {
					enabled = true,
				},
				gradle = {
					enabled = true,
				},
			},
			completion = {
				favoriteStaticMembers = {
					"org.junit.Assert.*",
					"org.junit.Assume.*",
					"org.junit.jupiter.api.Assertions.*",
					"org.junit.jupiter.api.Assumptions.*",
					"org.junit.jupiter.api.DynamicContainer.*",
					"org.junit.jupiter.api.DynamicTest.*",
					"org.mockito.Mockito.*",
					"org.mockito.ArgumentMatchers.*",
					"org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*",
					"org.springframework.test.web.servlet.result.MockMvcResultMatchers.*",
				},
				importOrder = {
					"java",
					"javax",
					"com",
					"org",
				},
			},
		},
	},
})
