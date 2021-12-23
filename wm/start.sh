#!/usr/bin/env bash
set -euf
exec 19>/tmp/.start.wmsession
BASH_XTRACEFD=19
set -x

export WMSESSION=${WMSESSION:="i3"}

[[ -n $(command -v autorandr) ]] && autorandr --change
[[ -n $(command -v setxkbmap) ]] && setxkbmap -option "ctrl:nocaps"
[[ -n $(command -v xmodmap) ]] && xmodmap -e "keycode 134 = Multi_key" -e "clear Lock"
[[ -n $(command -v xinput) ]] && {
    xinput set-prop 12 "libinput Tapping Enabled" 1 || true
    xinput set-prop 12 "libinput Accel Speed" 0.5 || true
}
[[ -n $(command -v xsetroot) ]] && xsetroot -cursor_name left_ptr

cd /tmp || exit

[[ -n $(command -v picom) && -z $(pgrep -x picom) ]]  && nohup picom --no-fading-openclose  --experimental-backend &
#[[ -n $(command -v nm-applet) && -z $(pgrep -x nm-applet)  ]]  && nohup nm-applet  &
[[ -n $(command -v xsettingsd) && -z $(pgrep -x xsettingsd)  ]] && nohup xsettingsd  &
[[ -n $(command -v dunst) && -z $(pgrep -x dunst) ]] && nohup dunst &
[[ -x /usr/lib/gpaste/gpaste-daemon && -z $(pgrep -x gpaste-daemon) ]] && nohup /usr/lib/gpaste/gpaste-daemon &
[[ -x /usr/lib/goa-daemon && -z $(pgrep -x goa-daemon) ]] && nohup /usr/lib/goa-daemon --replace &
[[ -n $(command -v gnome-next-meeting-applet) && -z $(pgrep -f gnome-next-meeting) ]] && nohup gnome-next-meeting-applet &

if [[ -n $(command -v xss-lock) && $(command -v i3lock) ]];then
    _locker="i3lock -c 000000 -f -e"
    [[ -n  $(command -v i3lock-fancy-rapid) ]] && _locker="i3lock-fancy-rapid 3 7"
    xset dpms 2000 2000 2000
    xset s 300 120
    [[ -z $(pgrep -x xss-lock) ]] && nohup xss-lock -- ${_locker} &
fi
cd $HOME || exit

# since we are already on a gnome vibe, lets use gnome-keyring as our
# ssh-agent, as a bonus it will give to sensible applications access to ssh
# keys, password lists, etc
if [[ -n $(command -v gnome-keyring-daemon) ]];then
    eval $(/usr/bin/gnome-keyring-daemon --daemonize --login --start --components=gpg,pkcs11,secrets,ssh)
    export SSH_AUTH_SOCK
    export GPG_AGENT_INFO
    export GNOME_KEYRING_CONTROL
    export GNOME_KEYRING_PID
fi 

[[ ${1:-""} == norun ]] && exit

if [[ -n $(command -v ${WMSESSION}) ]];then
    exec ${WMSESSION}
fi

exec kitty
