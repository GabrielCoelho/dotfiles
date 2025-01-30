return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
      },
    },
  },
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
  {
    "hrsh7th/cmp-cmdline",
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim", "telescope.nvim" },
  },
  -- Obsidian
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "Second Brain",
          path = "~/0. Inbox/mybrain/",
        },
      },
      daily_notes = {
        -- Optional, if you keep daily notes in a separate directory.
        folder = "2. Areas/Diário Interesticial/",
        -- Optional, if you want to change the date format for the ID of daily notes.
        date_format = "%Y-%m-%d",
        -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
        template = "Dia.md",
      },
      completion = {
        -- Set to false to disable completion.
        nvim_cmp = true,
        -- Trigger completion at 2 chars.
        min_chars = 0,
      },
      new_notes_location = "0. Inbox/",
      templates = {
        folder = "3. Recursos/Included Files and Images/Modelos/",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
      },
      mappings = {
        ["go"] = {
          action = function()
            return require("obsidian").util.gf_passtrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
      },
      picker = {
        name = "telescope.nvim",
        mappings = {
          new = "<C-S-n>",
          -- insert_link = ";k",
        },
      },
    },
  },
}
