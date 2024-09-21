# nvim 使用手册

## 常用命令

TODO

## Comment

<C-_>           : 单行注释
<leader>bc      : 多行注释

## telescope

<leader>ff      : 打开 telescope 寻找文件 (默认打开当前文件夹)
<Esc><Esc>      : 退出
<leader>fd      : 打开 telescope 寻找文件（包括隐藏文件）
<leader>fg      : 打开 telescope 寻找文件（正则模式）
<leader>fd      : 打开 telescope 寻找文件（只包括 buffer 中的文件）

## nvim-tree

<leader>t       : 打开 nvim-tree
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
