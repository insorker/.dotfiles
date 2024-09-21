local mappings = {
  -- show help
  ['n <leader>h <Cmd>e ~/.config/nvim/help.md<CR>'] = {},

  -- move
  -- https://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
  ['n j v:count?\'j\':\'gj\''] = { expr = true },
  ['n k v:count?\'k\':\'gk\''] = { expr = true },

  -- switch window
  ['n <C-h> <C-w>h'] = {},
  ['n <C-j> <C-w>j'] = {},
  ['n <C-k> <C-w>k'] = {},
  ['n <C-l> <C-w>l'] = {},

  -- move window
  ['n <M-h> <C-w>H'] = {},
  ['n <M-j> <C-w>J'] = {},
  ['n <M-k> <C-w>K'] = {},
  ['n <M-l> <C-w>L'] = {},

  -- resize window
  ['n <M--> <C-W>-'] = {},
  ['n <M-=> <C-W>+'] = {},
  ['n <M-[> <C-W><'] = {},
  ['n <M-]> <C-W>>'] = {},

  -- split window
  ['n <leader>s <Cmd>sp<CR>'] = {},
  ['n <leader>v <Cmd>vs<CR>'] = {},

  -- switch buffer
  ['n <leader><tab> <C-6>'] = {},
  ['n <leader>p <Cmd>bp<CR>'] = {},
  ['n <leader>n <Cmd>bn<CR>'] = {},

  -- switch tab
  ['n <leader>tp gt'] = {},
  ['n <leader>tn gT'] = {},
  ['n <leader>tn <Cmd>tabc<CR>'] = {},

  -- format
  ['n <Space>f <Cmd>lua vim.lsp.buf.format()<CR>'] = {},
}

return mappings
