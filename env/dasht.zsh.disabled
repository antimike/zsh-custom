#!/bin/zsh
# Env variables for dasht (offline docs browser)
# See https://github.com/sunaku/dasht

export DASHT_SRC=~/Source/dasht
export DASHT_DATA=~/.local/share/dasht

# Add executables to PATH
export path=( $path "$DASHT_SRC/bin" )

# Man pages
export manpath=( : "$DASHT_SRC/man" $manpath )

# Completions
export fpath=( $fpath $DASHT_SRC/etc/zsh/completions )

# Docsets dir
export DASHT_DOCSETS_DIR="$DASHT_DATA/docsets"

# Cache dir
# NOTE: Using the default, ~/.cache/dasht, leads to some extremely weird
# behavior by wget: content is successfully downloaded but wget silently fails
# to write it to the cache dir
export DASHT_CACHE_DIR="$DASHT_DATA/.cache"
