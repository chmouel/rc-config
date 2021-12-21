#!/usr/bin/env bash
exec 19>/tmp/.start.stumpwm
BASH_XTRACEFD=19
set -x

function disable_laptop_screen() {
    local hdmi_monitor=""
    xrandr -q |grep -q "hdmi_monitor.* connected" && hdmi_monitor="YES"
    if [[ -z $(command -v xrandr) ]]; then
        return
    fi
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        if [[ ${hdmi_monitor} == "YES" && ${m} != HDMI* ]];then
            xrandr --output ${m} --off
            continue
        fi
    done
}
disable_laptop_screen

setxkbmap -option "ctrl:nocaps"
xinput set-prop 12 "libinput Tapping Enabled" 1
xinput set-prop 12 "libinput Accel Speed" 0.5

xsetroot -cursor_name left_ptr

cd /tmp || exit

# [[ -n $(command -v picom) ]]  && nohup picom --no-fading-openclose  &
[[ -n $(command -v nm-applet) ]]  && nohup nm-applet  &
[[ -n $(command -v xsettingsd) ]] && nohup xsettingsd  &
[[ -n $(command -v dunst) ]] && nohup dunst &
[[ -x /usr/lib/gpaste/gpaste-daemon && -z $(pgrep gpaste-daemon) ]] && nohup /usr/lib/gpaste/gpaste-daemon &
[[ -x /usr/lib/goa-daemon ]] && nohup /usr/lib/goa-daemon --replace &
[[ -n $(command -v gnome-next-meeting-applet) ]] && nohup gnome-next-meeting-applet &

cd $HOME || exit

# since we are already on a gnome vibe, lets use gnome-keyring as our
# ssh-agent, as a bonus it will give to sensible applications access to ssh
# keys, password lists, etc
eval $(/usr/bin/gnome-keyring-daemon --daemonize --login --start --components=gpg,pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
export GPG_AGENT_INFO
export GNOME_KEYRING_CONTROL
export GNOME_KEYRING_PID

exec i3
