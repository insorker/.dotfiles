# Vim

其他配置参考.vimrc文件内注释，这里只详细介绍插件部分。

## Install vim-plug

安装[vim-plug](https://github.com/junegunn/vim-plug)，安装过程详见链接，根据你的系统选择安装指令。安装好了后，为了提高插件下载速度修改配置文件，具体参考此[文档](https://blog.csdn.net/htx1020/article/details/114364510)，或者按以下步骤进行修改

1. ```
   // 找到
   let fmt = get(g:, 'plug_url_format', 'https://git::@github.com/%s.git')
   // 改为
   let fmt = get(g:, 'plug_url_format', 'https://git::@hub.fastgit.org/%s.git')
   ```

2. ```
   // 找到
   \ '^https://git::@github\.com', 'https://github.com', '')
   // 改为
   \ '^https://git::@hub.fastgit\.org', 'https://hub.fastgit.org', '')
   ```

## Install plugins By vim-plug

安装方法详见[Usage](https://github.com/junegunn/vim-plug#usage)，下面介绍一些需要手动配置的插件。

### coc.nvim

访问GitHub上的网站[coc.nvim](https://github.com/neoclide/coc.nvim)了解初步配置，这里给出我的配置步骤

1. 下载node.js，推荐通过[nvm](###nvm)安装，也可以[直接安装](https://github.com/nodesource/distributions/blob/master/README.md)
    
2. 默认安装的插件是java、python、clangd和json，有其他需求可以修改 
   
   ```
   let g:coc_global_extensions = ['coc-java', 'coc-pyright', 'coc-clangd', 'coc-json']
   ```
   
   其他extensions详见[extensions](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions)

3. 打开对应的后缀文件查看提示信息，不同语言需安装不同编译器
   
   其中c/cpp文件处理相对复杂，需要安装[clangd](https://clangd.llvm.org/installation.html#project-setup)，打开任意c/cpp文件使用`:CocCommand clangd.install`命令即可安装
     
     - 如果出现错误，可以参考https://github.com/clangd/coc-clangd/issues/61 
     
     - 如果等待时间过长，可以参考[VIM插件安装 - 打造代码编写环境_Proprieter_sz的博客-CSDN博客](https://blog.csdn.net/Proprieter_sz/article/details/121557828)中**安装C++自动补全服务**部分的介绍
     
     - 最后我建议的方法是
     
       1. 打开仓库[GitHub - clangd/clangd: clangd language server](https://github.com/clangd/clangd)，右边Releases处选择发行版本，下载最新版，或者wget（较慢）

       2. 创建如下文件夹并进入`cd ~/.config/coc/extensions/coc-clangd-data/install`

       3. 把下载好的文件放到这个文件夹下，并解压压缩包`unzip clangd-linux-13.0.0.zip`

       4. 跳转到`cd ~/.vim/`，编辑`coc-settings.json`，添加如下内容（根据clangd版本修改）

       ```json
       {
       	"clangd.path": "~/.config/coc/extensions/coc-clangd-data/install/clangd_13.0.0/bin/clangd"
       }
       ```

