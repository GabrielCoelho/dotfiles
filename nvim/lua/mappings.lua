require "nvchad.mappings"
-- Getting the maps and other plugins
local map = vim.keymap.set
-- local tel = require "nvchad.configs.telescope"
-- Mapping
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", ";q", "<ESC>")
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })
map("n", "<leader>tt", require("base46").toggle_transparency, { desc = "Toggle transparency" })

-- Telescope
map("n", "<leader>os", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>ob", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>oh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>om", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>oo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>oz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>og", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>op", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>ot", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
map("n", "<leader>th", "<cmd>Telescope themes<CR>", { desc = "telescope nvchad themes" })
map("n", "<leader>ok", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map(
  "n",
  "<leader>oa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "telescope find all files" }
)
-- cmap({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
