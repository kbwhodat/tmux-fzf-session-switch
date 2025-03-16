#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

function main {
    local sessions
    local session
    local query
    local sess_arr
    local retval
    # List sessions with session name and attachment state
    local fzf_command=(fzf --exit-0 --print-query --reverse --delimiter=":" --with-nth=1)

    if [ "${PREVIEW_ENABLED}" = "1" ]; then
        # If you have a preview script for sessions, adjust the path as needed
        fzf_command+=(--preview "$CURRENT_DIR/preview_session.sh {}" --preview-window=right:60%)
    fi

    sessions=$(tmux list-sessions -F "#{session_name}" | "${fzf_command[@]}")
    retval=$?

    IFS=$'\n' read -rd '' -a sess_arr <<<"$sessions"
    session="${sess_arr[1]}"
    query="${sess_arr[0]}"

    if [ $retval -eq 0 ]; then
        if [ -z "$session" ]; then
            session="$query"
        fi
        # Split the selected line into fields using the delimiter ":"
        session_details=(${session//:/ })
        local session_name="${session_details[0]}"
        # Confirm deletion before killing the session
        tmux kill-session -t $session_name
    fi
}

main
