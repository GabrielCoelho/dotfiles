-- ~/.config/nvim/lua/config/conform.lua
local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		-- Web development
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		markdown = { "markdownlint" },

		-- Programming languages
		lua = { "stylua" }, -- stylua como FORMATADOR, não LSP
		c = { "clang_format" },
		cpp = { "clang_format" },
		rust = { "rustfmt" }, -- rustfmt é mais apropriado que ast_grep para Rust
		python = { "black" },

		-- Outros
		sql = { "sql_formatter" },
		xml = { "xmlformatter" },
	},

	format_on_save = {
		-- Usar LSP como fallback se o formatador não estiver disponível
		lsp_fallback = true,
		async = false,
		timeout_ms = 6000,
	},

	-- Configurações específicas de formatadores
	formatters = {
		stylua = {
			-- stylua deve ser usado apenas como formatador
			-- Não tentar usar como LSP server
			prepend_args = { "--indent-type", "Tabs" },
		},
		prettier = {
			-- Configurações específicas do prettier se necessário
			prepend_args = { "--single-quote", "--trailing-comma", "es5" },
		},
	},
})

-- Mapear formatação manual (mantendo seu padrão atual)
vim.keymap.set({ "n", "v" }, "<leader>sm", function()
	conform.format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 6000,
	})
end, { desc = "Format file or range (in visual mode)" })

-- Verificar se stylua está instalado para formatação
if vim.fn.executable("stylua") ~= 1 then
	vim.notify("stylua não encontrado. Instale com: yay -S stylua", vim.log.levels.WARN)
end
