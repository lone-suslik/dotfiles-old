#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch main bar
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar main >>/tmp/polybar1.log 2>&1 &

# Launch dummy bar
#echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
#polybar dummy >>/tmp/polybar_dummy.log 2>&1 &


echo "Bars launched..."
