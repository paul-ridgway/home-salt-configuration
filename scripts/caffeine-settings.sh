#!/bin/bash
set -e

declare -A CONFIG
CONFIG['/org/gnome/shell/extensions/caffeine/show-indicator']="true"
CONFIG['/org/gnome/shell/extensions/caffeine/user-enabled']="true"

DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"

COUNTER=0
CHANGED=no
for K in "${!CONFIG[@]}"; do 
	echo "Checking Key: $K"
	V=${CONFIG[$K]}
	X=$(dconf read $K | sed 's/@as //g' | sed s/\'//g)
	if [ "$X" != "$V" ]; then
		echo "Key needs to changing from $X to $V"
		dconf write $K $V
		COUNTER=$[$COUNTER +1]
		CHANGED=yes
	fi
done

# writing the state line
echo  # an empty line here so the next line will be the last.
echo "changed=$CHANGED comment='Updated $COUNTER settings' user='$(whoami)'"
exit 0