#!/usr/bin/env bash

current_dir=$(pwd)
session_name=$(basename "$current_dir")

if [[ "$session_name" =~ ^\. ]]; then
  session_name=${session_name:1}
fi

if ! tmux has-session -t "$session_name"; then
  tmux new-session -d -s "$session_name"
fi

tmux attach -t "$session_name"

