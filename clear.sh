#!/usr/bin/env bash

pushd () {
	command pushd "$@" > /dev/null
}
popd () {
	command popd "$@" > /dev/null
}

DOTFILES=$HOME/.dotfiles

pushd $DOTFILES
for folder in *; do
	if [ -d "$folder" ]; then
		echo "link removed --- $folder"

		stow -D $folder
	fi
done
popd
