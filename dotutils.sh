DOTFILES=$HOME/.dotfiles
IGNOREFILES=$DOTFILES/dotignore

pushd () {
	command pushd "$@" > /dev/null
}

popd () {
	command popd > /dev/null
}

check_ignore() {
  if [ ! -f $2 ]; then
    return 0
  fi

  while read -r line; do
    if [ $1 == $line ]; then
      return 1
    fi
  done < $2

  return 0
}
