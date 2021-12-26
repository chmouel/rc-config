#!/usr/bin/env bash
[[ ${1} == yay ]] && {
    cd /tmp || exit
    #kitty --title "Arch Updates" --class floater /bin/sh -c "yay;read"
    kitty-ctrl jump -t "Arch Updates" /bin/sh -c "yay;read"
}
if [[ -n $(command -v checkupdates) ]];then 
    n=$(checkupdates|wc -l)
else
    sudo pacman -Fy >/dev/null
    n=$(yay -Qu | wc -l)
fi

[[ ${n} -gt 0 ]] && echo "${n}"
