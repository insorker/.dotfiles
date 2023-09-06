#!/bin/bash

TARGET=$HOME/.config/nvim

if [ ! -d "$TARGET" ]; then
  mkdir $TARGET
fi

stow --target=$TARGET --restow $1 $2
