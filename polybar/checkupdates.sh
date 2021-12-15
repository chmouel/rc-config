#!/usr/bin/env bash
[[ ${1} == yay ]] && {
    cd /tmp || exit
    kitty-ctrl jump -t "Arch Updates" -- yay
}
n=$(yay -Qu | wc -l)
[[ ${n} -gt 0 ]] && echo " ${n}"
