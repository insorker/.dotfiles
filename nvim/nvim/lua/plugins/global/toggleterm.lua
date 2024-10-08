return {
  "akinsho/toggleterm.nvim", version = '*',
  keys = {
    { '<C-\\>' }, { '<leader>g' }
  },
  config = function()
    require("toggleterm").setup{
      open_mapping = [[<c-\>]],
      direction = 'float',
    }

    vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

    -- lazygit
    local Terminal  = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

    function _lazygit_toggle()
      lazygit:toggle()
    end

    vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
  end
}
