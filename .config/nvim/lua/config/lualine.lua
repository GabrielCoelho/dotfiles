require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "gruvbox",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = { "dashboard", "alpha" },
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = {
      "branch",
      {
        "diff",
        symbols = { added = " ", modified = " ", removed = " " },
      },
    },
    lualine_c = {
      {
        "filename",
        file_status = true, -- mostra status do arquivo (modificado, somente leitura)
        path = 1, -- 0 = apenas nome, 1 = caminho relativo, 2 = caminho absoluto
        shorting_target = 40, -- corta o caminho para este comprimento
      },
      {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        symbols = { error = " ", warn = " ", info = " ", hint = " " },
      },
    },
    lualine_x = {
      {
        function()
          local msg = "No LSP"
          local buf_clients = vim.lsp.get_active_clients()
          if next(buf_clients) == nil then
            return msg
          end
          local buf_client_names = {}
          for _, client in pairs(buf_clients) do
            if client.name ~= "null-ls" then
              table.insert(buf_client_names, client.name)
            end
          end
          return "[" .. table.concat(buf_client_names, ", ") .. "]"
        end,
        icon = " LSP:",
        color = { fg = "#ffffff", gui = "bold" },
      },
      "encoding",
      "fileformat",
      "filetype",
    },
    lualine_y = {
      { "progress", separator = " ", padding = { left = 1, right = 0 } },
      { "location", padding = { left = 0, right = 1 } },
    },
    lualine_z = {
      function()
        return " " .. os.date("%R")
      end,
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = { "oil", "lazy", "mason", "nvim-tree", "nvim-dap-ui", "trouble" },
})
