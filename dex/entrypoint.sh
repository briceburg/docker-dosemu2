#!/usr/bin/env bash

cmd=${DOSEMU_CMD:-'echo'}
flags=${DOSEMU_FLAGS:-'-E'}
export DEX_DOCKER_WORKSPACE_DOS="${DEX_DOCKER_WORKSPACE//\//\\}"

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

exec dosemu $flags "$cmd" 2>/dev/null
exit $?
