local M = {}

function M.config()
  require("lspconfig").gopls.setup({
  })
end

return M
