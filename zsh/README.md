# Zsh

## Install Plugins

TODO: write script to automatic download

zsh插件位于.dotfile/zsh/.zsh/plugin/。为了保证插件为最新版本，请手动git clone仓库到zsh/.zsh/plugin/下，并在zsh/.zshrc添加配置

```shell
cd ~/.dotfiles/zsh/.zsh/plugins/
git clone git@github.com:zsh-users/zsh-syntax-highlighting.git
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
```

鄙人目前使用的插件有

- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [powerlevel10k](https://github.com/romkatv/powerlevel10k)（必装，不然你要改我的.zshrc）

## About Plugin p10k

如有需要，运行`p10k configure`修改配置

## .zshrc_profile

用于填写本地的zshrc配置，比如一些export
