# Zsh

## Install Plugins

zsh 插件位于 `$HOME/.dotfile/zsh/.zsh/plugin/` 中，脚本会自动创建并安装如下插件（必装，否则需要改 `.zshrc` 文件）

- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [powerlevel10k](https://github.com/romkatv/powerlevel10k)

手动安装其他插件请按照如下步骤

1. git clone 对应仓库到 `zsh/.zsh/plugin/` 下

```shell
cd ~/.dotfiles/zsh/.zsh/plugins/
git clone git@github.com:zsh-users/zsh-autosuggestions.git
```

2. 将 `source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh` 添加至 `zsh/.zshrc` 中（已使用的插件默认已添加）

## About Plugin p10k

如有需要，运行 `p10k configure` 修改配置

## $HOME/.zshrc_profile

用于填写本地的 zshrc 配置，比如一些 export