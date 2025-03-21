---@class wk.Opts
local defaults = {
	---@type false | "classic" | "modern" | "helix"
	preset = "classic",
	-- Delay before showing the popup. Can be a number or a function that returns a number.
	---@type number | fun(ctx: { keys: string, mode: string, plugin?: string }):number
	delay = function(ctx)
		return ctx.plugin and 0 or 200
	end,
	---@param mapping wk.Mapping
	filter = function(mapping)
		-- example to exclude mappings without a description
		-- return mapping.desc and mapping.desc ~= ""
		return true
	end,
	--- You can add any mappings here, or use `require('which-key').add()` later
	---@type wk.Spec
	spec = {
		-- Grupos principais
		{ "<leader>a", group = "Harpoon" },
		{ "<leader>b", group = "Buffer" },
		{ "<leader>d", group = "Debugger" },
		{ "<leader>g", group = "Git" },
		{ "<leader>l", group = "LSP" },
		{ "<leader>o", group = "Telescope" },
		{ "<leader>r", group = "Rust" },
		{ "<leader>s", group = "Format/Session" },
		{ "<leader>t", group = "Toggle/Tools" },

		-- Harpoon
		{
			"<leader>aa",
			function()
				require("harpoon"):list():add()
			end,
			desc = "Add to Harpoon",
		},
		{
			"<leader>ae",
			function()
				require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
			end,
			desc = "Show Harpoon Menu",
		},
		{
			"<leader>ag",
			function()
				require("harpoon"):list():select(1)
			end,
			desc = "Harpoon File 1",
		},
		{
			"<leader>ac",
			function()
				require("harpoon"):list():select(2)
			end,
			desc = "Harpoon File 2",
		},
		{
			"<leader>ar",
			function()
				require("harpoon"):list():select(3)
			end,
			desc = "Harpoon File 3",
		},
		{
			"<leader>al",
			function()
				require("harpoon"):list():select(4)
			end,
			desc = "Harpoon File 4",
		},
		{
			"<leader>ap",
			function()
				require("harpoon"):list():prev()
			end,
			desc = "Prev Harpoon File",
		},
		{
			"<leader>an",
			function()
				require("harpoon"):list():next()
			end,
			desc = "Next Harpoon File",
		},

		-- Buffer
		{ "<leader>bd", "<cmd>bd<CR>", desc = "Delete Buffer" },
		{ "<leader>bn", "<cmd>bnext<CR>", desc = "Next Buffer" },
		{ "<leader>bp", "<cmd>bprevious<CR>", desc = "Previous Buffer" },
		{ "<leader>bf", "<cmd>bfirst<CR>", desc = "First Buffer" },
		{ "<leader>bl", "<cmd>blast<CR>", desc = "Last Buffer" },

		-- Debugger
		{ "<leader>db", "<cmd>DapToggleBreakpoint<CR>", desc = "Toggle Breakpoint" },
		{ "<leader>dc", "<cmd>DapContinue<CR>", desc = "Start/Continue Debugging" },
		{ "<leader>di", "<cmd>DapStepInto<CR>", desc = "Step Into" },
		{ "<leader>do", "<cmd>DapStepOver<CR>", desc = "Step Over" },
		{ "<leader>dO", "<cmd>DapStepOut<CR>", desc = "Step Out" },
		{ "<leader>dr", "<cmd>DapReplOpen<CR>", desc = "Open REPL" },
		{ "<leader>dl", "<cmd>DapRunLast<CR>", desc = "Run Last" },
		{ "<leader>du", "<cmd>lua require('dapui').toggle()<CR>", desc = "Toggle UI" },

		-- Git
		{ "<leader>gg", "<cmd>LazyGit<CR>", desc = "LazyGit" },
		{
			"<leader>gs",
			function()
				require("gitsigns").stage_hunk()
			end,
			desc = "Stage Hunk",
		},
		{
			"<leader>gr",
			function()
				require("gitsigns").reset_hunk()
			end,
			desc = "Reset Hunk",
		},
		{
			"<leader>gS",
			function()
				require("gitsigns").stage_buffer()
			end,
			desc = "Stage Buffer",
		},
		{
			"<leader>gu",
			function()
				require("gitsigns").undo_stage_hunk()
			end,
			desc = "Undo Stage Hunk",
		},
		{
			"<leader>gR",
			function()
				require("gitsigns").reset_buffer()
			end,
			desc = "Reset Buffer",
		},
		{
			"<leader>gp",
			function()
				require("gitsigns").preview_hunk()
			end,
			desc = "Preview Hunk",
		},
		{
			"<leader>gb",
			function()
				require("gitsigns").blame_line({ full = true })
			end,
			desc = "Blame Line",
		},
		{
			"<leader>gt",
			function()
				require("gitsigns").toggle_current_line_blame()
			end,
			desc = "Toggle Line Blame",
		},
		{
			"<leader>gd",
			function()
				require("gitsigns").diffthis()
			end,
			desc = "Diff This",
		},
		{
			"<leader>gD",
			function()
				require("gitsigns").diffthis("~")
			end,
			desc = "Diff This ~",
		},

		-- LSP
		{ "<leader>lf", vim.lsp.buf.format, desc = "Format" },
		{ "<leader>lr", vim.lsp.buf.rename, desc = "Rename" },
		{ "<leader>la", vim.lsp.buf.code_action, desc = "Code Action" },
		{ "<leader>ld", vim.lsp.buf.definition, desc = "Go to Definition" },
		{ "<leader>lD", vim.lsp.buf.declaration, desc = "Go to Declaration" },
		{ "<leader>li", vim.lsp.buf.implementation, desc = "Go to Implementation" },
		{ "<leader>lt", vim.lsp.buf.type_definition, desc = "Type Definition" },
		{ "<leader>lh", vim.lsp.buf.hover, desc = "Hover" },
		{ "<leader>ls", vim.lsp.buf.signature_help, desc = "Signature Help" },
		{
			"<leader>ll",
			function()
				require("lint").try_lint()
			end,
			desc = "Lint",
		},

		-- Telescope
		{ "<leader>ok", "<cmd>Telescope find_files hidden=true<cr>", desc = "Find Files" },
		{ "<leader>os", "<cmd>Telescope live_grep<CR>", desc = "Find Text" },
		{ "<leader>ob", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
		{ "<leader>oh", "<cmd>Telescope help_tags<CR>", desc = "Help Tags" },
		{ "<leader>om", "<cmd>Telescope marks<CR>", desc = "Marks" },
		{ "<leader>oo", "<cmd>Telescope oldfiles<CR>", desc = "Recent Files" },
		{ "<leader>oz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Find in Buffer" },
		{ "<leader>og", "<cmd>Telescope git_commits<CR>", desc = "Git Commits" },
		{ "<leader>op", "<cmd>Telescope git_status<CR>", desc = "Git Status" },
		{
			"<leader>oa",
			"<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
			desc = "Find All Files",
		},

		-- Rust
		{
			"<leader>rr",
			function()
				require("rust-tools").runnables.runnables()
			end,
			desc = "Runnables",
		},
		{
			"<leader>rd",
			function()
				require("rust-tools").debuggables.debuggables()
			end,
			desc = "Debuggables",
		},
		{
			"<leader>re",
			function()
				require("rust-tools").expand_macro.expand_macro()
			end,
			desc = "Expand Macro",
		},
		{
			"<leader>rc",
			function()
				require("rust-tools").open_cargo_toml.open_cargo_toml()
			end,
			desc = "Open Cargo.toml",
		},
		{
			"<leader>rp",
			function()
				require("rust-tools").parent_module.parent_module()
			end,
			desc = "Parent Module",
		},

		-- Formatação
		{
			"<leader>sm",
			function()
				require("conform").format()
			end,
			desc = "Format",
		},

		-- Toggle/Tools
		{
			"<leader>tt",
			function()
				-- Verifica se function existe para evitar erros
				if require("base46") and require("base46").toggle_transparency then
					require("base46").toggle_transparency()
				end
			end,
			desc = "Toggle Transparency",
		},
		{
			"<leader>tq",
			function()
				-- Verifica se function existe para evitar erros
				if require("base46") and require("base46").toggle_transparency then
					require("base46").toggle_transparency()
				end
			end,
			desc = "Toggle Transparency",
		},
	},
	-- show a warning when issues were detected with your mappings
	notify = true,
	-- Which-key automatically sets up triggers for your mappings.
	-- But you can disable this and setup the triggers manually.
	-- Check the docs for more info.
	---@type wk.Spec
	triggers = {
		{ "<auto>", mode = "nxso" },
	},
	-- Start hidden and wait for a key to be pressed before showing the popup
	-- Only used by enabled xo mapping modes.
	---@param ctx { mode: string, operator: string }
	defer = function(ctx)
		return ctx.mode == "V" or ctx.mode == "<C-V>"
	end,
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		presets = {
			operators = true, -- adds help for operators like d, y, ...
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	---@type wk.Win.opts
	win = {
		-- don't allow the popup to overlap with the cursor
		no_overlap = true,
		-- width = 1,
		-- height = { min = 4, max = 25 },
		-- col = 0,
		-- row = math.huge,
		-- border = "none",
		padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
		title = true,
		title_pos = "center",
		zindex = 1000,
		-- Additional vim.wo and vim.bo options
		bo = {},
		wo = {
			-- winblend = 10, -- value between 0-100 0 for fully opaque and 100 for fully transparent
		},
	},
	layout = {
		width = { min = 20 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
	},
	keys = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	---@type (string|wk.Sorter)[]
	--- Mappings are sorted using configured sorters and natural sort of the keys
	--- Available sorters:
	--- * local: buffer-local mappings first
	--- * order: order of the items (Used by plugins like marks / registers)
	--- * group: groups last
	--- * alphanum: alpha-numerical first
	--- * mod: special modifier keys last
	--- * manual: the order the mappings were added
	--- * case: lower-case first
	sort = { "local", "order", "group", "alphanum", "mod" },
	---@type number|fun(node: wk.Node):boolean?
	expand = 0, -- expand groups when <= n mappings
	-- expand = function(node)
	--   return not node.desc -- expand all nodes without a description
	-- end,
	-- Functions/Lua Patterns for formatting the labels
	---@type table<string, ({[1]:string, [2]:string}|fun(str:string):string)[]>
	replace = {
		key = {
			function(key)
				return require("which-key.view").format(key)
			end,
			-- { "<Space>", "SPC" },
		},
		desc = {
			{ "<Plug>%(?(.*)%)?", "%1" },
			{ "^%+", "" },
			{ "<[cC]md>", "" },
			{ "<[cC][rR]>", "" },
			{ "<[sS]ilent>", "" },
			{ "^lua%s+", "" },
			{ "^call%s+", "" },
			{ "^:%s*", "" },
		},
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
		ellipsis = "…",
		-- set to false to disable all mapping icons,
		-- both those explicitly added in a mapping
		-- and those from rules
		mappings = true,
		--- See `lua/which-key/icons.lua` for more details
		--- Set to `false` to disable keymap icons from rules
		---@type wk.IconRule[]|false
		rules = {},
		-- use the highlights from mini.icons
		-- When `false`, it will use `WhichKeyIcon` instead
		colors = true,
		-- used by key format
		keys = {
			Up = " ",
			Down = " ",
			Left = " ",
			Right = " ",
			C = "󰘴 ",
			M = "󰘵 ",
			D = "󰘳 ",
			S = "󰘶 ",
			CR = "󰌑 ",
			Esc = "󱊷 ",
			ScrollWheelDown = "󱕐 ",
			ScrollWheelUp = "󱕑 ",
			NL = "󰌑 ",
			BS = "󰁮",
			Space = "󱁐 ",
			Tab = "󰌒 ",
			F1 = "󱊫",
			F2 = "󱊬",
			F3 = "󱊭",
			F4 = "󱊮",
			F5 = "󱊯",
			F6 = "󱊰",
			F7 = "󱊱",
			F8 = "󱊲",
			F9 = "󱊳",
			F10 = "󱊴",
			F11 = "󱊵",
			F12 = "󱊶",
		},
	},
	show_help = true, -- show a help message in the command line for using WhichKey
	show_keys = true, -- show the currently pressed key and its label as a message in the command line
	-- disable WhichKey for certain buf types and file types.
	disable = {
		ft = {},
		bt = {},
	},
	debug = false, -- enable wk.log in the current directory
}
