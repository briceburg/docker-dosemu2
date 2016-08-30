#!/usr/bin/env bash

cmd=${DOSEMU_CMD:-'echo'}
flags=${DOSEMU_FLAGS:-'-E'}
export DEX_HOST_PWD_DOSSAFE="${DEX_HOST_PWD//\//\\}"

# convert arguments resembling posix paths => dos paths, resolving symlinks
while [ $# -ne 0 ]; do
  case $1 in
    /*)   [ ${#1} -gt 3 ] && {
            arg=$(readlink -m $1)
            arg=${1//\//\\}
          } ;;
    *)    arg=${1//\//\\} ;;
  esac

  cmd="$cmd $arg"
  shift
done

stty cols 80 rows 25
dosemu $flags "$cmd" 2>/dev/null
retval=$?
#echo "return to sanity"
stty sane
exit $retval
