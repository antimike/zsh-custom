#!/bin/zsh
# Enables use of rl_custom_function hack
# See https://github.com/lincheney/fzf-tab-completion

export LD_PRELOAD=~/.local/lib/librl_custom_function.so
if [[ ! -e $LD_PRELOAD ]] unset LD_PRELOAD
