#!/bin/zsh
# Git-related aliases

alias gmv='git mv'
alias gre='git restore'
alias gu='gitupdate .'  # https://github.com/nikitavoloboev/gitupdate

function gbare() {
  git --git-dir="$1" --work-tree="${2:-$HOME}" $@
}
