#!/bin/bash

source dotutils.sh

pushd $DOTFILES
for folder in *; do
	if [ -d "$folder" ] && check_ignore $folder $IGNOREFILES; then
		echo "link removed --- $folder"

		stow -D $folder
	fi
done
popd
