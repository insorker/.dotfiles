local options = require('core.options.options')

-- set options
function set_options()
	for opt, val in pairs(options.global_options) do
		vim.o[opt] = val
	end
end

return set_options
