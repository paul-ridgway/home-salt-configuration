#!/bin/bash
set -x
set -e

URL=$(curl -L https://github.com/meetfranz/franz/releases/latest |  grep -oE 'href=.*?franz_5.0.0_amd64.deb' | grep -oE '/.*?$')
URL="https://github.com$URL"

echo "Using URL: $URL"

cd /tmp

curl -L $URL -o franz.deb

dpkg -i franz.deb

rm -f /tmp/franz.deb

echo
echo "changed=yes comment='Franz installed from $URL'"

exit 0