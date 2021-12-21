#!/bin/bash

# nmcli -t connect show --active|cut -d: -f4
export DEFAULT_NETWORK_INTERFACE=$(ip route|sed -n '/^default/ { s/.*dev //;s/ .*//;p;}')

HDMI=""
xrandr -q |grep -q "HDMI.* connected" && HDMI="YES"
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
      if [[ ${HDMI} == "YES" && ${m} != HDMI* ]];then
          continue
      fi
      export MONITOR=${m}
      break
  done
fi

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch Polybar, using default config location ~/.config/polybar/config
polybar laptop 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."
