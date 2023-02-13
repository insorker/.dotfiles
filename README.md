# insorker's dotfile

什么是[dotfile](https://wiki.archlinux.org/title/Dotfiles)？正如字面意思，dotfile是一些以"."开头的隐藏文件，通常是用户程序的配置文件。由于不同的配置文件数量庞大、位置五花八门，导致迁移个人配置非常困难，所以统一管理和版本控制成了一个迫切的需求。

以下是我的配置，以及dotfile管理方案。

|          |   OS  | shell |
| -------- | ----- | ----- |
| insorker | Linux |  zsh  |

## Configure new system (optional)

如果你是新安装的系统，需要换源和配置一下git

### source

使用[清华源 Ubuntu](https://mirror.tuna.tsinghua.edu.cn/help/ubuntu/)

```shell
cp /etc/apt/sources.list /etc/apt/sources.list.bak
sudo sed -i "s@http://.*archive.ubuntu.com@https://mirrors.tuna.tsinghua.edu.cn@g" /etc/apt/sources.list
sudo sed -i "s@http://.*security.ubuntu.com@https://mirrors.tuna.tsinghua.edu.cn@g" /etc/apt/sources.list
sudo apt update
sudo apt upgrade
```

### git

```shell
git config --global user.name "username"
git config --global user.email "email"
ssh-keygen -t rsa -C "email"
cat ~/.ssh/id_rsa.pub
```

然后该做什么就不多说了

### zsh

安装zsh

```shell
sudo apt install zsh
```

## Basic setup

安装stow

```shell
sudo apt-get install stow
```

git clone 本项目

```shell
cd ~
git clone --depth=1 git@github.com:insorker/.dotfiles.git
```

运行脚本安装配置

> 注意！！！请确保家目录下不存在.dotfile中同名文件/文件夹/链接。如有冲突，请手动调整
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
./dotlink.sh
```

尝试运行但不安装，并显示详细信息

```shell
cd .dotfile
./dotlink.sh -nv
```

删除配置【安装时无需操作】

```shell
./dotclear.sh
```

更多配置请查阅各个文件夹下的README.md

## Advance setup

### dotlink.sh

输入命令`./dotlink.sh -h`查看帮助

### How to ignore files

你可以在`.dotfiles`文件夹下创建`dotignore`文件，并在其中声明了当前文件夹下你所不需要的配置，如以下示例代码

```
cd ~/.dotfiles
touch dotignore
echo "vim" >> dotignore
```

同时，你也可以在 stow package （即`.dotfiles`下的子文件夹）中声明你不需要的配置。和上面不同的是，你需要使用 stow 的`.stow-local-ignore`文件，如以下示例代码

```
cd ~/.dotfiles/nvim
touch .stow-local-ignore
echo "README.md" >> .stow-local-ignore
```

> 在没有 .stow-local-ignore 的情况下，stow 会默认忽略一些文件如 README.md。新建 .stow-local-ignore 后，请按照需求将它们添加进配置中

### How to define specific config

在 stow package 中创建 dotlink.sh 文件。因为目前只是自用的，所以没搞得很简单易用，好在代码很短，你可以试着 RTFSC

## Software to Install

推荐安装的工具，不需要的自己删.zshrc中的相关配置

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

使用[LTS version](https://github.com/nvm-sh/nvm#long-term-support)，wsl连接不上的话，建议手动开一下[梯子](https://zhuanlan.zhihu.com/p/451198301)，不开梯子的话可以选择[换源淘宝源](https://www.zhihu.com/question/52918484?utm_id=0)

当然也可能是[ curl 的问题](https://www.likecs.com/ask-1274765.html)，总之就是很逆天啦

```shell
nvm install --lts
nvm use --lts
```

### [cz-cli](https://github.com/commitizen/cz-cli)

> 更好的git commit

```shell
npm install commitizen -g
commitizen init cz-conventional-changelog --save-dev --save-exact
```

### [ripgrep](https://github.com/BurntSushi/ripgrep)

> 代替grep

### [fzf](https://github.com/junegunn/fzf)

> 命令行下的模糊搜索

⚠️ Key bindings (CTRL-T / CTRL-R / ALT-C) and fuzzy auto-completion may not be enabled by default. Refer to the package documentation for more information. (e.g. apt-cache show fzf)

```
CTRL-T 查找目录下条目
CTRL-R 查找历史命令
```

### [fd](https://github.com/sharkdp/fd#installation)

> alternative to find

Make sure that $HOME/.local/bin is in your $PATH.

```zsh
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi
```

```shell
sudo apt install fd-find
ln -s $(which fdfind) ~/.local/bin/fd
```

### [lazygit](https://github.com/jesseduffield/lazygit)

> lazy git and cooperate with nvim.toggleterm

快捷键详见[keybindings](https://github.com/jesseduffield/lazygit/blob/master/docs/keybindings/Keybindings_zh.md)，太多了以后整理

### 其他

以下被推荐，但未被使用，本流程无需安装

#### mosh

> 代替ssh

### 其他的其他

[链接](https://www.zhihu.com/question/59227720/answer/163594782?utm_source=qq&utm_medium=social&utm_oi=691733779890319360)
