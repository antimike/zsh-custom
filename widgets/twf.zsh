#!/bin/zsh

twf-widget() {
  local selected=$(twf --height=0.5)
  BUFFER="$BUFFER$selected"
  zle reset-prompt
  zle end-of-line
  return $ret
}
zle -N twf-widget
bindkey '^[T' twf-widget
