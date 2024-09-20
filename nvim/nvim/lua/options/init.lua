-- setup options
local options = require('options.options')

for opt, val in pairs(options.global_options) do
  vim.o[opt] = val
end

vim.opt.clipboard:append('unnamedplus')
