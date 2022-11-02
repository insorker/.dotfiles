# insorker's dotfile

你可能要问什么是[dotfile](https://wiki.archlinux.org/title/Dotfiles)。正如字面意思，dotfile是一些以"."开头的隐藏文件，通常是用户程序的配置文件。由于不同的配置文件数量庞大、位置五花八门，导致迁移个人配置非常困难，所以统一管理和版本控制成了一个迫切的需求。

以下是我的配置，以及dotfile管理方案。

|          | OS  | shell |
| -------- | --- | ----- |
| insorker | any |  zsh  |

## Basic Setup

安装stow

```shell
sudo apt-get install stow
```

git clone

```shell
cd ~
git clone --depth=1 git@github.com:insorker/.dotfiles.git
```

安装配置，非zsh用户请修改shell解释器

> 注意，请确保家目录下不存在.dotfile中同名文件/文件夹/链接。如有冲突，请手动调整。
>
> e.g.
> 
> OK: ~/.dotfile/vim/ && ~/vim/
> 
> Bad: ~/.dotfile/vim/.vimrc && ~/.vimrc
> 
> Bad: ~/.dotfile/vim/.vimrc/ && ~/.vimrc

```shell
cd .dotfile
./link.sh
```

删除配置

```shell
./clear.sh
```

## Software to Install

推荐安装的工具，本流程需要安装，不需要的自己删.zshrc

### ccache

> 加速gcc

参考man手册中的run modes进行配置

### tldr

> too long didn't read

### ctags

> 配合vim

```shell
ctags -R
```

### bear

> 配合vim clangd

```shell
sudo apt-get bear
bear -- <your-build-command>
```

### [nvm](https://github.com/nvm-sh/nvm)

> 配置各种版本的nodejs和npm

使用[LTS version](https://github.com/nvm-sh/nvm#long-term-support)，wsl连接不上的话，建议手动开一下[梯子](https://zhuanlan.zhihu.com/p/451198301)

````shell
nvm install --lts
nvm use --ltsn
````

### [ripgrep](https://github.com/BurntSushi/ripgrep)

> 代替grep

### [fzf](https://github.com/junegunn/fzf)

> 命令行下的模糊搜索

⚠️ Key bindings (CTRL-T / CTRL-R / ALT-C) and fuzzy auto-completion may not be enabled by default. Refer to the package documentation for more information. (e.g. apt-cache show fzf)

```
CTRL-T 查找目录下条目
CTRL-R 查找历史命令
```

### 其他

以下被推荐，但未被使用，本流程无需安装

#### mosh

> 代替ssh

### 其他的其他

[链接](https://www.zhihu.com/question/59227720/answer/163594782?utm_source=qq&utm_medium=social&utm_oi=691733779890319360)

## Configure Vim

其他配置参考文件内注释，这里只详细介绍插件部分。

### Install vim-plug

安装[vim-plug](https://github.com/junegunn/vim-plug)，安装过程详见链接，根据你的系统选择安装指令。安装好了后，为了提高插件下载速度修改配置文件，具体参考此[文档](https://blog.csdn.net/htx1020/article/details/114364510)，或者按以下步骤进行修改

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

### Install plugins By vim-plug

安装方法详见[Usage](https://github.com/junegunn/vim-plug#usage)，下面介绍一些需要手动配置的插件。

#### coc.nvim

访问GitHub上的网站[coc.nvim](https://github.com/neoclide/coc.nvim)了解初步配置，这里给出我的配置步骤

1. 下载node.js
   
    推荐通过[nvm](###nvm)安装，也可以[直接安装](https://github.com/nodesource/distributions/blob/master/README.md)
    
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

## Configure Zsh

### Install Plugins

zsh插件位于.dotfile/zsh/.zsh/plugin/。为了保证插件为最新版本，请手动git clone仓库到zsh/.zsh/plugin/下，如：

```shell
cd ~/.dotfiles/zsh/.zsh/plugins/
git clone git@github.com:zsh-users/zsh-syntax-highlighting.git
```

然后在zsh/.zshrc添加配置

```
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
```

本流程目前使用的插件：

- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [powerlevel10k](https://github.com/romkatv/powerlevel10k)（必装，不然你要改我的.zshrc）

#### About Plugin p10k

如有需要，运行`p10k configure`修改配置

### .zshrc_profile

填写本地的zshrc配置，比如一些export
