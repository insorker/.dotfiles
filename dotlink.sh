#!/bin/bash

source dotutils.sh --source-only

opts=$(getopt "svh" "$1")
STOWFLAGS=""

for opt in $opts; do
  case $opt in
    -h)
      printf "Usage:\n ./dotlink.sh [options]\n\nOptions:\n -h\t\tHelp\n -n\t\tSimulate result\n -v\t\tOutput verbose infomation"
      exit 0 ;;
    -s) STOWFLAGS+=" -n" ;;
    -v) STOWFLAGS+=" -v" ;;
    --) break ;;
  esac
done

pushd $DOTFILES
for folder in *; do
  if [ -d "$folder" ] && check_ignore $folder $IGNOREFILES; then
		echo "link start --- $folder"
    
    if [ -f "$folder/dotlink.sh" ]; then
      source $folder/dotlink.sh $folder " $STOWFLAGS"
    else
      stow --restow $folder $STOWFLAGS
    fi
	fi
done
popd
