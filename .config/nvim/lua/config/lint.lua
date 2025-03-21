local lint = require("lint")

lint.linters_by_ft = {
  javascript = { "eslint_d" },
  typescript = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  typescriptreact = { "eslint_d" },
  python = { "flake8" },
  c = { "trivy", "cpplint" },
  cpp = { "trivy", "cpplint" },
  rust = { "trivy" },
  markdown = { "markdownlint" },
}

-- Os autocmds para executar o lint automaticamente estão no arquivo autocmds.lua

-- Mapear lint manual
vim.keymap.set("n", "<leader>ll", function()
  lint.try_lint()
end, { desc = "Trigger linting for current file" })
