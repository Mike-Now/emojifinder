
_EMOJIFIND_DIR="${0:A:h}"

emojifind() {

    if ! [[ -f "$EMOJIFIND_EMOJIFY_PATH" ]]; then
        echo Set EMOJIFIND_EMOJIFY_PATH variable to emojify script path 1>&2
        return 1
    fi

    setopt localoptions pipefail 2> /dev/null
    local matches

    python3 $_EMOJIFIND_DIR/list-emojify.py $EMOJIFIND_EMOJIFY_PATH | eval "fzf --height=33% -m" \
        | awk '{print $1}' | while read item; do
        echo -n "${(q)item}"
    done
    local ret=$?
    echo
    return $ret
}

emojifind_widget() {
    LBUFFER="${LBUFFER}$(emojifind)"
    local ret=$?
    zle reset-prompt
    return $ret
}

zle -N emojifind_widget
if [[ "$EMOJIFIND_HOTKEY" != "" ]]; then
    bindkey "$EMOJIFIND_HOTKEY" emojifind_widget
fi
