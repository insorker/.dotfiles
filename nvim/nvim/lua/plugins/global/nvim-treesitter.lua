return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  init = function()
    vim.cmd('set foldmethod=expr')
    vim.cmd('set foldexpr=nvim_treesitter#foldexpr()')
    vim.cmd('set nofoldenable')
  end,
  config = function()
    require('nvim-treesitter.configs').setup {
      -- A list of parser names, or "all"
      ensure_installed = {
        -- must always be installed
        'c', 'lua', 'vim', 'vimdoc', 'query', 'markdown', 'markdown_inline',
        'dockerfile', 'json', 'yaml',
        'cpp', 'cmake', 'make',
        'go',
        'python',
        'rust'
      },

      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = true,

      highlight = {
        -- `false` will disable the whole extension
        enable = true,
        -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
        disable = function(_, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
      },

      -- try to tape 'Enter'
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          node_incremental = "<CR>",
          node_decremental = "<BS>",
        },
      },
    }
  end
}
