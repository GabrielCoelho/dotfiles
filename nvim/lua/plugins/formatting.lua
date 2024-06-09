return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require "configs.conform"

    conform.setup {
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        lua = { "stylua" },
        html = { "prettier" },
        css = { "prettier" },
        markdown = { "prettier" },
        c = { "clang_format" },
        cpp = { "clang_format" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
    }

    vim.keymap.set({ "n", "v" }, "<leader>sm", function()
      conform.format {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      }
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
