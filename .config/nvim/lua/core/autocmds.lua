local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Remove espaços em branco no final das linhas ao salvar
local TrimWhiteSpaceGrp = augroup("TrimWhiteSpaceGrp", {})
autocmd("BufWritePre", {
	group = TrimWhiteSpaceGrp,
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

-- Destaque ao copiar
local YankHighlightGrp = augroup("YankHighlightGrp", {})
autocmd("TextYankPost", {
	group = YankHighlightGrp,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
	end,
})

-- Configuração LSP
local LspConfigGrp = augroup("LspConfigGrp", {})
autocmd("LspAttach", {
	group = LspConfigGrp,
	callback = function(event)
		local opts = { noremap = true, silent = true, buffer = event.buf }

		-- Mapeamentos LSP
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)
	end,
})

-- Exibe diagnósticos flutuantes ao passar o cursor
autocmd("CursorHold", {
	group = LspConfigGrp,
	pattern = "*",
	callback = function()
		vim.diagnostic.open_float(nil, { focusable = false })
	end,
})

-- Reabrir na última posição do cursor
autocmd("BufReadPost", {
	pattern = "*",
	callback = function()
		local last_pos = vim.fn.line("'\"")
		if last_pos > 0 and last_pos <= vim.fn.line("$") then
			vim.fn.setpos(".", { 0, last_pos, 1, 0 })
		end
	end,
})

-- Lint automático
local LintGrp = augroup("LintGrp", {})
autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = LintGrp,
	callback = function()
		require("lint").try_lint()
	end,
})

-- Configuração para projetos Java e Spring Boot
autocmd({ "FileType" }, {
	pattern = { "java" },
	callback = function()
		-- Carrega configurações específicas do Spring Boot se for um projeto Spring
		require("config.spring").setup()
	end,
})
