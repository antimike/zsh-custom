#!/bin/zsh -f
# Basic IO convenience functions

autoload colors
declare -A inform_color=(
    [info]="${reset_color}"
    [debug]="${fg_bold[yellow]}${bg[blue]}"
    [success]="${fg_bold[green]}"
    [warn]="${fg_bold[yellow]}"
    [error]="${fg_bold[red]}"
)

declare -A inform_verbosity=(
    [error]=-1
    [warn]=0
    [info]=1
    [success]=0
    [debug]=2
)

io_format() {
    local -i vb=${inform_verbosity[$1]} st=$?
    local cl=${inform_color[$1]}
    shift
    (( vb <= verbosity )) && print -u 2 -- "${cl}${@}${reset_color}"
    return $st
}

debug() {
    io_format debug "DEBUG:${__NAME__}:${funcstack[2]}@${LINENO}: $@"
}

inform() {
    io_format info $@
}

warn() {
    io_format warn "WARNING: $@"
}

error() {
    io_format error "ERROR: $@"
}

fail() {
    error ${@[2,-1]}
    exit $1
} >&2

