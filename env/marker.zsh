#!/bin/zsh
# Sets up env vars for Marker and sources init script

export MARKER_SOURCE=~/.local/share/marker/marker.sh

[[ -s $MARKER_SOURCE ]] && source $MARKER_SOURCE
bindkey '\em' _marker_mark_1
bindkey '\ej' _marker_mark_2
bindkey '^j' _move_cursor_to_next_placeholder Overwrites an "accept line" keybind
