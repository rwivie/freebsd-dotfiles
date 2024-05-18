#!/usr/local/bin/bash

# Terminate already running bar instances
#killall -q polybar
# If all your bars have ipc enabled, you can also use 
 polybar-msg cmd quit

# Launch Polybar, using default config location ~/.config/polybar/config.ini
#echo "---" | tee -a /home/wickedlester/.polybar_t.log
#echo "---" | tee -a /home/wickedlester/.polybar_b.log
#polybar top 2>&1 | tee -a /home/wickedlester/.polybar_t.log & disown
#polybar bottom 2>&1 | tee -a /home/wickedlester/.polybar_b.log & disown

#echo "---" | tee -a /home/wickedlester/.polybar_t.log
#echo "---" | tee -a /home/wickedlester/.polybar_b.log
polybar -c ~/.config/dk/polybar/config.ini top 2>/home/ron/.polybar_t.log & disown
#polybar -c ~/.config/dk/polybar/config.ini bottom 2>/home/wickedlester/.polybar_b.log & disown

#echo "Polybar launched..."
