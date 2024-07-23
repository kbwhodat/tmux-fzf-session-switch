#!/etc/profiles/per-user/katob/bin/bash


CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

default_key_bindings_goto="s"
default_width=55
default_height=10
default_without_prefix=false
default_search_session_only=true

tmux_option_goto="@fzf-goto-session"
tmux_option_goto_without_prefix="@fzf-goto-session-without-prefix"
tmux_option_width="@fzf-goto-win-width"
tmux_option_height="@fzf-goto-win-height"
tmux_option_search_session_only="@fzf-goto-session-only"

get_tmux_option() {
    local option=$1
    local default_value=$2
    local option_value=$(tmux show-option -gqv "$option")
    if [ -z "$option_value" ]; then
        echo "$default_value"
    else
        echo "$option_value"
    fi
}

unbind_keys() {
    local key_bindings=$1
    local without_prefix=$2

    local key
    for key in $key_bindings; do
        if [ "$without_prefix" = true ]; then
            tmux unbind -n "$key"
        else
            tmux unbind "$key"
        fi
    done
}

set_goto_session_bindings() {
    local key_bindings=$(get_tmux_option "$tmux_option_goto" "$default_key_bindings_goto")
    local without_prefix=$(get_tmux_option "$tmux_option_goto_without_prefix" "$default_without_prefix")
    local width=$(get_tmux_option "$tmux_option_width" "$default_width")
    local height=$(get_tmux_option "$tmux_option_height" "$default_height")
    local search_session_only=$(get_tmux_option "$tmux_option_search_session_only" "$default_search_session_only")

    # Unbind existing keys
    unbind_keys "$key_bindings" "$without_prefix"

    if [ "$search_session_only" = false ]; then
        if [ "$without_prefix" = true ]; then
            local key
            for key in $key_bindings; do
                tmux bind -n "$key" display-popup -w "$width" -h "$height" -y 15 -E "$CURRENT_DIR/scripts/switch_session_window.sh"
            done
        else
            local key
            for key in $key_bindings; do
                tmux bind "$key" display-popup -w "$width" -h "$height" -y 15 -E "$CURRENT_DIR/scripts/switch_session_window.sh"
            done
        fi
    else
        if [ "$without_prefix" = true ]; then
            local key
            for key in $key_bindings; do
                tmux bind -n "$key" display-popup -w "$width" -h "$height" -y 15 -E "$CURRENT_DIR/scripts/switch_session.sh"
            done
        else
            local key
            for key in $key_bindings; do
                tmux bind "$key" display-popup -w "$width" -h "$height" -y 15 -E "$CURRENT_DIR/scripts/switch_session.sh"
            done
        fi
    fi
}

main() {
    set_goto_session_bindings
}
main
