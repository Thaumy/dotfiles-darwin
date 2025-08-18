#!/usr/bin/env bash

if [ "$1" = '-a' ]; then
  tmux capture-pane -S - -E 36 -p >/tmp/tmux-vis-pane-dump
else
  tmux capture-pane -S -1 -E 36 -p >/tmp/tmux-vis-pane-dump
fi

exec nvim /tmp/tmux-vis-pane-dump
