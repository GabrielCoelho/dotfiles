-- This file  needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
	theme = "gruvbox",
    statusline = {
      theme = "default",
      separator_style = "round", 
      order = nil,
      modules = nil,
    },
  icons = {
      ft = "",
      lazy = "󰂠 ",
      loaded = "",
      not_loaded = "",
  },
  nvdash = {
    load_on_startup = true,
    header = {
"          (\\`/\\",
"    `=\\/\\",
"     `=\\/\\",
"      `=\\/",
"         \\"  },
  }
	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

return M
