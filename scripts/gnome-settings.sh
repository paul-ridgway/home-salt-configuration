#!/bin/bash
set -e

RUID=paul
RUSER_UID=$(id -u ${RUID})

declare -A CONFIG
CONFIG[org.gnome.desktop.wm.keybindings begin-resize]="[]"
CONFIG[org.gnome.desktop.wm.keybindings begin-move]="[]"
CONFIG[org.gnome.shell.keybindings toggle-message-tray]="[]"
CONFIG[org.gnome.settings-daemon.plugins.media-keys home]="<Super>e"
CONFIG[org.gnome.settings-daemon.plugins.media-keys terminal]="<Super>t"
CONFIG[org.gnome.settings-daemon.plugins.media-keys www]="<Super>w"
CONFIG[org.gnome.desktop.background show-desktop-icons]="false"
CONFIG[org.gnome.desktop.wm.preferences mouse-button-modifier]="[]"
CONFIG[org.gnome.mutter overlay-key]="Super_R"

TODO: ADD THESE
290c290
< org.gnome.ControlCenter last-panel 'display'
---
> org.gnome.ControlCenter last-panel 'color'
845c845
< org.gnome.mutter overlay-key 'Super_L'
---
> org.gnome.mutter overlay-key 'Super_R'
865c865
< org.gnome.desktop.calendar show-weekdate false
---
> org.gnome.desktop.calendar show-weekdate true
895c895
< org.gnome.desktop.interface clock-show-seconds false
---
> org.gnome.desktop.interface clock-show-seconds true
899c899
< org.gnome.desktop.interface enable-animations true
---
> org.gnome.desktop.interface enable-animations false
904c904
< org.gnome.desktop.interface icon-theme 'Yaru'
---
> org.gnome.desktop.interface icon-theme 'Numix-Circle'
916c916
< org.gnome.desktop.interface gtk-theme 'Yaru'
---
> org.gnome.desktop.interface gtk-theme 'Numix'
921c921
< org.gnome.desktop.interface show-battery-percentage false
---
> org.gnome.desktop.interface show-battery-percentage true
924c924
< org.gnome.desktop.interface clock-show-date false
---
> org.gnome.desktop.interface clock-show-date true
1008c1008
< org.gtk.Settings.FileChooser window-position (334, 81)
---
> org.gtk.Settings.FileChooser window-position (2254, 75)




echo "User: $RUID / $RUSER_UID"

COUNTER=0
CHANGED=no
for K in "${!CONFIG[@]}"; do 
	echo "Checking Key: $K"
	V=${CONFIG[$K]}
	X=$(gsettings get $K | sed 's/@as //g' | sed s/\'//g)
	if [ "$X" != "$V" ]; then
		echo "Key needs to changing from $X to $V"
		# Reset clears any bad bindings before (if done from another user)
		sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings reset $K
		sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set $K $V
		COUNTER=$[$COUNTER +1]
		CHANGED=yes
	fi
done

# writing the state line
echo  # an empty line here so the next line will be the last.
echo "changed=$CHANGED comment='Updated $COUNTER shortcuts' user='$CURRENT_USER'"
exit 0