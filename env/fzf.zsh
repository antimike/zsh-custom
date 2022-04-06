#!/bin/zsh

typeset preview_cmd='pistol {${FZF_FIELD:-}}'
# FZF default
# Not sure what this next line is for or who told me to put it in here...
# export FZF_BASE=${${:-=fzf}:P:h2}/shell
if [[ -f "$HOME/.fzfrc" ]]; then
    source "$HOME/.fzfrc"
else
    export FZF_DEFAULT_OPTS='--ansi -m --height 50% --border --info=inline --cycle'
    if type fd &> /dev/null; then
        export FZF_DEFAULT_COMMAND="fd --type file --follow --hidden --color=always"
    elif type rg &> /dev/null; then
        export FZF_DEFAULT_COMMAND="rg -p --hidden --files"
    fi
fi

# Bibtex source for FZF
export FZF_BIBTEX_CACHEDIR="$HOME/.fzf_bibtex_cache"
export FZF_BIBTEX_SOURCES="$PAPIS_LIBRARY/library.bib"
