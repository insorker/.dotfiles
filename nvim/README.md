# Nvim

## Usage

这里给出我常用的一些快捷键（TODO）

## Software to Install

配合使用的必需软件，具体详见 Plugin 中的说明

## Plugin

请阅读以下内容，注释部分可能需要手动操作（不一定能及时更新）

### 插件管理器

[folke/lazy.nvim](https://github.com/folke/lazy.nvim)

### 主题

[sainnhe/sonokai](https://github.com/sainnhe/sonokai)

### 代码高亮

[nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

如果你遇到了如下错误

```
Error detected while processing /home/ikun/.config/nvim/init.lua:
tree-sitter CLI not found: `tree-sitter` is not executable!
tree-sitter CLI is needed because `sql` is marked that it needs to be generated
from the grammar definitions to be compatible with nvim!
```

很可能是这个[问题](https://github.com/nvim-treesitter/nvim-treesitter/issues/2064)，删除 nvim/lua/plugins/plugins-config/nvim-treesitter.lua 中的 'sql' 即可。如果你需要使用 sql 补全，请自行解决。

### 文件树

[nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)

> 注意!
>
> 请在此前安装 node，推荐使用 nvm

### LSP 补全

#### 自动 server 安装

[williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)

[williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)

#### lspconfig

[neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)

#### 自动补全

[hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)

[hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)

[saadparwaiz1/cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)

[L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip)

#### 补全的同时显示文档

[folke/neodev.nvim](https://github.com/folke/neodev.nvim)

### buffer line

[akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim)

图标显示错误，参考这个[回答](https://zhuanlan.zhihu.com/p/586443435)

### status line

[nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)

### 展示 symbols

[simrat39/symbols-outline.nvim](https://github.com/simrat39/symbols-outline.nvim)

### file searcher

[nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)

### 浮动终端

[akinsho/toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)

### 加速插件下载

[lewis6991/impatient.nvim](https://github.com/lewis6991/impatient.nvim)

### dashboard

[glepnir/dashboard-nvim](https://github.com/glepnir/dashboard-nvim)

### 每个项目的根目录

[airblade/vim-rooter](https://github.com/airblade/vim-rooter)

### 注释

[numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim)

### format

[jose-elias-alvarez/null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim)
