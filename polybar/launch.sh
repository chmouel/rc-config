#!/bin/bash

DEFAULT_NETWORK_INTERFACE=$(ip route | grep '^default' | awk '{print $5}' | head -n1)

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
