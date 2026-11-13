#!/bin/sh

APPNAME=$(basename "$0")

while [ $# -gt 0 ]; do
    case "$1" in
    -v | -V | --version)
        echo "$APPNAME (nosuspend) v0.1 by Seongjae Kim"
        echo "systemd-inhibit helper script."
        exit 0
        ;;
    -h | --help)
        echo "Usage: $APPNAME [options] argument..."
        exit 0
        ;;
    --)
        shift
        break
        ;;
    --* | -*)
        echo "$APPNAME: error: invalid option: $1" >&2
        exit 1
        ;;
    *)
        break
        ;;
    esac
done

if [ "$#" -eq 0 ]; then
    echo "$APPNAME: error: missing argument" >&2
    exit 1
fi

exec systemd-inhibit --what=sleep:idle --why="nosuspend is running" "$@"
