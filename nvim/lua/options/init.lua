-- setup
local options = require('options.options')

function set_options()
	for opt, val in pairs(options.global_options) do
		vim.o[opt] = val
	end
end

-- enable
set_options()
