return {
  'sainnhe/everforest',
  lazy = false,
  priority = 1000,
  config = function()
    -- Optionally configure and load the colorscheme
    -- directly inside the plugin declaration.
    vim.g.everforest_enable_italic = true
    vim.cmd.colorscheme('everforest')
  end
}

-- previous theme
-- return {
--   'sainnhe/sonokai',
--   init = function()
--     vim.g.sonokai_style = 'andromeda'
--     vim.g.sonokai_better_performance = 1
--     vim.cmd([[colorscheme sonokai]])
--   end,
-- }
