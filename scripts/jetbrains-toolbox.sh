#!/bin/bash
set -e

RUNNING=$(ps waux  | grep [j]etbrains-toolbox | grep -v salt | wc -l)

if [ "$RUNNING" -gt "0" ]; then
	# writing the state line
	echo  # an empty line here so the next line will be the last.
	echo "changed=no comment='Proccess called jetbrains-toolbox is already running suggesting it is already installed'"
	exit 0
fi

URL=https://download-cf.jetbrains.com/toolbox/jetbrains-toolbox-1.13.4801.tar.gz
DIR=/tmp/jt
FILE=/tmp/jt/jt.tar.gz

mkdir -p $DIR

curl $URL -f --output $FILE

cd $DIR
tar xzvf jt.tar.gz

cd jetbrains*
nohup ./jetbrains-toolbox &>/dev/null &

# writing the state line
echo  # an empty line here so the next line will be the last.
echo "changed=yes comment='Toolbox installed from $URL'"
