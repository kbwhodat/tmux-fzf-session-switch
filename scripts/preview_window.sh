#!/usr/bin/env bash

window_id="${1}"

if [ -z "${window_id}" ]; then
  echo "No window ID provided"
  exit 1
fi

# Get the active pane of the window
active_pane=$(tmux list-panes -t "${window_id}" -F '#{pane_id} #{pane_active}' | awk '$2 == "1" {print $1}')

if [ -z "${active_pane}" ]; then
  echo "No active pane found for window ${window_id}"
  exit 1
fi

# Display the contents of the window's active pane
tmux capture-pane -ep -t "${active_pane}"
