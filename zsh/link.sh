#!/bin/bash

DIR_PLUGINS="$HOME/.dotfiles/zsh/.zsh/plugins"
GIT_PLUGINS=(
  "zsh-users/zsh-autosuggestions"
  "zsh-users/zsh-syntax-highlighting"
  "romkatv/powerlevel10k"
)

mkdir -p "$DIR_PLUGINS"

for plugin in "${GIT_PLUGINS[@]}"; do
  plugin_folder="$DIR_PLUGINS/${plugin##*/}"

  if [ ! -d "$plugin_folder" ]; then
    git clone "git@github.com:$plugin.git" "$plugin_folder"
  fi
done

stow --restow $1 $2