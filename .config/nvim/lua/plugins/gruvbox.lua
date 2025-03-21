return {
  "ellisonleao/gruvbox.nvim",
  prority = 1000,
  lazy = false,
  config = function()
    require("gruvbox").setup({
        transparent = true,
        styles = {
            sidebars = "transparent",
            floats = "transparent",
          },
      })
    vim.cmd [[colorscheme gruvbox]]
  end,
}
