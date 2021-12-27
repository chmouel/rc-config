#!/usr/bin/env bash
set -eufx

cfg=$HOME/.config/gestures/xorg.conf
[[ -n ${SWAYSOCK:-""} ]] && cfg=$HOME/.config/gestures/sway.conf

libinput-gestures -c ${cfg}
