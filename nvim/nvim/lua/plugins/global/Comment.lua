return {
  event = "VeryLazy",
  'numToStr/Comment.nvim',
  keys = {
    "<C-_>", { "<C-_>", mode = "v" },
    "<leader>bc", { "<leader>bc", mode = "v" },
  },
  config = function()
    require('Comment').setup{
      ignore = '^$',
      toggler = {
        line = '<C-_>',
        block = '<leader>bc',
      },
      -- necessary in v-mode
      opleader = {
        line = '<C-_>',
        block = '<leader>bc',
      }
    }
  end
}
