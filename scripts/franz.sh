#!/bin/bash

INSTALLED=$(dpkg -s franz | grep Version)
retVal=$?
if [ $retVal -eq 0 ]; then
    echo "Already installed"
    echo
	echo "changed=no comment='Franz already installed: $INSTALLED'"

	exit 0
fi

set -e

URL=$(curl -L https://github.com/meetfranz/franz/releases/latest |  grep -oE 'href=.*?franz_5.*?_amd64.deb' | grep -oE '/.*?$')
URL="https://github.com$URL"

echo "Using URL: $URL"

cd /tmp

curl -L $URL -o franz.deb

dpkg -i franz.deb

rm -f /tmp/franz.deb

echo
echo "changed=yes comment='Franz installed from $URL'"

exit 0