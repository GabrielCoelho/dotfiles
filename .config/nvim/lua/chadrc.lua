-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "gruvbox",
}

M.ui = {
  statusline = {
    theme = "default",
    separator_style = "arrow",
    order = { "mode", "file", "git", "%=", "lsp_msg", "lsp", "%=", "diagnostics", "cwd", "cursor" },
    modules = nil,
  },
  icons = {
    ft = "",
    lazy = "",
    loaded = "",
    not_loaded = "",
    cwd = "",
  },
  cmp = {
    icons = true,
    lspkind_text = true,
    style = "flat_dark",
  },
  telescope = {
    style = "bordered",
  },
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

return M
