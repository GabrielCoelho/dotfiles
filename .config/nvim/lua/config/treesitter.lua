require("nvim-treesitter.configs").setup({
  -- Uma lista de nomes de parser que devem ser sempre instalados
  ensure_installed = {
    "lua",
    "vim",
    "vimdoc",
    "javascript",
    "typescript",
    "html",
    "css",
    "java",
    "c",
    "cpp",
    "python",
    "rust",
    "yaml",
    "json",
    "markdown",
    "markdown_inline",
    "bash",
    "regex",
    "sql",
  },

  -- Instala automaticamente parsers ausentes quando entra em buffer
  auto_install = true,

  -- Lista de parsers que não devem ser instalados
  ignore_install = {},

  -- Módulos
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
  -- Suporte para seleção incremental de nodos
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      node_incremental = "<CR>",
      scope_incremental = "<S-CR>",
      node_decremental = "<BS>",
    },
  },
  -- Suporte para pares correspondentes
  matchup = {
    enable = true,
  },
})
