require("obsidian").setup({
  workspaces = {
    {
      name = "Second Brain",
      path = "~/0. Inbox/mybrain/",
    },
  },
  daily_notes = {
    -- Optional, se você mantém notas diárias em um diretório separado
    folder = "2. Areas/Diário Intersticial/",
    -- Optional, se você quiser alterar o formato de data para o ID das notas diárias
    date_format = "%Y-%m-%d",
    -- Optional, se você quiser inserir automaticamente um modelo do seu diretório de modelos como 'daily.md'
    template = "3. Recursos/Included Files and Images/Modelos/Dia.md",
  },
  completion = {
    -- Defina como false para desativar a conclusão.
    nvim_cmp = false,
  },
  new_notes_location = "0. Inbox/",
  templates = {
    folder = "3. Recursos/Included Files and Images/Modelos/",
    date_format = "%Y-%m-%d",
    time_format = "%H:%M",
  },
  mappings = {
    ["go"] = {
      action = function()
        return require("obsidian").util.gf_passtrough()
      end,
      opts = { noremap = false, expr = true, buffer = true },
    },
  },
  picker = {
    name = "telescope.nvim",
    mappings = {
      new = "<C-S-n>",
    },
  },
  disable_frontmatter = true,
})

-- Mapeamento para seguir links do Obsidian
vim.keymap.set("n", "gf", function()
  if require("obsidian").util.cursor_on_markdown_link() then
    return "<cmd>ObsidianFollowLink<CR>"
  else
    return "gf"
  end
end, { noremap = false, expr = true })
