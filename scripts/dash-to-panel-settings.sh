#!/bin/bash
set -e

declare -A CONFIG

CONFIG['/org/gnome/shell/extensions/dash-to-panel/focus-highlight-color']='#eeeeee'
CONFIG['/org/gnome/shell/extensions/dash-to-panel/hotkeys-overlay-combo']='TEMPORARILY'
CONFIG['/org/gnome/shell/extensions/dash-to-panel/trans-dynamic-anim-target']='1.0'
CONFIG['/org/gnome/shell/extensions/dash-to-panel/trans-use-custom-gradient']='true'
CONFIG['/org/gnome/shell/extensions/dash-to-panel/dot-color-unfocused-1']='#5294e2'
CONFIG['/org/gnome/shell/extensions/dash-to-panel/dot-color-unfocused-2']='#5294e2'
CONFIG['/org/gnome/shell/extensions/dash-to-panel/dot-color-unfocused-3']='#5294e2'
CONFIG['/org/gnome/shell/extensions/dash-to-panel/dot-color-unfocused-4']='#5294e2'
CONFIG['/org/gnome/shell/extensions/dash-to-panel/focus-highlight']='true'
CONFIG['/org/gnome/shell/extensions/dash-to-panel/trans-dynamic-anim-time']='250'
CONFIG['/org/gnome/shell/extensions/dash-to-panel/show-appmenu']='false'
CONFIG['/org/gnome/shell/extensions/dash-to-panel/show-show-apps-button']='false'
CONFIG['/org/gnome/shell/extensions/dash-to-panel/group-apps']='false'
CONFIG['/org/gnome/shell/extensions/dash-to-panel/trans-gradient-bottom-opacity']='0.0'
CONFIG['/org/gnome/shell/extensions/dash-to-panel/trans-use-dynamic-opacity']='true'
CONFIG['/org/gnome/shell/extensions/dash-to-panel/dot-color-1']='#5294e2'
CONFIG['/org/gnome/shell/extensions/dash-to-panel/dot-color-2']='#5294e2'
CONFIG['/org/gnome/shell/extensions/dash-to-panel/dot-color-3']='#5294e2'
CONFIG['/org/gnome/shell/extensions/dash-to-panel/dot-position']='BOTTOM'
CONFIG['/org/gnome/shell/extensions/dash-to-panel/dot-color-4']='#5294e2'
CONFIG['/org/gnome/shell/extensions/dash-to-panel/stockgs-keep-dash']='false'
CONFIG['/org/gnome/shell/extensions/dash-to-panel/trans-panel-opacity']='0.59999999999999998'
CONFIG['/org/gnome/shell/extensions/dash-to-panel/show-favorites']='false'
CONFIG['/org/gnome/shell/extensions/dash-to-panel/panel-position']='TOP'
CONFIG['/org/gnome/shell/extensions/dash-to-panel/panel-size']='24'
CONFIG['/org/gnome/shell/extensions/dash-to-panel/trans-use-custom-opacity']='true'
CONFIG['/org/gnome/shell/extensions/dash-to-panel/trans-use-custom-bg']='true'
CONFIG['/org/gnome/shell/extensions/dash-to-panel/location-clock']='STATUSRIGHT'
CONFIG['/org/gnome/shell/extensions/dash-to-panel/multi-monitors']='false'
CONFIG['/org/gnome/shell/extensions/dash-to-panel/dot-style-focused']='DOTS'
CONFIG['/org/gnome/shell/extensions/dash-to-panel/appicon-padding']='2'
CONFIG['/org/gnome/shell/extensions/dash-to-panel/show-showdesktop-button']='false'
CONFIG['/org/gnome/shell/extensions/dash-to-panel/trans-dynamic-distance']='1'
CONFIG['/org/gnome/shell/extensions/dash-to-panel/show-window-previews']='false'
CONFIG['/org/gnome/shell/extensions/dash-to-panel/trans-dynamic-behavior']='MAXIMIZED_WINDOWS'
CONFIG['/org/gnome/shell/extensions/dash-to-panel/dot-style-unfocused']='DOTS'
CONFIG['/org/gnome/shell/extensions/dash-to-panel/appicon-margin']='2'


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