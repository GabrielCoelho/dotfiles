return {
  require("conform").setup {
    formatters_by_ft = {
      javascript = { "prettier" },
      typescript = { "prettier" },
      lua = { "stylua" },
      html = { "prettier" },
      css = { "prettier" },
      markdown = { "marksman", "mdformat" },
      c = { "clang_format" },
      cpp = { "clang_format" },
      rust = { "ast_grep" },
      java = { "google_java_format", "ast_grep" },
      go = { "ast_grep" },
      python = { "ast_grep" },
      sql = { "sql_formatter" },
    },
    format_on_save = {
      lsp_fallback = true,
      async = false,
      timeout_ms = 6000,
    },
  },

  vim.keymap.set({ "n", "v" }, "<leader>sm", function()
    require("conform").format {
      lsp_fallback = true,
      async = false,
      timeout_ms = 6000,
    }
  end, { desc = "Format file or range (in visual mode)" }),
}
