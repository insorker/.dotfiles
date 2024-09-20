-- leader
vim.g.mapleader = ','

-- setup mappings
local mapper = require('mappings.mapper')
local mappings = require('mappings.mappings')

mapper(mappings)
