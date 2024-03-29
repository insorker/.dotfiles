--[[
# 使用
## 选中区域
[Enter]: 选择
[Backspace]: 取消选择
## 格式化代码
[=]
## 折行
[zc]: 折叠
[zo]: 取消折叠
--]]

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
      ensure_installed = { 'c', 'cmake', 'cpp', 'css', 'cuda', 'dockerfile', 'go', 'haskell', 'html', 'java', 'javascript', 'json', 'latex', 'llvm', 'lua', 'make', 'markdown', 'python', 'ruby', 'rust', 'scheme', 'scss', 'sql', 'typescript', 'verilog', 'vim', 'vue', 'yaml' },

      highlight = {
        -- `false` will disable the whole extension
        enable = true,
        -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
        disable = function(lang, buf)
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
