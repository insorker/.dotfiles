<h1 align="center">insorker's dotfiles</h1>

什么是 [dotfiles](https://wiki.archlinux.org/title/Dotfiles)？正如字面意思，dotfiles 是一些以"."开头的隐藏文件，通常是用户程序的配置文件。由于不同的配置文件数量庞大、位置五花八门，导致迁移个人配置非常困难，所以统一管理和版本控制成了一个迫切的需求。

以下是我的系统配置，以及 dotfiles 管理方案。

|          |      OS     | shell |
| -------- | ----------- | ----- |
| insorker | Ubuntu(WSL) |  zsh  |

除了这篇 README 外，每个子文件夹下也有一份 README，请务必仔细阅读。

> 这份配置目前仅适合阅读借鉴（如果有值得借鉴的地方的话），不推荐直接使用，理由如下
> 
> 1. 这不是通用配置，是我的个人配置，里面不可避免的存在我个人的使用习惯和喜好
> 
> 2. 文档确实存在不完善的地方，每次对文档的更新可能都要等到我装新系统的那一天
>
> 当然如果你对上述理由并不介意，直接使用也是没有问题的

## 新系统配置

在配置新安装的系统前，需要换源、配置 git 和安装 zsh。

### 换源

```shell
# 备份
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
# 进入 vim 编辑
sudo vi /etc/apt/sources.list
# vim 命令，全选删除插入
ggVGdi

粘贴对应镜像源，如[清华源 Ubuntu](https://mirror.tuna.tsinghua.edu.cn/help/ubuntu/) 

# 离开 vim
<Esc>:wq!
# 更新
sudo apt update
sudo apt upgrade
```

### 配置 git

```shell
git config --global user.name "username"
git config --global user.email "email"
ssh-keygen -t rsa -C "email"
cat ~/.ssh/id_rsa.pub
```

然后将 ssh key 复制到 https://github.com/settings/keys 中，配置 github

完成后，在终端输入 `ssh -T git@github.com`，收到问题后请输入 `yes` 并回车。如果完成后收到 `Hi ···`，则配置成功。

### 安装zsh

```shell
sudo apt install zsh
chsh -s /bin/zsh
```

重启后可以看到 zsh 默认配置选项，选择 `q` 退出。

## 基础配置

### 安装stow

```shell
sudo apt-get install stow
```

### 引入本项目配置

```shell
cd ~ && git clone --depth=1 git@github.com:insorker/.dotfiles.git && cd .dotfiles && ls
```

### 运行脚本安装配置

> 注意！！！ 如果你不是新系统，请确保家目录下不存在.dotfile中同名文件/文件夹/链接。如有冲突，请手动调整
>
> e.g.
> 
> OK: ~/.dotfile/vim/ && ~/vim/
> 
> Bad: ~/.dotfile/vim/.vimrc && ~/.vimrc
> 
> Bad: ~/.dotfile/vim/.vimrc/ && ~/.vimrc

查看帮助

```shell
./link.sh -h
./unlink.sh -h
```

【**安装前务必运行一次**】尝试运行命令但不安装/卸载，并显示详细信息

```shell
./link.sh -sv
./unlink.sh -sv
```

安装配置

```shell
./link.sh
```

删除配置

```shell
./unlink.sh
```

安装配置后请重启终端，部分报错属于正常现象，完成所有配置后不会出现报错。

**后续配置请查阅各个文件夹下的 README.md**

## WSL 配置（可选）

### 配置 open 与 code 命令

新建 `~/.zshrc_profile` 文件，添加如下内容并保存。

```shell
# open windows folder
alias open=/mnt/c/Windows/explorer.exe
# code with vscode
alias code="/mnt/c/Users/26773/AppData/Local/Programs/Microsoft\ VS\ Code/bin/code"
```

code 的路径是 windows 系统中 vscode 的安装路径，请按需修改。

### 基本使用

用 windows 打开：open [文件]

用 vscode 打开：code .

### 配置 Windows Terminal

#### 主题

挑选喜欢的主题 [Windows Terminal Themes](windowsterminalthemmes.dev)，打开 settings.json 文件，粘贴至 `schemes` 中，最后在配置文件的外观中更换为对应主题

#### 字体

挑选喜欢的字体 [Nerd Font](nerdfonts.com) 并安装，在配置文件的外观中更换为对应字体

#### 其他

将 settings.json 中的 copyOnSelect 改为 true

### proxy

不同的人会有不同的需求，我这里只贴出我的需求，详见[镜像模式](https://zhuanlan.zhihu.com/p/659074950)部分

即，在`C:\Users\{username}`下创建`.wslconfig`文件夹，加入这段配置

```
[experimental]
networkingMode=mirrored
dnsTunneling=true
firewall=true
autoProxy=true
```

### input latency

亲测 zsh-syntax-highlighting 会导致命令行输入卡顿，详见[syntax highlighting is super slow in WSL2](https://github.com/zsh-users/zsh-syntax-highlighting/issues/790)

解决方法就是

> I solved this by excluding windows directories from $PATH by adding following in `/etc/wsl.conf`. Create the file if it doesn't exist
> 
> ```
> [interop]
> appendWindowsPath = false
> ```
>
> Then restart wsl with `wsl --shutdown`

当然这样就不能使用一些 windows 中的命令了，需要自行配置（已配置部分，如 code）。如果不介意卡顿的话，可以跳过这步。

## 进阶配置（可选）

无自定义安装需求的话可以跳过。

### 关于 link.sh

输入命令`./link.sh -h`查看帮助

### 忽视部分配置

你可以在`.dotfiles`文件夹下创建`.linkignore`文件，并在其中声明了当前文件夹下你所不需要的配置文件夹名，如以下示例代码

```
cd ~/.dotfiles
touch .linkignore
echo "vim" >> .linkignore
```

同时，你也可以在 `stow package` （即`.dotfiles`下的子文件夹）中声明你不需要的配置。和上面不同的是，你需要使用 stow 的 `.stow-local-ignore` 文件，如以下示例代码

```
cd ~/.dotfiles/nvim
touch .stow-local-ignore
echo "README.md" >> .stow-local-ignore
```

> 在没有 `.stow-local-ignore` 的情况下，stow 会默认忽略一些文件如 README.md。新建 `.stow-local-ignore` 后，请按照需求将它们添加进配置中。

### 特殊链接目录

`~/.dotfiles/link.sh` 的策略是将 stow package 直接链接到 $HOME 目录下。

如果有特殊目录需求（如，安装路径不是`~`，而是`~/.config`），可以参考 nvim 目录的配置。

## 其他软件

推荐安装的工具，不需要的自己删.zshrc中的相关配置

### 启用中

<details>
  <summary><a href="https://github.com/ccache/ccache">ccache</a></summary>

用途：加速gcc

安装：参考 man 手册中的 run modes 进行配置（已默认在 .zshrc 中配好）
</details>

<details>
  <summary><a href="https://github.com/nvm-sh/nvm">nvm</a></summary>

用途：配置各种版本的 nodejs 和 npm

安装：使用[LTS version](https://github.com/nvm-sh/nvm#long-term-support)，wsl连接不上的话，建议手动开一下[梯子](https://zhuanlan.zhihu.com/p/451198301)，不开梯子的话可以选择[换源淘宝源](https://www.zhihu.com/question/52918484?utm_id=0)

当然也可能是[ curl 的问题](https://www.likecs.com/ask-1274765.html)，总之就是很逆天啦

使用：

```shell
nvm install --lts
nvm use --lts
```
</details>

<details>
  <summary><a href="https://github.com/commitizen/cz-cli">cz-cli</a></summary>

用途：更好的 git commit

安装：`npm install commitizen -g`

使用：`commitizen init cz-conventional-changelog --save-dev --save-exact`
</details>

<details>
  <summary><a href="https://github.com/junegunn/fzf">fzf</a></summary>

用途：命令行下的模糊搜索

安装：见官网，key bindings 已经配置好了（⚠️ Key bindings (CTRL-T / CTRL-R / ALT-C) and fuzzy auto-completion may not be enabled by default. Refer to the package documentation for more information. (e.g. apt-cache show fzf)）

使用：

```shell
CTRL-T 查找目录下条目
CTRL-R 查找历史命令
```
</details>

<details>
  <summary><a href="#">unzip</a></summary>

用途：nvim 中要用

安装：`sudo apt install unzip`
</details>

<details>
  <summary><a href="#">build-essential</a></summary>

用途：为了 gcc

安装：`sudo apt install build-essential`
</details>

<details>
  <summary><a href="https://github.com/tldr-pages/tldr">tldr</a></summary>

用途：too long didn't read，由于 chatgpt 的诞生，我个人觉得 RTFM 相比于 RTFAI 略显颓势
</details>

<details>
  <summary><a href="https://github.com/jesseduffield/lazygit">lazygit</a></summary>

用途：lazy git and cooperate with nvim.toggleterm

使用：快捷键详见[keybindings](https://github.com/jesseduffield/lazygit/blob/master/docs/keybindings/Keybindings_zh.md)，太多了以后整理
</details>

<details>
  <summary><a href="https://www.docker.com/">docker</a></summary>

用途：开发

安装：https://docs.docker.com/engine/install/ubuntu/

换源：阿里源：https://cr.console.aliyun.com/cn-hangzhou/instances/mirrors
</details>

<details>
  <summary><a href="#">tree</a></summary>

安装：`sudo apt install tree`
</details>

<details>
  <summary><a href="#">rlwrap</a></summary>

用途：支持上下左右切换命令，比如用在 sqlite 的命令行中

安装：`sudo apt install rlwrap`
</details>

### 已弃用

<details>
  <summary><a href="https://github.com/rizsotto/Bear">bear</a></summary>

用途：配合vim clangd

安装：`sudo apt-get install bear`

使用：`bear -- <your-build-command>`
</details>

<details>
  <summary><a href="https://github.com/universal-ctags/ctags">ctags</a></summary>

用途：配合 vim

使用：

```shell
ctags -R
```
</details>

<details>
  <summary><a href="https://github.com/BurntSushi/ripgrep">ripgrep</a></summary>

用途：代替 grep
</details>

<details>
  <summary><a href="https://github.com/sharkdp/fd#installation">fd</a></summary>

用途：代替 find

安装：Make sure that $HOME/.local/bin is in your $PATH.

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
</details>