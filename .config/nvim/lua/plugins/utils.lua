return {
	{
		"nvim-lua/plenary.nvim",
	},
	{ "nvim-tree/nvim-web-devicons" },
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			require("ibl").setup()
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"folke/which-key.nvim",
		config = function()
			require("config.which-key")
		end,
	},
}
