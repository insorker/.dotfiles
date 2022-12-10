#!/bin/bash

TARGET=$HOME/.config/nvim

stow --target=$TARGET --restow $1 $2
