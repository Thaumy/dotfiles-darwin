#!/usr/bin/env bash

if [ $# -eq 1 ] ; then
  echo -n "$(pwd)/$1" | pbcopy
else
  echo -n "$(pwd)" | pbcopy
fi
