local dap, dapui = require("dap"), require("dapui")
dapui.setup()

-- Automatically open UI
dap.listeners.before.attach["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.launch["dapui_config"] = function()
  dapui.open()
end
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "⭐️", texthl = "", linehl = "", numhl = "" })

vim.g.dap_virtual_text = true

-- Python DAP launch.json fix
dap.adapters.debugpy = dap.adapters.python
