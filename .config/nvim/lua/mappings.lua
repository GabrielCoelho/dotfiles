require "nvchad.mappings"
-- Getting the maps and other plugins
local map = vim.keymap.set
local nomap = vim.keymap.del
-- local tel = require "nvchad.configs.telescope"
-- Mapping
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("i", "kj", "<ESC>")
map("n", "<S-h>", "<S-h>zz")
map("n", "<S-l>", "<S-l>zz")
map("n", "<leader>tt", require("base46").toggle_transparency, { desc = "Toggle transparency" })
map("n", "<leader>tq", require("base46").toggle_transparency, { desc = "Toggle transparency" })

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
nomap("n", "<leader>ff")
nomap("n", "<leader>fa")
nomap("n", "<leader>fb")
nomap("n", "<leader>fh")
nomap("n", "<leader>fm")
nomap("n", "<leader>fo")
nomap("n", "<leader>fw")
nomap("n", "<leader>fz")
nomap("n", "<leader>ma")
nomap("n", "<leader>cm")
nomap("n", "<leader>gt")
nomap("n", "<leader>pt")
--
-- noice
map("n", "<leader>di", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss Noice Message" })

-- cmap({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
