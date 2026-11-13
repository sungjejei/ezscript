#!/bin/sh

if [ $# -eq 0 ]; then
    echo "error: missing argument" >&2
    exit 1
fi

if [ -d "$1" ]; then
    ls --color=auto "$1"
elif [ -f "$1" ]; then
    if [ $(wc -l < "$1") -gt $(tput lines) ]; then
        less "$1"
    else
        cat "$1"
    fi
else
    echo "error: cannot find $1" >&2
    exit 1
fi
