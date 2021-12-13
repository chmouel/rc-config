#!/usr/bin/env bash

xrandr -q |grep -q "HDMI-A-0 connected" && xrandr --output eDP --off
setxkbmap -option "ctrl:nocaps"
xinput set-prop 12 "libinput Tapping Enabled" 1
xinput set-prop 12 "libinput Accel Speed" 0.5

xsetroot -cursor_name left_ptr

cd /tmp; nohup picom --no-fading-openclose  &
cd /tmp; nohup nm-applet  &
cd /tmp; nohup xsettingsd  &
cd /tmp; nohup dunst &

# since we are already on a gnome vibe, lets use gnome-keyring as our
# ssh-agent, as a bonus it will give to sensible applications access to ssh
# keys, password lists, etc
eval $(/usr/bin/gnome-keyring-daemon --daemonize --login --start --components=gpg,pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
export GPG_AGENT_INFO
export GNOME_KEYRING_CONTROL
export GNOME_KEYRING_PID

cd $HOME

# $HOME/.config/polybar/launch.sh
#exec dbus-launch --exit-with-session stumpwm
exec stumpwm
