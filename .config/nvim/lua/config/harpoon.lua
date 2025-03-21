local harpoon = require("harpoon")

-- Configuração básica
harpoon:setup()

-- Mapeamentos do Harpoon
local function map(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { desc = desc })
end

-- Adicionar arquivo à lista
map("n", "<leader>aa", function()
  harpoon:list():add()
end, "Add to Harpoon")

-- Abrir o menu rápido
map("n", "<leader>ae", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, "Show Harpoon Menu")

-- Atalhos para acessar arquivos específicos
map("n", "<leader>ag", function()
  harpoon:list():select(1)
end, "Harpoon File 1")

map("n", "<leader>ac", function()
  harpoon:list():select(2)
end, "Harpoon File 2")

map("n", "<leader>ar", function()
  harpoon:list():select(3)
end, "Harpoon File 3")

map("n", "<leader>al", function()
  harpoon:list():select(4)
end, "Harpoon File 4")

-- Navegação entre arquivos
map("n", "<leader>ap", function()
  harpoon:list():prev()
end, "Prev Harpoon File")

map("n", "<leader>an", function()
  harpoon:list():next()
end, "Next Harpoon File")
