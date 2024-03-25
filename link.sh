#!/bin/bash

## =================================================================
## Supported environment
##  * Ubuntu
## =================================================================

source utils.sh

pushd $DOTFILES
for folder in *; do
  if [ -d "$folder" ] && check_ignore $folder $IGNORE_FILE; then
		echo "link start --- $folder"
    
    if [ -f "$folder/$LINK_FILE" ]; then
      source "$folder/$LINK_FILE" $folder " $STOWFLAGS"
    else
      stow --restow $folder $STOWFLAGS
    fi
	fi
done
popd
