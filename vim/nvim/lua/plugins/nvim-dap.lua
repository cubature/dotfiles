local M = {}

function M.config()
  local dap = require("dap")

  dap.adapters.go = function(callback, config)
    -- https://github.com/Murzchnvok/nvim/blob/main/nvim/lua/plugins/config/adapters/go.lua
    local stdout = vim.loop.new_pipe(false)
    local handle
    local pid_or_err
    local port = 38697
    local opts = {
      stdio = { nil, stdout },
      args = { "dap", "-l", "127.0.0.1:" .. port },
      detached = true,
    }
    handle, pid_or_err = vim.loop.spawn("dlv", opts, function(code)
      stdout:close()
      handle:close()
      if code ~= 0 then
        print("dlv exited with code", code)
      end
    end)
    assert(handle, "Error running dlv: " .. tostring(pid_or_err))
    stdout:read_start(function(err, chunk)
      assert(not err, err)
      if chunk then
        vim.schedule(function()
          require("dap.repl").append(chunk)
        end)
      end
    end)
    vim.defer_fn(function()
      callback({ type = "server", host = "127.0.0.1", port = port })
    end, 100)
  end

  dap.configurations.go = {
    {
      type = "go";
      request = "launch";
      name = "Debug";
      program = "${file}";
    },
  }

  vim.keymap.set("n", "<leader>dc", dap.repl.toggle, { desc = "debug console" })
  vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "toggle breakpoint" })
  vim.keymap.set("n", "<leader>dr", dap.continue, { desc = "resume" })
  vim.keymap.set("n", "<leader>dn", dap.step_over, { desc = "step over" })
  vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "step in" })
  vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "step out" })
end

return M

