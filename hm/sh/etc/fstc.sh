#!/usr/bin/env dash

set -e

applesauce compress -c lzvn \
  "$HOME/.cargo" \
  "$HOME/.cache/ra" \
  "$HOME/.cache/cargo"
