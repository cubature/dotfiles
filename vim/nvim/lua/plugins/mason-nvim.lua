local M = {}

function M.config()
  require("mason").setup()

  vim.keymap.set("n", "<leader>lM", ":Mason<cr>", { desc = "mason" })
end

return M

