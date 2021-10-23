#!/bin/zsh

# Tempdir for zsh-vi-mode plugin
export ZVM_TMPDIR="$HOME/.cache/nvim/tmp"
mkdir -p $ZVM_TMPDIR

function zvm_init_fzf() {
    [ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
}
