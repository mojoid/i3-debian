#!/usr/bin/bash


on_ac_power
PREVIOUS=$(echo $?)

while true
do
	on_ac_power
	CURRENT=$(echo $?)
		
		if [ $CURRENT -ne $PREVIOUS ]; then
				sleep 6
				echo `$HOME/.config/i3/scripts/powermenu/info_bat.sh`
				PREVIOUS=$(echo $CURRENT)
		elif [[ `$status_batt` = Discharging ]]; then
		sleep 6
				echo `$HOME/.config/i3/scripts/powermenu/info_bat.sh`
				PREVIOUS=$(echo $CURRENT)
		fi
sleep 1
done
