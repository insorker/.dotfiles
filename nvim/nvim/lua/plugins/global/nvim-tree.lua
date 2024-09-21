return {
  event = "VeryLazy",
  'nvim-tree/nvim-tree.lua',
  dependencies = { "nvim-tree/nvim-web-devicons", "famiu/bufdelete.nvim" },
  init = function()
    -- disable netrw at the very start of your init.lua (strongly advised)
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    -- set termguicolors to enable highlight groups
    vim.opt.termguicolors = true
  end,
  config = function()
    require("nvim-tree").setup({
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = true,
      },
      update_focused_file = {
        enable = true,
      },
    })

    -- better behavior when closing buffer
    -- https://www.reddit.com/r/neovim/comments/nyqtwz/how_to_stop_nvim_tree_to_focus_when_a_buffer_is/
    vim.api.nvim_set_keymap('n', '<leader>d', '<Cmd>Bdelete<CR>', { noremap = true })

    vim.api.nvim_set_keymap('n', '<leader>e', '<Cmd>NvimTreeToggle<CR>', { noremap = true })
  end,
}
