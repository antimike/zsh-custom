#!/bin/zsh

# FZF default
export FZF_BASE="$(dirname <<< realpath "$(which fzf)")/../shell"
if [[ -f "$HOME/.fzfrc" ]]; then
    source "$HOME/.fzfrc"
else
    export FZF_DEFAULT_OPTS='-m --height 50% --border'
    if type fd &> /dev/null; then
        export FZF_DEFAULT_COMMAND="fd --type file --follow --hidden --color=always"
    elif type rg &> /dev/null; then
        export FZF_DEFAULT_COMMAND="rg -p --hidden --files"
    fi
fi

# Bibtex source for FZF
export FZF_BIBTEX_CACHEDIR="$HOME/.fzf_bibtex_cache"
export FZF_BIBTEX_SOURCES="$PAPIS_LIBRARY/library.bib"
