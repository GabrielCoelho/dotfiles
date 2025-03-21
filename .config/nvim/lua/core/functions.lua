-- Funções utilitárias para o neovim

local M = {}

-- Estado de transparência
M.transparency_enabled = false

-- Lista de grupos de highlight para tornar transparentes
local transparency_groups = {
	"Normal",
	"NormalFloat",
	"NormalNC",
	"Comment",
	"Constant",
	"Special",
	"Identifier",
	"Statement",
	"PreProc",
	"Type",
	"Underlined",
	"Todo",
	"SignColumn",
	"Folded",
	"FoldColumn",
	"LineNr",
	"CursorLineNr",
	"EndOfBuffer",
	"StatusLine",
	"StatusLineNC",
	"VertSplit",
	"Pmenu",
	"PmenuSbar",
	"PmenuThumb",
	"TabLine",
	"TabLineFill",
	"TabLineSel",
	"FloatBorder",
	"WinSeparator",
}

-- Salva as cores originais dos grupos
local original_colors = {}

-- Função para tornar Neovim transparente sem depender de plugins externos
function M.toggle_transparency()
	M.transparency_enabled = not M.transparency_enabled

	if M.transparency_enabled then
		-- Salva as cores originais e ativa a transparência
		for _, group in ipairs(transparency_groups) do
			local hl = vim.api.nvim_get_hl(0, { name = group })
			original_colors[group] = hl.bg

			-- Define o background como NONE para tornar transparente
			vim.api.nvim_set_hl(0, group, { bg = "NONE" })
		end
		vim.notify("Transparência ativada", vim.log.levels.INFO)
	else
		-- Restaura as cores originais
		for group, color in pairs(original_colors) do
			-- Aplicar a cor original novamente
			vim.api.nvim_set_hl(0, group, { bg = color })
		end

		-- Como alternativa, pode-se recarregar o tema
		local colorscheme = vim.g.colors_name
		if colorscheme then
			vim.cmd("colorscheme " .. colorscheme)
		end

		vim.notify("Transparência desativada", vim.log.levels.INFO)
	end
end

-- Função para definir transparência na inicialização
function M.setup_transparency(enable)
	if enable then
		-- Inicia com transparência ativada
		M.transparency_enabled = false -- Começa com false para que o toggle torne true
		M.toggle_transparency()
	end
end

return M
