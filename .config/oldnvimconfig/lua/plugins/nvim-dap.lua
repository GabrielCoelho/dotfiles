return {
  {
    "mfussenegger/nvim-dap",
    module = "dap",
  },
  {
    "rcarriga/nvim-dap-ui",
    after = "nvim-dap",
    dependencies = { "nvim-neotest/nvim-nio" },
    config = function()
      require("dapui").setup()
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    after = "nvim-dap",
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
  },
}
