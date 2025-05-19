return {
	"zk-org/zk-nvim",
	config = function()
		require("zk").setup({
			-- Can be "telescope", "fzf", "fzf_lua", "minipick", "snacks_picker",
			-- or select" (`vim.ui.select`).
			picker = "telescope",

			lsp = {
				-- `config` is passed to `vim.lsp.start(config)`
				config = {
					cmd = { "zk", "lsp" },
					name = "zk",
					-- on_attach = ...
					-- etc, see `:h vim.lsp.start()`
				},

				-- automatically attach buffers in a zk notebook that match the given filetypes
				auto_attach = {
					enabled = true,
					filetypes = { "markdown" },
				},
			},
		})
	end,
}
