local options = require('core.options.options')

-- set options
function set_options()
	for opt, val in pairs(options.global_options) do
		vim.o[opt] = val
	end

  -- yank in wsl
  -- if vim.fn.has("wsl") == 1 then
  --   vim.g.clipboard = {
  --     name = "win32yank-wsl",
  --     copy = {
  --       ["+"] = "win32yank.exe -i --crlf",
  --       ["*"] = "win32yank.exe -i --crlf",
  --     },
  --     paste = {
  --       ["+"] = "win32yank.exe -o --lf",
  --       ["*"] = "win32yank.exe -o --lf",
  --     },
  --     cache_enabled = 0,
  --   }
  -- end
end

return set_options
