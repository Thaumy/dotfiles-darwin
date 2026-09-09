#!/usr/bin/env dash

if [ $# -eq 1 ]; then
  case "$1" in
  /*)
    echo -n "$1" | pbcopy
    ;;
  *)
    echo -n "$(pwd)/$1" | pbcopy
    ;;
  esac
else
  echo -n "$(pwd)" | pbcopy
fi
