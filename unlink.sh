#!/bin/bash

source utils.sh

pushd $DOTFILES
for folder in *; do
	if [ -d "$folder" ] && check_ignore $folder $IGNOREFILES; then
		echo "link removed --- $folder"

    if [ -f "$folder/$UNLINK_FILE" ]; then
      source "$folder/$UNLINK_FILE" $folder " $STOWFLAGS"
    else
      stow -D $folder $STOWFLAGS
    fi
	fi
done
popd
