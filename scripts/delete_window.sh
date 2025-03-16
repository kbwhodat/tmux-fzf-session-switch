#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

function main {
    local windows
    local window
    local query
    local win_arr
    local retval
    # We list session name, window index, and window name
    local fzf_command=(fzf --exit-0 --print-query --reverse --delimiter=":" --with-nth=1,2,3)

    if [ "${PREVIEW_ENABLED}" = "1" ]; then
        fzf_command+=(--preview "$CURRENT_DIR/preview_window.sh {}" --preview-window=right:60%)
    fi

    # List all windows in the format session:window_index:window_name
    windows=$(tmux list-windows -a -F "#{session_name}:#{window_index}:#{window_name}" | "${fzf_command[@]}")
    retval=$?

    IFS=$'\n' read -rd '' -a win_arr <<<"$windows"
    window="${win_arr[1]}"
    query="${win_arr[0]}"

    if [ $retval -eq 0 ]; then
        # If no window field is returned, default to using the query line
        if [ -z "$window" ]; then
            window="$query"
        fi
        # Split the selected line on the delimiter ':'
        session_window=(${window//:/ })
        local session_name="${session_window[0]}"
        local window_index="${session_window[1]}"

        tmux kill-window -t $session_name:$window_index
    fi
}

main
