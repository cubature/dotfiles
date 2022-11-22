local M = {}

function M.config()
  -- disable netrw
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1

  --vim.opt.termguicolors = true

  require("nvim-tree").setup({
    view = {
      mappings = {
        list = {
          { key = "?", action = "toggle_help" },
        },
      },
    },
  })

  vim.api.nvim_set_keymap("n", "<leader>ft", ":NvimTreeToggle<cr>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<leader>fT", ":NvimTreeFindFileToggle<cr>", { noremap = true, silent = true })
end

return M
