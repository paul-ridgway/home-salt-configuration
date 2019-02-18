#!/bin/bash
# set -x # remove
set -e

TARGET_USER=paul
CURRENT_USER=$(whoami)

echo "Current User: $CURRENT_USER"

if [ "$CURRENT_USER" != "$TARGET_USER" ]; then
	echo "Changing user to $TARGET_USER"
	SRC="$( dirname "${BASH_SOURCE[0]}" )$(basename "$0")"
	chmod 777 $SRC
	# su -l -c $SRC $TARGET_USER
	exit 0
fi

declare -A CONFIG
CONFIG[org.gnome.desktop.wm.keybindings begin-resize]="[]"
CONFIG[org.gnome.desktop.wm.keybindings begin-move]="[]"
CONFIG[org.gnome.shell.keybindings toggle-message-tray]="[]"
CONFIG[org.gnome.settings-daemon.plugins.media-keys home]="<Super>e"

COUNTER=0
CHANGED=no
for K in "${!CONFIG[@]}"; do 
	echo "Checking Key: $K"
	V=${CONFIG[$K]}
	X=$(gsettings get $K | sed 's/@as //g')
	if [ "$X" != "$V" ]; then
		echo "Key needs to changing from $X to $V"
		gsettings set $K $V
		COUNTER=$[$COUNTER +1]
		CHANGED=yes
	fi
done

# writing the state line
echo  # an empty line here so the next line will be the last.
echo "changed=$CHANGED comment='Updated $COUNTER shortcuts'"
exit 0