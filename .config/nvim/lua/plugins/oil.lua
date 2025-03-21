return {
  "stevearc/oil.nvim",
  opts = {
    show_hidden = true,
  },
  dependencies = {"nvim-tree/nvim-web-devicons"},
  config = function()
    require("config.oil")
  end,
}
