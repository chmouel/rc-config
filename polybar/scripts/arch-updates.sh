#!/usr/bin/env bash
[[ ${1} == yay ]] && {
    cd /tmp || exit
    kitty --title "Arch Updates" --class floater /bin/sh -c "yay;read"
    # kitty-ctrl jump -t "Arch Updates" /bin/sh -c "yay;read"
}
[[ -n $(command -v checkupdates) ]] && checkupdates || sudo pacman -Fy
n=$(yay -Qu | wc -l)
[[ ${n} -gt 0 ]] && echo "${n}"
