-- ~/.config/nvim/lua/config/lsp.lua
-- Configuração LSP corrigida para resolver erros do log

-- Verificar se os módulos necessários estão disponíveis
local has_cmp_lsp, cmp_lsp = pcall(require, "cmp_nvim_lsp")

-- Configuração de capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
if has_cmp_lsp then
	capabilities = cmp_lsp.default_capabilities(capabilities)
end

-- Função on_attach global
local on_attach = function(client, bufnr)
	-- Configurações específicas do buffer quando LSP se conecta
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- Mapeamentos básicos LSP
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts)

	-- Highlight do symbol sob o cursor
	if client.server_capabilities.documentHighlightProvider then
		local group = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = false })
		vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			group = group,
			buffer = bufnr,
			callback = vim.lsp.buf.document_highlight,
		})
		vim.api.nvim_create_autocmd({ "CursorMoved" }, {
			group = group,
			buffer = bufnr,
			callback = vim.lsp.buf.clear_references,
		})
	end
end

-- Configuração padrão que será usada para todos os servidores
local default_config = {
	on_attach = on_attach,
	capabilities = capabilities,
	flags = {
		debounce_text_changes = 150,
	},
}

-- Função para configurar servidores com segurança e verificação de executáveis
local function safe_config_and_enable(server_name, config)
	config = config or {}

	-- Verificar se o servidor tem um comando executável específico
	local server_cmd = config.cmd
	if server_cmd and type(server_cmd) == "table" and server_cmd[1] then
		if vim.fn.executable(server_cmd[1]) ~= 1 then
			return -- Silenciosamente não configurar se não estiver disponível
		end
	end

	-- Mesclar com configuração padrão
	local final_config = vim.tbl_deep_extend("force", default_config, config)

	-- Usar a nova API do Neovim 0.11+ (silenciosamente)
	pcall(function()
		vim.lsp.config(server_name, final_config)
		vim.lsp.enable(server_name)
	end)
end

-- Lista de servidores básicos (REMOVIDO stylua e sqlls que causavam problemas)
local basic_servers = {
	"html",
	"cssls",
	"eslint",
	"ts_ls",
	"pyright",
	"yamlls",
}

-- Configurar servidores básicos apenas se estiverem disponíveis
for _, server in ipairs(basic_servers) do
	safe_config_and_enable(server)
end

-- Configurações específicas por servidor

-- Lua Language Server (lua_ls)
safe_config_and_enable("lua_ls", {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim", "use" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
				checkThirdParty = false,
			},
			telemetry = {
				enable = false,
			},
			format = {
				enable = false, -- Desabilitamos formatação do LSP pois usaremos stylua via conform
			},
		},
	},
})

-- Rust Analyzer (apenas se disponível)
if vim.fn.executable("rust-analyzer") == 1 then
	safe_config_and_enable("rust_analyzer", {
		filetypes = { "rust" },
		settings = {
			["rust-analyzer"] = {
				cargo = {
					allFeatures = true,
					loadOutDirsFromCheck = true,
					runBuildScripts = true,
				},
				checkOnSave = {
					allFeatures = true,
					command = "clippy",
				},
				procMacro = {
					enable = true,
				},
			},
		},
	})
end

-- Clangd para C/C++ (apenas se disponível)
if vim.fn.executable("clangd") == 1 then
	safe_config_and_enable("clangd", {
		cmd = { "clangd", "--background-index" },
		filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
	})
end

-- SQL Language Server (apenas se disponível e corretamente instalado)
if vim.fn.executable("sql-language-server") == 1 then
	safe_config_and_enable("sqlls", {
		cmd = { "sql-language-server", "up", "--method", "stdio" },
		filetypes = { "sql", "mysql" },
	})
end
