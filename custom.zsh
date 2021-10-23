#!/bin/zsh
# Source files in zshrc.d subrepo and autoload functions

# ${(%):-%x} is the zsh equivalent of ${BASH_SOURCE[0]}
# The :h modifier prints the parent directory ("head")
SCRIPTDIR="${${(%):-%x}:h}/zshrc.d"

prune_git_opts() {
    local -a opts=(
        -name ".git" -prune 
        -o \( $@ \) -print
    )
    echo $opts
}

if [[ -d $SCRIPTDIR ]]; then
    source $(find $SCRIPTDIR `prune_git_opts -type f -name "*.zsh"`)
    autoload $(find $SCRIPTDIR `prune_git_opts -path "*/functions/*" -type f`)
fi
