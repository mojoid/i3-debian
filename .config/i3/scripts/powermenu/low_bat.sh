#!/bin/bash
source $HOME/.config/i3/.idesktop

while true; do

	battery_level="echo -e `cat /sys/class/power_supply/BAT1/capacity`"
	ac_power=`cat /sys/class/power_supply/BAT1/status`
	cpu_tmp="echo -e `cat /sys/class/thermal/thermal_zone*/temp | cut -c 1-2`\u00b0C"
	
	if [ `$battery_level` -le 30 ] && [ $ac_power = Discharging ]
	then
		sleep 4
		$NOTIFIER -i "$ICONDIR/info.png" -t 7500 "CPU `$cpu_tmp`" "Low battery: `$battery_level`%\nPlug your charger !"
		# low bat
	elif [ `$battery_level` -ge 100 ] && [ $ac_power = Charging ]
	then
		sleep 4
		$NOTIFIER -i "$ICONDIR/info.png" -t 7500 "CPU `$cpu_tmp`" "Battery Full: `$battery_level`%\nUnplug your charger !"
		# full bat
	fi
sleep 1
done
