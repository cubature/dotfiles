local M = {}

function M.config()
  local dap = require("dap")

  dap.adapters.go = function(callback, config)
    -- https://github.com/Murzchnvok/nvim/blob/main/nvim/lua/plugins/config/adapters/go.lua
  end

  dap.configurations.go = {
      {
      type = "go";
      request = "launch";
      name = "Debug";
      program = "${file}";
    },
  }

  vim.keymap.set("n", "<leader>dw", dap.repl.open, { desc = "debug console" })
  vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "toggle breakpoint" })
  vim.keymap.set("n", "<leader>dr", dap.continue, { desc = "resume" })
  vim.keymap.set("n", "<leader>dn", dap.step_over, { desc = "step over" })
  vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "step in" })
  vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "step out" })
end

return M

