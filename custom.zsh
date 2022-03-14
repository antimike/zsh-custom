#!/bin/zsh
# Source files in zshrc.d subrepo and autoload functions

# ${(%):-%x} is the zsh equivalent of ${BASH_SOURCE[0]}
# The :h modifier prints the parent directory ("head")
export SCRIPTDIR="${${(%):-%x}:h}"

() {
    setopt EXTENDEDGLOB GLOBSTARSHORT
    local ignored_dirs=(
        .git
        dev
        themes
        plugins
        lib
    )

    # Ensure that this file is not sourced again
    local ignored="$SCRIPTDIR/(${(j:|:)ignored_dirs})/***"
    #print -- ${~ignored}

    # Add each "functions" and "completion" dir to fpath
    fpath+=( $SCRIPTDIR/**/functions~${~ignored}(/) )
    fpath+=( $SCRIPTDIR/**/completion~${~ignored}(/) )

    for file in $SCRIPTDIR/**/*.zsh~${~ignored}~${(%):-%x}(.:A); do
        source -- $file
    done
    autoload -- $SCRIPTDIR/**/functions/*~${~ignored}~*.zsh(.:t)

    # Hooks
    # TODO: Do this more systematically
    chpwd_functions+=(chpwd_project_env)
}
