#!/bin/bash
set -e

cd "$( dirname "${BASH_SOURCE[0]}" )/.."

DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"

cat ./gnome-extensions-settings/$2 | dconf load $1

# writing the state line
echo  # an empty line here so the next line will be the last.
echo "changed=yes comment='Applied $2 to $1' user='$(whoami)'"
exit 0