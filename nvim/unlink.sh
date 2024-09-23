#!/bin/bash

TARGET=$HOME/.config

stow --target=$TARGET -D $1 $2