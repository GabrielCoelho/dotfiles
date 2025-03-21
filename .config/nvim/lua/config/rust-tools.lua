local rt = require("rust-tools")

rt.setup({
	server = {
		on_attach = function(_, bufnr)
			-- Mapeamentos específicos para Rust
			local opts = { noremap = true, silent = true, buffer = bufnr }

			-- Hover actions
			vim.keymap.set("n", "K", rt.hover_actions.hover_actions, opts)

			-- -- Code action groups
			-- vim.keymap.set("n", "<Leader>ca", rt.code_action_group.code_action_group, opts)

			-- Outros mapeamentos específicos para Rust
			vim.keymap.set("n", "<Leader>rr", rt.runnables.runnables, { desc = "Rust Runnables", buffer = bufnr })
			vim.keymap.set("n", "<Leader>rd", rt.debuggables.debuggables, { desc = "Rust Debuggables", buffer = bufnr })
			vim.keymap.set(
				"n",
				"<Leader>re",
				rt.expand_macro.expand_macro,
				{ desc = "Expand Rust Macro", buffer = bufnr }
			)
			vim.keymap.set(
				"n",
				"<Leader>rc",
				rt.open_cargo_toml.open_cargo_toml,
				{ desc = "Open Cargo.toml", buffer = bufnr }
			)
			vim.keymap.set(
				"n",
				"<Leader>rp",
				rt.parent_module.parent_module,
				{ desc = "Rust Parent Module", buffer = bufnr }
			)
		end,

		-- Todas as opções para rust-analyzer
		settings = {
			["rust-analyzer"] = {
				-- Ativa todas as funcionalidades
				assist = {
					importGranularity = "module",
					importPrefix = "self",
				},
				cargo = {
					loadOutDirsFromCheck = true,
					allFeatures = true,
				},
				procMacro = {
					enable = true,
				},
				checkOnSave = {
					command = "clippy",
				},
			},
		},
	},

	-- Configuração das ferramentas
	tools = {
		-- Configurações automáticas do inlay hints
		inlay_hints = {
			auto = true,
			show_parameter_hints = true,
			parameter_hints_prefix = "<- ",
			other_hints_prefix = "=> ",
		},

		-- Configurações do hover
		hover_actions = {
			auto_focus = true,
		},
	},

	-- Configuração DAP (debug)
	dap = {
		adapter = {
			type = "executable",
			command = "lldb-vscode",
			name = "rt_lldb",
		},
	},
})
