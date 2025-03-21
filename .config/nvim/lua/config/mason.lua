local mason = require("mason")
local mason_registry = require("mason-registry")

-- Configuração básica do Mason
mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
		keymaps = {
			-- Teclas personalizadas para a interface do Mason
			toggle_package_expand = "<CR>",
			install_package = "i",
			update_package = "u",
			check_package_version = "c",
			update_all_packages = "U",
			check_outdated_packages = "C",
			uninstall_package = "X",
			cancel_installation = "<C-c>",
			apply_language_filter = "<C-f>",
		},
		border = "rounded",
	},
	max_concurrent_installers = 4, -- Número máximo de instalações concorrentes
	github = {
		-- Configurações de download do GitHub
		download_url_template = "https://github.com/%s/releases/download/%s/%s",
	},
	pip = {
		-- Instalador pip para pacotes Python
		upgrade_pip = true,
	},
})

-- Lista de ferramentas para instalação automática
local tools = {
	-- Formatadores
	"stylua", -- Lua
	"prettier", -- JavaScript, TypeScript, HTML, CSS, JSON
	"black", -- Python
	"clang-format", -- C/C++
	"google-java-format", -- Java
	"ast-grep", -- Diversos
	"sql-formatter", -- SQL
	"markdownlint", -- Markdown

	-- Linters
	"eslint_d", -- JavaScript, TypeScript
	"flake8", -- Python
	"cpplint", -- C/C++
	"trivy", -- Segurança

	-- DAP (Debug Adapter Protocol)
	"codelldb", -- C/C++, Rust
	"cpptools", -- C/C++
	"node-debug2-adapter", -- JavaScript, TypeScript
	"java-debug-adapter", -- Java

	-- LSP Servers - A maioria é gerenciada pelo mason-lspconfig
	"lua-language-server",
	"rust-analyzer",
	"jdtls", -- Java
	"pyright", -- Python
	"typescript-language-server",
	"html-lsp",
	"css-lsp",
	"yaml-language-server",
	"marksman", -- Markdown
}

-- Função para garantir que as ferramentas estejam instaladas
local function ensure_installed()
	for _, tool in ipairs(tools) do
		local package = mason_registry.get_package(tool)
		if not package:is_installed() then
			vim.defer_fn(function()
				vim.notify("Instalando " .. tool, vim.log.levels.INFO)
				package:install()
			end, 0)
		end
	end
end

-- Verificar se o registro está pronto e, em seguida, instalar as ferramentas
if mason_registry.refresh then
	mason_registry.refresh(function()
		ensure_installed()
	end)
else
	ensure_installed()
end

-- Configurar para verificar ferramentas não instaladas quando o Neovim iniciar
vim.api.nvim_create_autocmd("User", {
	pattern = "MasonToolsStartupDone",
	callback = function()
		local mason_tools = require("mason-tool-installer")
		if mason_tools and mason_tools.check_for_uninstalled_packages then
			mason_tools.check_for_uninstalled_packages()
		end
	end,
})
