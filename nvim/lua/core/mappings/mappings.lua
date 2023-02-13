local mappings = {
  -- move window
  ['n <C-h> <C-w>h'] = {},
  ['n <C-j> <C-w>j'] = {},
  ['n <C-k> <C-w>k'] = {},
  ['n <C-l> <C-w>l'] = {},
  -- resize window
  ['n <M--> <C-W>-'] = {},
  ['n <M-=> <C-W>+'] = {},
  ['n <M-[> <C-W><'] = {},
  ['n <M-]> <C-W>>'] = {},
  -- split window
  ['n <M-s> <Cmd>sp<CR>'] = {},
  ['n <M-v> <Cmd>vs<CR>'] = {},
  -- ['n <M-h> <Cmd>vs<CR>+'] = {},
  -- ['n <M-l> <Cmd>vs<CR>+'] = {},

  -- switch buffer
  ['n <leader>cp <Cmd>bp<CR>'] = {},
  ['n <leader>cn <Cmd>bn<CR>'] = {},
  ['n <leader>cd <Cmd>bd<CR>'] = {},
  -- switch tab
  ['n <leader>tp gt'] = {},
  ['n <leader>tn gT'] = {},
  ['n <leader>tn <Cmd>tabc<CR>'] = {},
}

return mappings