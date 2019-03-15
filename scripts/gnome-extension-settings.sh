#!/bin/bash
set -e

DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"

cat /srv/salt/gnome-extensions-settings/$2 | dconf load $1

echo $? 

# writing the state line
echo  # an empty line here so the next line will be the last.
echo "changed=yes comment='Applied $2 to $1' user='$(whoami)'"
exit 0