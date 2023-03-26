local M = {}

function M.config()
  vim.o.timeout = true
  vim.o.timeoutlen = 300

  local wk = require("which-key")
  wk.setup({})

  wk.register({
    ["<leader>"] = {
      b = {
        name = "buffer",
        b = { "buffer list" },
        p = { "previous buffer" },
        n = { "next buffer" },
        d = { "close buffer" },
        D = { "force close buffer" },
      },
      f = {
        name = "file",
        s = { "save" },
      },
      t = {
        name = "tab",
        t = { "tab list" },
        N = { "new tab" },
        ["1"] = { "the first tab" },
        p = { "previous tab" },
        n = { "next tab" },
        ["0"] = { "the last tab" },
        d = { "close tab" },
        D = { "close other tabs" },
      },
      w = {
        name = "window",
        s = { "split horizonal" },
        v = { "split vertical" },
        j = { "go to window below" },
        k = { "go to window above" },
        h = { "go to window on the left" },
        l = { "go to window on the right" },
        J = { "move down window" },
        K = { "move up window" },
        H = { "move window to the left" },
        L = { "move window to the right" },
        d = { "close window" },
        D = { "close other windows" },
      },
      q = {
        name = "quit",
        q = { "quit vim" },
      },
      l = {
        name = "lsp",
        w = {
          name = "workspace"
        },
      },
      d = {
        name = "dap",
      },
      P = {
        name = "plugin",
      },
    },
  })
end

return M
