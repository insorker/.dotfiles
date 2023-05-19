-- leader
vim.g.mapleader = ','

-- setup
local mapper   = require('mappings.mapper')
local mappings = require('mappings.mappings')

function set_mappings()
  mapper(mappings)
end

-- enable
set_mappings()
