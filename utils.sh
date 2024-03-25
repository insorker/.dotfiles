# set -o errexit

DOTFILES=$HOME/.dotfiles
LINK_FILE=link.sh
UNLINK_FILE=unlink.sh
IGNORE_FILE=.linkignore

pushd () {
	command pushd "$@" > /dev/null
}

popd () {
	command popd > /dev/null
}

check_ignore() {
  if [ ! -f $IGNORE_FILE ]; then
    return 0
  fi

  while read -r line; do
    if [ $1 == $line ]; then
      return 1
    fi
  done < $IGNORE_FILE

  return 0
}

HELP="
Usage: ./$(basename "$0") [Options]\n
\n
Options:\n
-h    Display this help\n
-s    Simulate result without execution\n
-v    Output verbose infomation\n
"
STOWFLAGS=""

OPTS=$(getopt "svh" "$1" 2>/dev/null)
if [ $? -ne 0 ]; then
  echo "Error: Invalid option provided." >&2
  echo -e $HELP >&2
  exit 1
fi

for opt in $OPTS; do
  case $opt in
    -h)
      echo -e $HELP
      exit 0 ;;
    -s) STOWFLAGS+=" -n" ;;
    -v) STOWFLAGS+=" -v" ;;
    --) ;;
  esac
done