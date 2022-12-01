#!/bin/bash

killall -q polybar

#wait for process to end
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

#launch polybar
polybar bar1 

echo "Polybar launched..."
