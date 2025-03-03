return {
  -- Obsidian
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "Second Brain",
          path = "~/0. Inbox/mybrain/",
        },
      },
      daily_notes = {
        -- Optional, if you keep daily notes in a separate directory.
        folder = "2. Areas/Diário Intersticial/",
        -- Optional, if you want to change the date format for the ID of daily notes.
        date_format = "%Y-%m-%d",
        -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
        template = "3. Recursos/Included Files and Images/Modelos/Dia.md",
      },
      completion = {
        -- Set to false to disable completion.
        nvim_cmp = false,
        -- Trigger completion at 2 chars.
        -- min_chars = 2,
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
          -- insert_link = ";k",
        },
      },
      disable_frontmatter = true,
    },
  },
}
