local dap = require("dap")
local dapui = require("dapui")

-- Configuração geral
dapui.setup()

-- Inicializar automaticamente o UI quando o DAP iniciar
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

-- Fechar automaticamente o UI quando o DAP terminar
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- Configurações específicas para cada linguagem
-- Java
dap.adapters.java = {
  type = "server",
  host = "127.0.0.1",
  port = "5005",
}

dap.configurations.java = {
  {
    type = "java",
    request = "attach",
    name = "Java Debugger",
    hostName = "127.0.0.1",
    port = 5005,
  },
}

-- C/C++
dap.adapters.cppdbg = {
  id = "cppdbg",
  type = "executable",
  command = vim.fn.stdpath("data") .. "/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
}

dap.configurations.cpp = {
  {
    name = "Launch C/C++",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopAtEntry = true,
    setupCommands = {
      {
        text = "-enable-pretty-printing",
        description = "Enable pretty printing",
        ignoreFailures = false,
      },
    },
  },
}

dap.configurations.c = dap.configurations.cpp

-- Rust
dap.adapters.lldb = {
  type = "executable",
  command = vim.fn.stdpath("data") .. "/mason/packages/codelldb/codelldb",
  name = "lldb",
}

dap.configurations.rust = {
  {
    name = "Launch Rust",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
  },
}

-- TypeScript/JavaScript
dap.adapters.node2 = {
  type = "executable",
  command = "node",
  args = { vim.fn.stdpath("data") .. "/mason/packages/node-debug2-adapter/out/src/nodeDebug.js" },
}

dap.configurations.typescript = {
  {
    name = "Launch TS",
    type = "node2",
    request = "launch",
    program = "${file}",
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = "inspector",
    console = "integratedTerminal",
  },
}

dap.configurations.javascript = dap.configurations.typescript
