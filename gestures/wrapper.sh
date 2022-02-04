#!/usr/bin/env bash
set -eufx

cfg=$HOME/.config/gestures/xorg.conf
[[ -n ${SWAYSOCK:-""} ]] && cfg=$HOME/.config/gestures/sway.conf
[[ -n ${GDMSESSION:-""} && $GDMSESSION == gnome-wayland ]] && exit 0

libinput-gestures -c ${cfg}
