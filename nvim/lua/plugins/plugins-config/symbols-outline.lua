--[[
# 使用
['symbols-outline-default-keymaps']: keymaps，详见下方
--]]
require("symbols-outline").setup{
  -- default keymaps without change
  keymaps = { -- These keymaps can be a string or a table for multiple keys
    close = {"<Esc>", "q"},
    goto_location = "<Cr>",
    focus_location = "o",
    hover_symbol = "<C-space>",
    toggle_preview = "K",
    rename_symbol = "r",
    code_actions = "a",
    fold = "h",
    unfold = "l",
    fold_all = "W",
    unfold_all = "E",
    fold_reset = "R",
  },
}

vim.api.nvim_set_keymap('n', '<leader>g', '<Cmd>SymbolsOutline<CR>', {noremap = true})
