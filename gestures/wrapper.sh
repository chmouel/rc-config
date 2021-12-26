#!/usr/bin/env bash
set -eufx

cfg=$HOME/.config/gestures/xorg.conf
[[ -n ${GDMSESSION:-""} && ${GDMSESSION} == "sway" ]] && cfg=$HOME/.config/gestures/sway.conf

libinput-gestures -c ${cfg}
