local M = {}

function M.config()
  local dap_go = require("dap-go")
  dap_go.setup()

  local widgets = require("dap.ui.widgets")
  local scopes = widgets.sidebar(widgets.scopes, {}, "belowright split")
  local frames = widgets.sidebar(widgets.frames, {}, "belowright split")

  vim.keymap.set("n", "<leader>dd", function()
    dap_go.debug_test()
    frames.open()
    scopes.open()
    vim.cmd[[execute "normal \<c-w>Hzz"]]
  end, { desc = "debug test under cursor" })
end

return M

