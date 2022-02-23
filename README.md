# 配置文件使用

管理个人配置文件

由于我用的是zsh作为shell脚本，bash用户请酌情修改

## 安装配置文件

安装stow

```shell
sudo apt-get install stow
```

在$HOME目录（其他目录也行）下git clone所有文件

```shell
git clone git@github.com:insorker/.dotfiles.git
```

进入.dotfiles文件运行脚本（bash用户请修改shell解释器）

> 注意！！！
>
> 脚本会删除所有$HOME目录下相关配置文件，如果有其他需要，请手动配置
>
> 手动配置方式为：
>
> - 安装：对需要的文件夹，运行`stow -S xxx`
> - 删除：`stow -D xxx`

```shell
./link.sh
```

删除所有配置

```shell
./clear.sh
```

## vim

### .vimrc

其他配置参考文件内注释，这里只详细介绍插件部分。

#### vim-plug安装

关于vim插件，我使用的是[vim-plug](https://github.com/junegunn/vim-plug)，安装过程详见链接（根据你的系统选择安装指令）。安装好了后，为了提高插件下载速度进行配置文件的修改，具体参考此[文档](https://blog.csdn.net/htx1020/article/details/114364510)，或者按以下步骤进行修改

1. 将该行
   
   ```
   let fmt = get(g:, 'plug_url_format', 'https://git::@github.com/%s.git')
   ```
   
   改为
   
   ```
   let fmt = get(g:, 'plug_url_format', 'https://git::@hub.fastgit.org/%s.git')
   ```

2. 将该行
   
   ```
   \ '^https://git::@github\.com', 'https://github.com', '')
   ```
   
   改为
   
   ```
   \ '^https://git::@hub.fastgit\.org', 'https://hub.fastgit.org', '')
   ```

3. 然后调用`:PlugInstall`手动安装插件，详见.vimrc。下面介绍一些需要手动配置的插件

#### vim-plug安装插件

##### coc.nvim 
可以访问GitHub上的网站[coc.nvim](https://github.com/neoclide/coc.nvim)了解初步配置，这里也给出我的配置步骤

1. 下载node.js
    https://github.com/nodesource/distributions/blob/master/README.md

2. 默认安装的插件是java、python、clangd和json，有其他需求可以修改 
   
   ```
   let g:coc_global_extensions = ['coc-java', 'coc-pyright', 'coc-clangd', 'coc-json']
   ```
   
   其他extensions详见https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions

3. 打开对应的后缀文件查看提示信息
   
   - java需要安装jdk
   
   - c/cpp文件需要安装clangd（我的设置，也可以不这样），使用`:CocCommand clangd.install`命令即可。
     
     - 如果出现错误，可以参考https://github.com/clangd/coc-clangd/issues/61 
     
     - 如果等待时间过长，可以参考[VIM插件安装 - 打造代码编写环境_Proprieter_sz的博客-CSDN博客](https://blog.csdn.net/Proprieter_sz/article/details/121557828)中**安装C++自动补全服务**部分的介绍

## gitconfig

记得换成自己的配置

## tmux

## zsh

### .zsh

##### 插件安装

zsh插件位于zsh/.zsh/plugin/

为了保证插件为最新版本，请手动git clone到github上的仓库到zsh/.zsh/plugin/下，如：

```shell
cd ~/.dotfiles/zsh/.zsh/plugin/
git clone git@github.com:zsh-users/zsh-syntax-highlighting.git
```

然后在zsh/.zshrc中添加启用即可，其他配置可以参考我的

```
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
```

##### 关于p10k

运行`p10k configure`修改我的配置
