require("oil").setup({
	-- Oil assumirá buffers de diretório (e.g. `vim .` ou `:e src/`)
	default_file_explorer = true,
	-- Id é adicionado automaticamente no início e o nome no final
	columns = {
		"mtime",
		"ctime",
		"icon",
	},
	-- Opções específicas do buffer para buffers oil
	buf_options = {
		buflisted = false,
		bufhidden = "hide",
	},
	-- Opções específicas da janela para buffers oil
	win_options = {
		wrap = false,
		signcolumn = "no",
		cursorcolumn = false,
		foldcolumn = "0",
		spell = false,
		list = false,
		conceallevel = 3,
		concealcursor = "nvic",
	},
	-- Enviar arquivos excluídos para a lixeira em vez de excluí-los permanentemente
	delete_to_trash = false,
	-- Ignorar a janela de confirmação para operações simples
	skip_confirm_for_simple_edits = false,
	-- Selecionar um arquivo novo/movido/renomeado ou diretório solicitará que você salve as alterações primeiro
	prompt_save_on_select_new_entry = true,
	-- Oil excluirá automaticamente buffers ocultos após este atraso
	cleanup_delay_ms = 2000,
	-- Restringir o cursor às partes editáveis do buffer oil
	constrain_cursor = "editable",
	-- Definir como true para observar o sistema de arquivos em busca de alterações e recarregar oil
	watch_for_changes = false,
	-- Opções de visualização
	view_options = {
		-- Mostrar arquivos e diretórios que começam com "."
		show_hidden = true,
		natural_order = true,
	},
	-- Mapeamentos personalizados para o buffer oil
	keymaps = {
		["g?"] = "actions.show_help",
		["<CR>"] = "actions.select",
		["l"] = "actions.select",
		["<C-s>"] = { "actions.select", opts = { vertical = true } },
		["<C-h>"] = { "actions.select", opts = { horizontal = true } },
		["<C-t>"] = { "actions.select", opts = { tab = true } },
		["<C-p>"] = "actions.preview",
		["<C-c>"] = "actions.close",
		["<C-l>"] = "actions.refresh",
		["-"] = "actions.parent",
		["h"] = "actions.parent",
		["_"] = "actions.open_cwd",
		["`"] = "actions.cd",
		["~"] = { "actions.cd", opts = { scope = "tab" } },
		["gs"] = "actions.change_sort",
		["gx"] = "actions.open_external",
		["g."] = "actions.toggle_hidden",
	},
})
