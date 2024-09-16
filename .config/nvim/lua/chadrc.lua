-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "gruvbox_light",
  statusline = {
    theme = "minimal",
    separator_style = "round",
    order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "cursor", "lsp" },
    modules = nil,
  },
  icons = {
    ft = "",
    lazy = "",
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
