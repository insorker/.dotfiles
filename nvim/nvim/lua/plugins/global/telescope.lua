return {
  'nvim-telescope/telescope.nvim',
  cmd = "Telescope",
  keys = {
    { '<leader>ff', '<Cmd>Telescope find_files<Cr>',              mode = 'n', desc = 'find files except hidden files' },
    { '<leader>fd', '<Cmd>Telescope find_files hidden=true<Cr>',  mode = 'n', desc = 'find files with hidden files' },
    { '<leader>fg', '<Cmd>Telescope live_grep<Cr>',               mode = 'n', desc = 'find files in grep mode' },
    { '<leader>fb', '<Cmd>Telescope buffers<Cr>',                 mode = 'n', desc = 'find files in buffers' },
    { '<leader>fo', '<Cmd>Telescope oldfiles<Cr>',                mode = 'n', desc = 'find old files' },
    { '<leader>fh', '<Cmd>Telescope help_tags<Cr>',               mode = 'n', desc = 'find help manuals' },
  },
  dependencies = { 'nvim-lua/plenary.nvim' },
  version = '0.1.1',
}
