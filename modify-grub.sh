#!/bin/sh

set -e

if [ "$(id -u)" -ne 0 ]; then
    echo "$0: You must run this as root" >&2
    exit 1
fi

if [ -z "${EDITOR:-}" ]; then
    EDITOR=vim
fi

$EDITOR /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg
