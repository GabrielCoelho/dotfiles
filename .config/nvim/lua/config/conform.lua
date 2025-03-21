local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "markdownlint" },
    lua = { "stylua" },
    c = { "clang_format" },
    cpp = { "clang_format" },
    rust = { "ast_grep" },
    java = { "google-java-format", "ast_grep" },
    go = { "ast_grep" },
    python = { "black" },
    sql = { "sql_formatter" },
  },
  format_on_save = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 6000,
  },
})

-- Mapear formatação manual
vim.keymap.set({ "n", "v" }, "<leader>sm", function()
  conform.format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 6000,
  })
end, { desc = "Format file or range (in visual mode)" })
