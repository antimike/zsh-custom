#!/bin/zsh
# Settings for `pass` password store and extensions

export PASSWORD_STORE_ENABLE_EXTENSIONS=true
export PASS_DIR="$HOME/.password-store"
export PASSWORD_STORE_CHARACTER_SET_NO_SYMBOLS='[a-zA-Z0-9!@#$%^&(),.:=?_]'
