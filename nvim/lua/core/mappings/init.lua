local mapper   = require('core.mappings.mapper')
local mappings = require('core.mappings.mappings')

-- set mappings
function set_mappings()
  mapper(mappings)
end

return set_mappings
