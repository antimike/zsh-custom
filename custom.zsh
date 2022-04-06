#!/bin/zsh

setopt EXTENDEDGLOB GLOBSTARSHORT

fpath+=(${ZSH_CUSTOM}/functions.zwc)
autoload -w ${ZSH_CUSTOM}/functions.zwc

. ${ZSH_CUSTOM}/{env,alias}/*.zsh
