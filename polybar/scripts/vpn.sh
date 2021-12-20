#!/usr/bin/env bash
info=$(nmcli -t connect show --active|awk -F: '{ if ($3 == "vpn") print $1; }')

if [[ ${1} == "click" ]];then
   if [[ -n ${info} ]];then
      nmcli connection down "${info}"
      notify-send -i /usr/share/icons/hicolor/scalable/apps/nm-signal-00-symbolic.svg "Disconnected to ${info}" "We have succesfully disconnected from ${info}"
   else
       info=$(nmcli -t connect show|awk -F: '{ if ($3 == "vpn") print $1; }')
       [[ -n ${info} ]] && {
           nmcli connection up "${info}"
       }
   fi
   exit
fi

[[ -n ${info} ]] && echo ${info}
