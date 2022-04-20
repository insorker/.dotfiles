# 配置文件使用

管理个人配置文件

由于我用的是**zsh**作为shell脚本，使用其他shell的用户请酌情修改

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
>
> 如果出现报错，可能是由于$HOME下存在同名文件，且同名文件不是链接或文件夹，需要手动判断是否删除

```shell
./link.sh
```

删除所有配置

```shell
./clear.sh
```

## 好用的工具

推荐在linux上安装的工具

### ccache

*加速gcc*

参考man手册中的run modes进行配置

### tldr

*too long didn't read*

### ctags

*配合vim*

### bear

*配合vim clangd*

### [nvm](https://github.com/nvm-sh/nvm)

*配置各种版本的nodejs和npm*

> 在wsl，连接不上的话，建议手动开一下[梯子](https://zhuanlan.zhihu.com/p/451198301)

下载[LTS version](https://github.com/nvm-sh/nvm#long-term-support)

````shell
nvm install --lts
nvm use --ltsn
````

### [ripgrep](https://github.com/BurntSushi/ripgrep)

*代替grep*

### [fzf](https://github.com/junegunn/fzf)

*命令行下的模糊搜索*

⚠️ Key bindings (CTRL-T / CTRL-R / ALT-C) and fuzzy auto-completion may not be enabled by default.

Refer to the package documentation for more information. (e.g. apt-cache show fzf)

`CTRL-T` 查找目录下条目

`CTRL-R` 查找历史命令

---

***未启用***

### mosh

*代替ssh*

### jq

*json文件处理及格式化显示*

### yapf

*Google开发的python代码格式规范化工具，支持pep8以及Google代码风格*

### 其他

[链接](https://www.zhihu.com/question/59227720/answer/163594782?utm_source=qq&utm_medium=social&utm_oi=691733779890319360)

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
   
    > 更新了nodejs安装方式，推荐通过nvm安装（详见上文【好用的工具】）
    >
    > 如果不通过nvm安装，可以选择如下方式
    
    https://github.com/nodesource/distributions/blob/master/README.md
    
2. 默认安装的插件是java、python、clangd和json，有其他需求可以修改 
   
   ```
   let g:coc_global_extensions = ['coc-java', 'coc-pyright', 'coc-clangd', 'coc-json']
   ```
   
   其他extensions详见https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions

3. 打开对应的后缀文件查看提示信息
   
   - java需要安装jdk
   
   - c/cpp文件需要安装[clangd](https://clangd.llvm.org/installation.html#project-setup)（我的设置，也可以不这样），使用`:CocCommand clangd.install`命令即可。
     
     - 如果出现错误，可以参考https://github.com/clangd/coc-clangd/issues/61 
     
     - 如果等待时间过长，可以参考[VIM插件安装 - 打造代码编写环境_Proprieter_sz的博客-CSDN博客](https://blog.csdn.net/Proprieter_sz/article/details/121557828)中**安装C++自动补全服务**部分的介绍
     
     - 最后我建议的方法是
     
       > 1. 打开clangd开源仓库[GitHub - clangd/clangd: clangd language server](https://github.com/clangd/clangd)在右边Releases处选择发行版本，下载最新版，或者wget，但太慢了
       > 2. 创建如下文件夹并`cd ~/.config/coc/extensions/coc-clangd-data/install`
       > 3. 把下载好的文件放到这个文件夹下
       > 4. 用unzip命令解压压缩包`unzip clangd-linux-13.0.0.zip`
       >
       > 5. 跳转到`cd ~/.vim/`，编辑`coc-settings.json`，添加如下内容（根据版本修改）
       >
       > ```json
       > {
       > 	"clangd.path": "~/.config/coc/extensions/coc-clangd-data/install/clangd_13.0.0/bin/clangd"
       > }
       > ```

#### bear

clangd安装完成后还要注意设置`compile_commands.json`，不然遇到大的项目，你的文件将会一片飘红（详见官方说明）。

个人推荐官网的推荐**bear**

```shell
sudo apt-get bear
```

使用也很简单，就是

```shell
bear -- <your-build-command>
```

#### ctags

我只能说谁用谁知道，使用方式

```shell
ctags -R
```

## gitconfig

记得换成自己的配置

## tmux

```c
tmux source-file ~/.tmux.conf
```

## zsh

### .zsh

#### 插件安装

zsh插件位于zsh/.zsh/plugin/

为了保证插件为最新版本，请手动git clone到github上的仓库到zsh/.zsh/plugin/下，如：

```shell
cd ~/.dotfiles/zsh/.zsh/plugins/
git clone git@github.com:zsh-users/zsh-syntax-highlighting.git
```

然后在zsh/.zshrc中添加启用即可，其他配置可以参考我的

```shell
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
```

我目前使用的插件：

- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [powerlevel10k](https://github.com/romkatv/powerlevel10k)（必装，不然你要改我的.zshrc）

#### 关于p10k

运行`p10k configure`修改我的配置

#### .zshrc_profile

这里面填写你自己本地的zshrc配置，比如一些export
