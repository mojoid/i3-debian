#!/usr/bin/bash
# send battery info to notify-send
source $HOME/.config/i3/.idesktop

infobatt="echo -e `cat /sys/class/power_supply/BAT1/{status,capacity}`%"
status_batt="echo -e `cat /sys/class/power_supply/BAT1/status`"
cpu_tmp="echo -e `cat /sys/class/thermal/thermal_zone*/temp | cut -c 1-2`\u00b0C"
capacity_batt="echo -e `cat /sys/class/power_supply/BAT1/capacity`"


#	if [[ `$capacity_batt` = 100 ]]; then
#		$NOTIFIER -i "$ICONDIR/info.png" -t 5000 "CPU `$cpu_tmp`" "Battery is Full: `${capacity_batt}`%"
	if [[ `$status_batt` = Charging ]]; then
		$NOTIFIER -i "$ICONDIR/info.png" -t 5000 "CPU `$cpu_tmp`" "Battery is `$infobatt`"
	elif [[ `$status_batt` = Discharging ]]; then
		$NOTIFIER -i "$ICONDIR/info.png" -t 5000 "CPU `$cpu_tmp`" "Battery is `$infobatt`"
	fi 

exit 
