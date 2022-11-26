# insorker's dotfile

什么是[dotfile](https://wiki.archlinux.org/title/Dotfiles)？正如字面意思，dotfile是一些以"."开头的隐藏文件，通常是用户程序的配置文件。由于不同的配置文件数量庞大、位置五花八门，导致迁移个人配置非常困难，所以统一管理和版本控制成了一个迫切的需求。

以下是我的配置，以及dotfile管理方案。

|          |   OS  | shell |
| -------- | ----- | ----- |
| insorker | Linux |  zsh  |

## New System

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

## Basic Setup

安装zsh

```shell
sudo apt install zsh
```

安装stow

```shell
sudo apt-get install stow
```

git clone

```shell
cd ~
git clone --depth=1 git@github.com:insorker/.dotfiles.git
```

运行脚本安装配置，非zsh用户请修改shell解释器

> 注意，请确保家目录下不存在.dotfile中同名文件/文件夹/链接。如有冲突，请手动调整
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

删除配置【安装时无需操作】

```shell
./clear.sh
```

更多配置请查阅各个文件夹下的README

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

使用[LTS version](https://github.com/nvm-sh/nvm#long-term-support)，wsl连接不上的话，建议手动开一下[梯子](https://zhuanlan.zhihu.com/p/451198301)

```shell
nvm install --lts
nvm use --ltsn
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
