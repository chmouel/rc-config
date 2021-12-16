#!/usr/bin/env bash
exec 19>/tmp/.start.stumpwm
BASH_XTRACEFD=19
set -x

HDMI=""
xrandr -q |grep -q "HDMI.* connected" && HDMI="YES"
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
      if [[ ${HDMI} == "YES" && ${m} != HDMI* ]];then
          xrandr --output ${m} --off
          continue
      fi
      export MONITOR=${m}
      break
  done
fi

setxkbmap -option "ctrl:nocaps"
xinput set-prop 12 "libinput Tapping Enabled" 1
xinput set-prop 12 "libinput Accel Speed" 0.5

xsetroot -cursor_name left_ptr

cd /tmp


[[ -n $(command -v picom) ]]  && nohup picom --no-fading-openclose  &
[[ -n $(command -v nm-applet) ]]  && nohup nm-applet  &
[[ -n $(command -v xsettingsd) ]] && nohup xsettingsd  &
[[ -n $(command -v dunst) ]] && nohup dunst &
[[ -n $(command -v bubblemaild) ]] && nohup bubblemaild &
[[ -n $(command -v alttab) ]] && nohup alttab -i 128x128 -t 128x128 -frame '#282a36' -bw 1 -bc '#bd93f9' &

cd $HOME

# since we are already on a gnome vibe, lets use gnome-keyring as our
# ssh-agent, as a bonus it will give to sensible applications access to ssh
# keys, password lists, etc
eval $(/usr/bin/gnome-keyring-daemon --daemonize --login --start --components=gpg,pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
export GPG_AGENT_INFO
export GNOME_KEYRING_CONTROL
export GNOME_KEYRING_PID

#$HOME/.config/polybar/launch.sh
#exec dbus-launch --exit-with-session stumpwm
exec stumpwm
