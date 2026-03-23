#!/usr/bin/env bash

set -e

applesauce compress -c lzvn "$HOME/.cargo"
applesauce compress -c lzvn "$HOME/.cache/ra"
applesauce compress -c lzvn "$HOME/.cache/cargo"
