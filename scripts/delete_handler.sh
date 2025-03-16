#!/usr/bin/env bash
CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

choice="$1"
width=55
height=10
preview_option="PREVIEW_ENABLED=1"

if [ "$choice" = "w" ]; then
    tmux -w "$width" -h "$height" -y 15 -E "$preview_option $CURRENT_DIR/delete_window.sh"
elif [ "$choice" = "s" ]; then
    tmux -w "$width" -h "$height" -y 15 -E "$preview_option $CURRENT_DIR/delete_session.sh"
else
    tmux display-message "Invalid selection: $choice"
fi
