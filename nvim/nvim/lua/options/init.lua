-- setup options
local options = require('options.options')

for opt, val in pairs(options.global_options) do
  vim.o[opt] = val
end

-- https://zhuanlan.zhihu.com/p/721261051
vim.g.clipboard = {
  name = "win32yank-wsl",
  copy = {
    ["+"] = "win32yank.exe -i --crlf",
    ["*"] = "win32yank.exe -i --crlf"
  },
  paste = {
    ["+"] = "win32yank.exe -o --lf",
    ["*"] = "win32yank.exe -o --lf"
  },
  cache_enable = 0,
}
