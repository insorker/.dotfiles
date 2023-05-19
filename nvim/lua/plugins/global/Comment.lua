return {
  'numToStr/Comment.nvim',
  keys = {
    "<leader>cc", "<leader>bc",
    { "<leader>cc", mode = "n" },
    { "<leader>bc", mode = "n" },
  },
  config = function()
    require('Comment').setup{
      toggler = {
        line = '<leader>cc',
        block = '<leader>bc',
      },
      opleader = {
        line = '<leader>cc',
        block = '<leader>bc',
      }
    }
  end
}
