#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

function main {
    local windows
    local window
    local query
    local win_arr
    local retval

    local fzf_command=(fzf --exit-0 --print-query --reverse --delimiter=":" --with-nth=1,2,4)

    if [ "${PREVIEW_ENABLED}" = "1" ]; then
        fzf_command+=(--preview "$CURRENT_DIR/preview_window.sh {1}" --preview-window=right:60%)
    fi

    windows=$(tmux list-windows -a -F "#{session_name}:#{window_index}: #{window_name}" | "${fzf_command[@]}")
    retval=$?

    IFS=$'\n' read -rd '' -a win_arr <<<"$windows"

    window="${win_arr[1]}"
    query="${win_arr[0]}"

    if [ $retval -eq 0 ]; then
        if [ -z "$window" ]; then
            window="$query"
        fi
        tmux switch-client -t "$window"
    elif [ $retval -eq 1 ]; then
        tmux command-prompt -b -p "Press enter to create and go to [$query] window" \
            "run '$CURRENT_DIR/make_new_window.sh \"$query\" \"%1\"'"
    fi
}

main
