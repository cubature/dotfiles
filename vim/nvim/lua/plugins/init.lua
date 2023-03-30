local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

return (function()
  require("lazy").setup({
    -- which key
    {
      "folke/which-key.nvim",
      config = require("plugins/which-key").config,
    },

    -- status line
    {
      "nvim-lualine/lualine.nvim",
      dependencies = {
        "nvim-tree/nvim-web-devicons",
      },
      config = require("plugins/lualine").config,
    },

    -- file tree
    {
      "nvim-tree/nvim-tree.lua",
      version = "nightly",
      config = require("plugins/nvim-tree").config,
      dependencies = {
        "nvim-tree/nvim-web-devicons", -- optional, for file icons
      },
    },

    -- search
    {
      "nvim-telescope/telescope.nvim",
      tag = "0.1.1",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = require("plugins/telescope").config,
    },

    -- auto completion
    -- vsnip
    "hrsh7th/cmp-vsnip",    -- { name = "vsnip" }
    "hrsh7th/vim-vsnip",
    "rafamadriz/friendly-snippets",
    -- lspkind
    "onsails/lspkind-nvim",
    -- nvim-cmp
    "hrsh7th/cmp-nvim-lsp", -- { name = nvim_lsp }
    "hrsh7th/cmp-buffer",   -- { name = "buffer" },
    "hrsh7th/cmp-path",     -- { name = "path" }
    "hrsh7th/cmp-cmdline",  -- { name = "cmdline" }
    {
      "hrsh7th/nvim-cmp",
      config = require("plugins/nvim-cmp").config,
    },

    -- lsp
    {
      "neovim/nvim-lspconfig",
      config = require("plugins/nvim-lspconfig").config,
    },

    -- dap
    {
      "mfussenegger/nvim-dap",
      config = require("plugins/nvim-dap").config,
    },

    -- linter
    -- formatter
    {
      "jose-elias-alvarez/null-ls.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = require("plugins/null-ls-nvim").config,
    },


    -- lsp, dap manager
    {
      "williamboman/mason.nvim",
      build = ":MasonUpdate", -- :MasonUpdate updates registry contents
      dependencies = {
        "mason-org/mason-registry",
      },
      config = require("plugins/mason-nvim").config,
    },
    {
      "williamboman/mason-lspconfig.nvim",
      dependencies = {
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
      },
      config = require("plugins/mason-lspconfig").config,
    },

    -- tree sitter
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = require("plugins/nvim-treesitter").config,
    },

    -- theme
    {
      "folke/tokyonight.nvim",
      config = require("plugins/tokyonight").config,
    },
  })

  vim.keymap.set("n", "<leader>PP", ":Lazy profile<cr>")

  -- nvim specific keymaps
  -- terminal
  vim.keymap.set("n", "<leader>tt", ":terminal<cr>")
  vim.keymap.set("t", "<esc>", "<c-\\><c-n>")
end)()

