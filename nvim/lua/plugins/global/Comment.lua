return {
  'numToStr/Comment.nvim',
  keys = {
    "<leader>cc", "<leader>bc",
    { "<leader>cc", mode = "v" },
    { "<leader>bc", mode = "v" },
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
