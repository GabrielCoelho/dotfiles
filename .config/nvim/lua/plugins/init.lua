return {
  -- These are some examples, uncomment them if you want to see them work!
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
      },
    },
  },
  {
    "nvim-lua/plenary.nvim",
  },
  {
    "nvim-tree/nvim-web-devicons",
  },
  {
    "simrat39/rust-tools.nvim",
  },
  {
    require("base46").toggle_transparency(),
  },
}
