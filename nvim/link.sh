#!/bin/bash

TARGET=$HOME/.config

if [ ! -d "$TARGET" ]; then
  mkdir -p $TARGET
fi

stow --target=$TARGET --restow $1 $2
