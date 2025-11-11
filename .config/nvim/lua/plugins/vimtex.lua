return {
	"lervag/vimtex",
	lazy = false,
	init = function()
		-- Usar Zathura como visualizador
		vim.g.vimtex_view_method = "zathura"

		-- Compilar com latexmk
		vim.g.vimtex_compiler_method = "latexmk"

		-- Opções de compilação
		vim.g.vimtex_compiler_latexmk = {
			build_dir = "",
			callback = 1,
			continuous = 1,
			executable = "latexmk",
			options = {
				"-pdf",
				"-verbose",
				"-file-line-error",
				"-synctex=1",
				"-interaction=nonstopmode",
			},
		}

		-- Desabilitar mapeamentos padrão que conflitam
		vim.g.vimtex_mappings_enabled = 0

		-- Quickfix automático
		vim.g.vimtex_quickfix_mode = 2
	end,
}
