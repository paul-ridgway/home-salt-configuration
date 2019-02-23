#!/bin/bash
set -x
set -e

RUID=paul
RUSER_UID=$(id -u ${RUID})

declare -A CONFIG
CONFIG[org.gnome.desktop.wm.keybindings begin-resize]="[]"
CONFIG[org.gnome.desktop.wm.keybindings begin-move]="[]"
CONFIG[org.gnome.shell.keybindings toggle-message-tray]="[]"
CONFIG[org.gnome.settings-daemon.plugins.media-keys home]="<Super>e"
CONFIG[org.gnome.settings-daemon.plugins.media-keys terminal]="<Super>t"

COUNTER=0
CHANGED=no
for K in "${!CONFIG[@]}"; do 
	echo "Checking Key: $K"
	V=${CONFIG[$K]}
	X=$(gsettings get $K | sed 's/@as //g' | sed s/\'//g)
	if [ "$X" != "$V" ]; then
		echo "Key needs to changing from $X to $V"
		sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set $K $V
		COUNTER=$[$COUNTER +1]
		CHANGED=yes
	fi
done

# writing the state line
echo  # an empty line here so the next line will be the last.
echo "changed=$CHANGED comment='Updated $COUNTER shortcuts' user='$CURRENT_USER'"
exit 0