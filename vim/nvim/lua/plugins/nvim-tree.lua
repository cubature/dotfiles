local M = {}

function M.config()
  -- disable netrw
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1

  require("nvim-tree").setup({
    view = {
      mappings = {
        list = {
          { key = "?", action = "toggle_help" },
        },
      },
    },
  })

  vim.keymap.set("n", "<leader>ft", ":NvimTreeToggle<cr>", { desc = "open file tree" } )
  vim.keymap.set("n", "<leader>fT", ":NvimTreeFindFileToggle<cr>", { desc = "locate current file in file tree" } )
end

return M
