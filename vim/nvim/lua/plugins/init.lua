local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Automatically reload plugins whenever plugins/init.lua is updated
--vim.cmd([[
--  augroup packer_user_config
--    autocmd!
--    autocmd BufWritePost plugins/init.lua source <afile> | PackerSync
--  augroup end
--]])

return require('packer').startup({
  function(use)
    -- Packer manage itself
    use 'wbthomason/packer.nvim'
  
    -- file tree
  	use {
      'nvim-tree/nvim-tree.lua',
      tag = 'nightly',
      config = "require('plugins/nvim-tree').config()",
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
    }

    -- lsp
    use {
      'neovim/nvim-lspconfig',
      config = "require('plugins/nvim-lspconfig').config()",
    }

    -- auto completion
    -- nvim-cmp
    use 'hrsh7th/cmp-nvim-lsp' -- { name = nvim_lsp }
    use 'hrsh7th/cmp-buffer'   -- { name = 'buffer' },
    use 'hrsh7th/cmp-path'     -- { name = 'path' }
    use 'hrsh7th/cmp-cmdline'  -- { name = 'cmdline' }
    use 'hrsh7th/nvim-cmp'
    -- vsnip
    use 'hrsh7th/cmp-vsnip'    -- { name = 'vsnip' }
    use 'hrsh7th/vim-vsnip'
    use 'rafamadriz/friendly-snippets'
    -- lspkind
    use 'onsails/lspkind-nvim'
  
    -- Automatically set up configuration after cloning packer.nvim
    -- This should be at the end after all plugins
    if packer_bootstrap then
      require('packer').sync()
    end
  end,
  config = {
    max_jobs = 16,
    git = {
      clone_timeout = 120,
    },
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
})
