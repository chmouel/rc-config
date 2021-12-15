#!/usr/bin/env bash
[[ ${1} == yay ]] && {
    cd /tmp
    kitty --class=floater -- /bin/bash -c "yay;echo;read -p 'Press a Key to exit....'" &
    exit
}
n=$(yay -Qu | wc -l)
[[ ${n} > 0 ]] && echo " ${n}"
