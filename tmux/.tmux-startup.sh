#!/bin/bash

if [ -n "$TMUX" ]; then
  return
fi

echo "Starting TMUX"
tmux ls 2>/dev/null

if [ $? != 0 ]; then
  echo "No active sessions found. Creating default session"
  tmux new -s Default
else
  echo "Opening last tmux session"
  tmux a
fi