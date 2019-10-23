#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar > /dev/null; do
  sleep 1
done

if xrandr | grep "HDMI1 connected"; then
    MONITOR=HDMI1 polybar top &
    polybar external_top &
else
    MONITOR=eDP1 polybar top &
fi

polybar top -c ~/.config/polybar/config-top.ini &
polybar bottom -c ~/.config/polybar/config-bottom.ini &
