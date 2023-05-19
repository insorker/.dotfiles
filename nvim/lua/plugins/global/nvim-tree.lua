--[[
# 使用
## 展开
[<leader>t]: 展开
## 默认映射
[':h nvim-tree.on_attach']
--]]

return {
  'nvim-tree/nvim-tree.lua',
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { '<leader>t', '<Cmd>NvimTreeToggle<CR>', mode = 'n', desc = 'nvim-tree toggle' }
  },
  init = function()
    -- disable netrw at the very start of your init.lua (strongly advised)
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    -- set termguicolors to enable highlight groups
    vim.opt.termguicolors = true
  end,
  config = function()
    -- OR setup with some options
    require("nvim-tree").setup({
      sort_by = "case_sensitive",
      view = {
        -- adaptive_size = true,
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = true,
      },
    })

    -- auto cloes, more infomation below
    -- https://github.com/nvim-tree/nvim-tree.lua/issues/1005
    -- https://github.com/nvim-tree/nvim-tree.lua/wiki/Auto-Close
    vim.api.nvim_create_autocmd("BufEnter", {
      group = vim.api.nvim_create_augroup("NvimTreeClose", {clear = true}),
      pattern = "NvimTree_*",
      callback = function()
        local layout = vim.api.nvim_call_function("winlayout", {})
        if layout[1] == "leaf" and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree" and layout[3] == nil then vim.cmd("confirm quit") end
      end
    })
  end,
}
