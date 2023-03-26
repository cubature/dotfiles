local M = {}

function M.config()
  require("lspconfig").gopls.setup({})
  require("lspconfig").lua_ls.setup({})

  -- Use LspAttach autocommand to only map the following keys
  -- after the language server attaches to the current buffer
  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
      -- Enable completion triggered by <c-x><c-o>
      vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

      -- Buffer local mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      vim.keymap.set('n', '<leader>ld', vim.lsp.buf.declaration, { buffer = ev.buf, desc = "declaration" })
      vim.keymap.set('n', '<leader>lr', vim.lsp.buf.references, { buffer = ev.buf, desc = "references" })
      vim.keymap.set('n', '<leader>lD', vim.lsp.buf.definition, { buffer = ev.buf, desc = "definition" })
      vim.keymap.set('n', '<leader>lt', vim.lsp.buf.type_definition, { buffer = ev.buf, desc = "type definition" })
      vim.keymap.set('n', '<leader>li', vim.lsp.buf.implementation, { buffer = ev.buf, desc = "implementation" })
      vim.keymap.set('n', '<leader>lh', vim.lsp.buf.hover, { buffer = ev.buf, desc = "info under cursor" })
      vim.keymap.set('n', '<leader>lH', vim.lsp.buf.signature_help, { buffer = ev.buf, desc = "help" })
      vim.keymap.set('n', '<leader>lwa', vim.lsp.buf.add_workspace_folder, { buffer = ev.buf, desc = "add folder" })
      vim.keymap.set('n', '<leader>lwr', vim.lsp.buf.remove_workspace_folder, { buffer = ev.buf, desc = "remove folder" })
      vim.keymap.set('n', '<leader>lwl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, { buffer = ev.buf, desc = "show folders" })
      vim.keymap.set('n', '<leader>ln', vim.lsp.buf.rename, { buffer = ev.buf, desc = "rename all references" })
      vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, { buffer = ev.buf, desc = "action" })
      vim.keymap.set('n', '<leader>lf', function()
        vim.lsp.buf.format { async = true }
      end, { buffer = ev.buf, desc = "format" })
    end,
  })
end

return M
