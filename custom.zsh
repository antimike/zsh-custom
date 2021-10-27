#!/bin/zsh
# Source files in zshrc.d subrepo and autoload functions

# ${(%):-%x} is the zsh equivalent of ${BASH_SOURCE[0]}
# The :h modifier prints the parent directory ("head")
export SCRIPTDIR="${${(%):-%x}:h}"
export SCRIPT_INIT="${SCRIPTDIR}/init.zsh"

# Each "functions" dir must be added separately to fpath
# The (:a) qualifier ensures the absolute path is printed
fpath+=( $SCRIPTDIR/**/functions(:a) )
fpath+=( $SCRIPTDIR/**/completion(:a) )

ignored=(
    "${${(%):-%x}:t}"     # This file
    .git
    dev
    themes
    plugins
)
opts=( "-o -name" )

if [[ ! -e $SCRIPT_INIT || $SCRIPT_INIT -ot .git ]]; then
    find $SCRIPTDIR \
        \( -false ${=opts::=${opts:^^ignored}} \) -prune \
        -o \( -type f -name "*.zsh" \) \
        -fprintf "$SCRIPT_INIT" 'source "%p"; \n' \
        -o \( -type f -path "*/functions/*" \) \
        -fprintf "$SCRIPT_INIT" 'autoload "%f"; \n'
    () (
        cd $SCRIPTDIR
        grep -q $SCRIPT_INIT .gitignore ||
            print -- ${SCRIPT_INIT}(:t) >>.gitignore
        git add .gitignore &&
            git commit -q -o .gitignore -m "Added rule for init script" \
                -m "Init script is dynamically produced as-needed by custom.zsh"
    ) 2>/dev/null
fi

source $SCRIPT_INIT
