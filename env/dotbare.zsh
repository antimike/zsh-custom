#!/bin/zsh

# Dotbare config
export DOTBARE_DIR="${DOTFILES}/.git"
export DOTBARE_TREE="$DOTFILES"
export DOTBARE_KEY="
  --bind=alt-a:toggle-all       # toggle all selection
  --bind=alt-j:jump             # label jump mode, sort of like vim-easymotion
  --bind=alt-0:top              # set cursor back to top
  --bind=alt-s:toggle-sort      # toggle sorting
  --bind=alt-t:toggle-preview   # toggle preview
"
export DOTBARE_DIFF_PAGER="delta"
