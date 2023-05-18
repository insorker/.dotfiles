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

require('lazy').setup({
  -- Theme
  { 'sainnhe/sonokai' },

  -- Code Highlight
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
  },

  -- file tree
  {
    'nvim-tree/nvim-tree.lua',
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
    end,
  },

  -- lsp complete
  'neovim/nvim-lspconfig', -- Collection of configurations for built-in LSP client
  'hrsh7th/nvim-cmp', -- Autocompletion plugin
  'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
  'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
  'L3MON4D3/LuaSnip', -- Snippets plugin

  -- buffer line
  {
    'akinsho/bufferline.nvim',
    version = '*', dependencies =  'nvim-tree/nvim-web-devicons'
  },

  -- status line
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
  },

  -- symbols view
  'simrat39/symbols-outline.nvim',

  -- file searcher
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { {'nvim-lua/plenary.nvim'} },
    version = '0.1.0',
  },

  -- float terminal
  {
    "akinsho/toggleterm.nvim",
    version = '*',
    config = true
  },

  -- speed up loading lua modules
  -- Is using a standard Neovim install, i.e. built from source or using a
  -- provided appimage.
  'lewis6991/impatient.nvim',

  -- dashboard
  'glepnir/dashboard-nvim',
  
  -- vim rooter
  'airblade/vim-rooter',

  -- comment
  'numToStr/Comment.nvim',
})

require('plugins/plugins-config')
