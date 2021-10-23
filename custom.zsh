#!/bin/zsh
# Source files in zshrc.d subrepo and autoload functions

# ${(%):-%x} is the zsh equivalent of ${BASH_SOURCE[0]}
# The :h modifier prints the parent directory ("head")
SCRIPTDIR="${${(%):-%x}:h}/zshrc.d"

_prune() {
    # Ignores contents of .git/ and dev/
    local -a opts=(
        -name ".git" -o -name "dev" -prune 
        -o \( $@ \) -print
    )
    echo $opts
}

if [[ -d $SCRIPTDIR ]]; then
    source $(find $SCRIPTDIR `_prune -type f -name "*.zsh"`)
    autoload $(find $SCRIPTDIR `_prune -path "*/functions/*" -type f`)
fi
