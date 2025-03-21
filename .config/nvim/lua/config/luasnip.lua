local luasnip = require("luasnip")

-- Carregar snippets do friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load()

luasnip.config.set_config({
  history = true, -- Permite voltar para snippets anteriores
  updateevents = "TextChanged,TextChangedI", -- Atualizar snippets à medida que você digita
  enable_autosnippets = true,
})

-- Mapear teclas para navegar nos snippets
vim.keymap.set({ "i", "s" }, "<C-j>", function()
  if luasnip.jumpable(1) then
    luasnip.jump(1)
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-k>", function()
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  end
end, { silent = true })
