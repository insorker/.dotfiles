（已废弃，详见：https://zhuanlan.zhihu.com/p/15862658219）


# nvim 使用手册

## 常用命令

<leader>h       : 打开帮助文档

<M-h/j/k/l>     : 移动 buffer 

<M-=>           : 向下增大当前 buffer 
<M-->           : 向上减小当前 buffer 
<M-]>           : 曾大当前 buffer 宽度
<M-[>           : 减少当前 buffer 宽度

<leader>s       : 水平分割当前 buffer 
<leader>v       : 垂直分割当前 buffer 

<leader><tab>   : 切换最近浏览的两个 buffer
<leader>p       : 切换左侧 buffer
<leader>n       : 切换右侧 buffer

<leader>tp      : 切换前一个 tab
<leader>tn      : 切换后一个 tab
<leader>tc      : 关闭 tab

<Space>f        : 格式化

## Comment 注释

<C-_>           : 单行注释
<leader>bc      : 多行注释

## LSP

<Space>k        : 显示 lsp 信息

## nvim-tree 侧边栏

<leader>e       : 打开 nvim-tree
<leader>d       : 关闭当前 buffer
<C-]>           : 进入文件夹
o               : 展开文件夹 / 在当前 buffer 打开文件
<C-r>           : 重命名
<C-t>           : 在新 tab 中打开文件
<C-v>           : vs 垂直分割
<C-x>           : sp 水平分割
<BS>            : 收起这个文件所在的文件夹
<CR>            : 展开文件夹
a               : 新建
c               : 复制
x               : 剪切
p               : 粘贴
P               : 跳转到父文件夹
d               : 删除
D               : 进回收站
g?              : 帮助
r               : 重命名
R               : 刷新
S               : 搜索
y               : 复制文件名
Y               : 复制文件路径

## nvim-treesitter 高亮

<CR>            : 选中区域
<BS>            : 取消选中
<zc>            : 折行
<zo>            : 展开折行

## telescope 查找文件

<leader>ff      : 打开 telescope 寻找文件 (默认打开当前文件夹)
<leader>fo      : 打开 telescope 需按文件（最近打开的文件）
<Esc><Esc>      : 退出
<leader>fd      : 打开 telescope 寻找文件（包括隐藏文件）
<leader>fg      : 打开 telescope 寻找文件（正则模式）
<leader>fd      : 打开 telescope 寻找文件（只包括 buffer 中的文件）

## trouble 显示

<leader>x       : 显示 diagnosis
