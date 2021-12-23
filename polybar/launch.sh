#!/usr/bin/env bash

export DEFAULT_NETWORK_INTERFACE=$(ip route|sed -n '/^default/ { s/.*dev //;s/ .*//;p;}')

HDMI=""
xrandr -q |grep -q "HDMI.* connected" && HDMI="YES"
if [[ -n $(command -v "xrandr") ]]; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
      if [[ ${HDMI} == "YES" && ${m} != HDMI* ]];then
          continue
      fi
      export MONITOR=${m}
      break
  done
fi

case $(hostnamectl hostname) in
    pignon)
        [[ $MONITOR != HDMI* ]] && export POLYBAR_FONT_SIZE=13
        ;;
    domac)
        export POLYBAR_FONT_SIZE=20
        ;;
esac

# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Terminate already running bar instances
killall -q polybar

sleep 2

# Launch Polybar, using default config location ~/.config/polybar/config
polybar --reload laptop 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."
