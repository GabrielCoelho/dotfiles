-- Utilitário para criar mapeamentos
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Mapeamentos gerais
map("n", ";", ":", { desc = "CMD Enter Command Mode" })
map("i", "jj", "<ESC>", { desc = "Exit Insert Mode" })
map("n", "gx", ":!open <c-r><c-a><CR>", { desc = "Open URL under cursor" })

-- Navegação aprimorada
map("n", "<S-h>", "<S-h>zz", opts)
map("n", "<S-l>", "<S-l>zz", opts)

-- Redimensionar janelas
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Splits de janelas
map("n", "<leader>sv", "<C-w>v", { desc = "Split window Vertically" })
map("n", "<leader>ss", "<C-w>s", { desc = "Split window Horizontally" })
map("n", "<leader>se", "<C-w>=", { desc = "Make splitted windows equal width" })
map("n", "<leader>sx", ":close<CR>", { desc = "Close Split" })
map("n", "<leader>sj", "<C-w>-", { desc = "Make height shorter" })
map("n", "<leader>sk", "<C-w>+", { desc = "Make height taller" })
map("n", "<leader>sl", "<C-w>>5", { desc = "Make width bigger" })
map("n", "<leader>sh", "<C-w><5", { desc = "Make width smaller" })

-- Buffer navigation
map("n", "<TAB>", ":bnext<CR>", opts)
map("n", "<S-TAB>", ":bprevious<CR>", opts)
map("n", "<leader>x", ":bd<CR>", { desc = "Close current buffer" })

-- Mover texto selecionado
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Manter o cursor no meio ao procurar
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

-- Quickfix
map("n", "<leader>fo", ":copen<CR>", { desc = "Open Quickfix(qf)" })
map("n", "<leader>ff", ":cfirst<CR>", { desc = "Jump to the first qflist" })
map("n", "<leader>fn", ":cnext<CR>", { desc = "Jump to the next qflist" })
map("n", "<leader>fp", ":cprev<CR>", { desc = "Jump to the previous qflist" })
map("n", "<leader>fl", ":clast<CR>", { desc = "Jump to the last qflist" })
map("n", "<leader>fc", ":cclose<CR>", { desc = "Close quickfix list" })

-- Salvar e sair
map("n", "<C-s>", ":w<CR>", { desc = "Save file" })
map("n", "<leader>w", ":w<CR>", { desc = "Save file" })
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })
map("n", "<leader>Q", ":qa!<CR>", { desc = "Quit without saving" })

-- Transparência
map("n", "<leader>tt", function()
	require("core.functions").toggle_transparency()
end, { desc = "Toggle transparency" })
map("n", "<leader>tq", function()
	require("core.functions").toggle_transparency()
end, { desc = "Toggle transparency" })

-- Telescope
map("n", "<leader>os", "<cmd>Telescope live_grep<CR>", { desc = "Search text" })
map("n", "<leader>ob", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
map("n", "<leader>oh", "<cmd>Telescope help_tags<CR>", { desc = "Help tags" })
map("n", "<leader>om", "<cmd>Telescope marks<CR>", { desc = "Find marks" })
map("n", "<leader>oo", "<cmd>Telescope oldfiles<CR>", { desc = "Find recent files" })
map("n", "<leader>oz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Find in current buffer" })
map("n", "<leader>og", "<cmd>Telescope git_commits<CR>", { desc = "Git commits" })
map("n", "<leader>op", "<cmd>Telescope git_status<CR>", { desc = "Git status" })
map("n", "<leader>ok", "<cmd>Telescope find_files hidden=true<CR>", { desc = "Find files" })
map(
	"n",
	"<leader>oa",
	"<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
	{ desc = "Find all files" }
)

-- Nvim-Dap
map("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", { desc = "Toggle Breakpoint" })
map("n", "<leader>dc", "<cmd>DapContinue<CR>", { desc = "Start/Continue Debugging" })
map("n", "<leader>di", "<cmd>DapStepInto<CR>", { desc = "Step Into" })
map("n", "<leader>do", "<cmd>DapStepOver<CR>", { desc = "Step Over" })
map("n", "<leader>dO", "<cmd>DapStepOut<CR>", { desc = "Step Out" })
map("n", "<leader>dr", "<cmd>DapReplOpen<CR>", { desc = "Open REPL" })
map("n", "<leader>dl", "<cmd>DapRunLast<CR>", { desc = "Run Last" })
map("n", "<leader>du", "<cmd>lua require('dapui').toggle()<CR>", { desc = "Toggle UI" })

-- Java-test
map("n", "<leader>tc", function()
	if vim.bo.filetype == "java" then
		require("jdtls").test_class()
	end
end)

map("n", "<leader>tm", function()
	if vim.bo.filetype == "java" then
		require("jdtls").test_nearest_method()
	end
end)

-- LazyGit
map("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "Open LazyGit" })

-- Oil.nvim
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
