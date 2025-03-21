require("gitsigns").setup({
	signs = {
		add = { text = "│" },
		change = { text = "│" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	signcolumn = true, -- Mostrar sinais na signcolumn
	numhl = false, -- Destaque do número de linha
	linehl = false, -- Destaque da linha
	word_diff = false, -- Destacar mudanças dentro da palavra
	watch_gitdir = {
		interval = 1000,
		follow_files = true,
	},
	attach_to_untracked = true,
	current_line_blame = false, -- Toggle with :Gitsigns toggle_current_line_blame
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
		delay = 1000,
		ignore_whitespace = false,
	},
	current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Usar formato padrão
	max_file_length = 40000, -- Desativar se o arquivo for mais longo que isso
	preview_config = {
		-- Opções para o buffer de visualização flutuante
		border = "single",
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Mapeamentos de navegação
		map("n", "]c", function()
			if vim.wo.diff then
				return "]c"
			end
			vim.schedule(function()
				gs.next_hunk()
			end)
			return "<Ignore>"
		end, { expr = true, desc = "Next git hunk" })

		map("n", "[c", function()
			if vim.wo.diff then
				return "[c"
			end
			vim.schedule(function()
				gs.prev_hunk()
			end)
			return "<Ignore>"
		end, { expr = true, desc = "Previous git hunk" })

		-- Ações
		map("n", "<leader>gs", gs.stage_hunk, { desc = "Stage hunk" })
		map("n", "<leader>gr", gs.reset_hunk, { desc = "Reset hunk" })
		map("v", "<leader>gs", function()
			gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, { desc = "Stage selected hunk" })
		map("v", "<leader>gr", function()
			gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, { desc = "Reset selected hunk" })
		map("n", "<leader>gS", gs.stage_buffer, { desc = "Stage buffer" })
		map("n", "<leader>gu", gs.undo_stage_hunk, { desc = "Undo stage hunk" })
		map("n", "<leader>gR", gs.reset_buffer, { desc = "Reset buffer" })
		map("n", "<leader>gp", gs.preview_hunk, { desc = "Preview hunk" })
		map("n", "<leader>gb", function()
			gs.blame_line({ full = true })
		end, { desc = "Blame line" })
		map("n", "<leader>gt", gs.toggle_current_line_blame, { desc = "Toggle line blame" })
		map("n", "<leader>gd", gs.diffthis, { desc = "Diff this" })
		map("n", "<leader>gD", function()
			gs.diffthis("~")
		end, { desc = "Diff this ~" })
		map("n", "<leader>gx", gs.toggle_deleted, { desc = "Toggle deleted" })

		-- Texto objeto
		map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select hunk" })
	end,
})
